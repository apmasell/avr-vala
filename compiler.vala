/* valacompiler.vala
 *
 * Copyright (C) 2012  Andre Masella
 * Copyright (C) 2006-2010  Jürg Billeter
 * Copyright (C) 1996-2002, 2004, 2005, 2006 Free Software Foundation, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 *  Andre Masella <andre@masella.name>
 *  Jürg Billeter <j@bitron.ch>
 */

using Vala;

class Avr.CCodeInterrupt : CCodeNode {
	public string vector { get; private set; }
	public bool block { get; private set; }
	public string target { get; private set; }

	public CCodeInterrupt(string vector, bool block, string target) {
		base();
		this.vector = vector;
		this.block = block;
		this.target = target;
	}

	public override void write (CCodeWriter writer) {
		writer.write_string ("ISR(");
		writer.write_string (vector);
		writer.write_string (", ");
		writer.write_string (block ? "ISR_BLOCK" : "ISR_NOBLOCK");
		writer.write_string (") { ");
		writer.write_string (target);
		writer.write_string (" (); }");
		writer.write_newline ();
	}
}

class Avr.CodeGen : CCodeDelegateModule {
	/**
	 * Wrangle the cast from a method.callback to a SoureFunc delegate by inserting a NULL in the finished_context parameter.
	 */
	public override CCodeExpression get_implicit_cast_expression (CCodeExpression source_cexpr, DataType? expression_type, DataType? target_type, CodeNode? node) {
		if (expression_type != null && expression_type is MethodType && ((MethodType) expression_type).method_symbol.is_async_callback) {

			var method = ((MethodType) expression_type).method_symbol;
			var @delegate = ((DelegateType) target_type).delegate_symbol;
			string wrapper_name = "_%s_%s".printf (get_ccode_name (method), Symbol.camel_case_to_lower_case (get_ccode_name (@delegate)));
			stderr.printf("called on %s\n", wrapper_name);
			if (add_wrapper (wrapper_name)) {
				var function = new CCodeFunction (wrapper_name, "bool");
				function.modifiers = CCodeModifiers.STATIC;

				push_function (function);
				function.add_parameter (new CCodeParameter ("self", "gpointer"));
				var ccall = new CCodeFunctionCall (new CCodeIdentifier (get_ccode_name (method)));
				ccall.add_argument (new CCodeConstant ("NULL"));
				ccall.add_argument (new CCodeIdentifier ("self"));
				function.add_expression (ccall);
				function.add_return (new CCodeConstant ("false"));
				pop_function ();
				cfile.add_function_declaration (function);
				cfile.add_function (function);
			}
			return new CCodeIdentifier(wrapper_name);
		} else {
			return base.get_implicit_cast_expression(source_cexpr, expression_type, target_type, node);
		}
	}

	public override void visit_method_call (MethodCall expr) {
		var ma = expr.call as MemberAccess;
		var itype = expr.call.value_type;
		if (itype is MethodType) {
			assert (ma != null);
			var m = ((MethodType) itype).method_symbol;
			if (m.coroutine) {
				if (!Compiler.allow_async) {
					Report.error(expr.source_reference, "Asynchronous methods not enabled. Try --allow-async.");
				}
				int state = -1;
				if (ma.member_name == "begin" && ma.inner.symbol_reference == ma.symbol_reference || expr.is_yield_expression) {
					var ccall = new CCodeFunctionCall (new CCodeIdentifier (get_ccode_name (m)));

					var @params = expr.is_yield_expression ? m.get_parameters() : generate_params (expr, ParameterDirection.IN);
					if (!expr.is_yield_expression) {
						var ns = CodeContext.get ().root.scope.lookup ("GLib");
						var callback_type = new DelegateType ((Delegate) ns.scope.lookup ("AsyncReadyCallback"));
						callback_type.nullable = false;
						callback_type.is_called_once = true;

						var callback_param = new Vala.Parameter ("_callback_", callback_type);
						callback_param.initializer = new NullLiteral (expr.source_reference);
						callback_param.initializer.target_type = callback_type.copy ();
						callback_param.set_attribute_double ("CCode", "pos", -1);
						callback_param.set_attribute_double ("CCode", "delegate_target_pos", -0.9);
						@params.add(callback_param);
					}
					var carg_map = generate_arguments(expr, @params, ParameterDirection.IN);

					generate_call(expr, ccall, carg_map);
					if (expr.is_yield_expression) {
						ccall.add_argument(new CCodeCastExpression(new CCodeIdentifier(ccode.name), "AavrAsyncCallback"));
						ccall.add_argument(new CCodeIdentifier("_data_"));

						state = next_coroutine_state++;
						ccode.add_assignment (new CCodeMemberAccess.pointer (new CCodeIdentifier ("_data_"), "_state_"), new CCodeConstant (state.to_string ()));
						ccode.add_expression(ccall);
					} else {
						ccode.add_expression(ccall);
						return;
					}
				}
				if (expr.is_yield_expression) {
					ccode.add_expression(new CCodeIdentifier("return"));
					ccode.add_label ("_state_%d".printf (state));
				}

				if (ma.member_name == "end" && ma.inner.symbol_reference == ma.symbol_reference || expr.is_yield_expression) {
					var ccall = new CCodeFunctionCall (new CCodeIdentifier (get_ccode_finish_name (m)));
					var @params = expr.is_yield_expression ? m.get_parameters() : generate_params (expr, ParameterDirection.OUT);
					if (!expr.is_yield_expression) {
						var ns = CodeContext.get ().root.scope.lookup ("GLib");
						var finish_context_type = new ObjectType ((ObjectTypeSymbol) ns.scope.lookup ("AsyncResult"));
						finish_context_type.nullable = false;

						var finish_context_param = new Vala.Parameter ("_finish_context_", finish_context_type);
						finish_context_param.initializer = new NullLiteral (expr.source_reference);
						finish_context_param.initializer.target_type = finish_context_type.copy ();
						finish_context_param.set_attribute_double ("CCode", "pos", 0.1);
						@params.add(finish_context_param);
					}
					var carg_map = generate_arguments(expr, @params, ParameterDirection.OUT);

					if (expr.is_yield_expression) {
						carg_map.set (get_param_pos (0.1), new CCodeIdentifier ("_finish_context_"));
					}

					generate_call(expr, ccall, carg_map);
					set_cvalue(expr, ccall);
				}
				return;
			}
		}
		base.visit_method_call (expr);
	}

	public override void visit_method (Method m) {
		cfile.add_include ("avr-glib.h");
		if (m.coroutine) {
			if (!Compiler.allow_async) {
				Report.error(m.source_reference, "Asynchronous methods not enabled. Try --allow-async.");
			}
			if (m.is_abstract || m.is_virtual || is_variadic (m) || m is CreationMethod || m is DynamicMethod) {
				Report.error(m.source_reference, "Asynchronous methods cannot be abstract, virtual, constructor or dynamic methods.");
				return;
			}

			cfile.add_include ("aavr.h");
			if (!m.is_internal_symbol ()) {
				header_file.add_include ("aavr.h");
			}

			closure_struct = generate_data_struct (m);

			generate_async_function (m);
			generate_finish_function (m);

			push_context (new EmitContext (m));
			push_line (m.source_reference);

			next_coroutine_state = 1;
			var creturn_type = m.return_type;
			if (m.return_type.is_real_non_null_struct_type ()) {
				creturn_type = new VoidType ();
			}

			foreach (var param in m.get_parameters ()) {
				param.accept (this);
			}
			var function = new CCodeFunction (get_ccode_real_name (m) + "_co", "void");
			function.add_parameter (new CCodeParameter ("_finish_context_", "void*"));
			function.add_parameter (new CCodeParameter ("_data_", Symbol.lower_case_to_camel_case (get_ccode_const_name (m)) + "Data*"));
			function.modifiers |= CCodeModifiers.STATIC;
			cfile.add_function_declaration (function);

			if (m.is_inline) {
				function.modifiers |= CCodeModifiers.INLINE;
			}

			push_function (function);
			ccode.open_switch (new CCodeMemberAccess.pointer (new CCodeIdentifier ("_data_"), "_state_"));

			// initial coroutine state
			ccode.add_case (new CCodeConstant ("0"));
			ccode.add_goto ("_state_0");

			for (int state = 1; state <= m.yield_count; state++) {
				ccode.add_case (new CCodeConstant (state.to_string ()));
				ccode.add_goto ("_state_%d".printf (state));
			}
			// let gcc know that this can't happen
			ccode.add_default ();
			ccode.add_expression (new CCodeFunctionCall (new CCodeIdentifier ("g_assert_not_reached")));

			ccode.close ();

			// coroutine body
			ccode.add_label ("_state_0");

			if (m.closure) {
				// add variables for parent closure blocks
				// as closures only have one parameter for the innermost closure block
				var closure_block = current_closure_block;
				int block_id = get_block_id (closure_block);
				while (true) {
					var parent_closure_block = next_closure_block (closure_block.parent_symbol);
					if (parent_closure_block == null) {
						closure_struct.add_field("Block%dData*".printf (block_id), "_data%d_".printf (block_id));
						break;
					}
					int parent_block_id = get_block_id (parent_closure_block);
					var parent_data = new CCodeMemberAccess.pointer (new CCodeIdentifier ("_data%d_".printf (block_id)), "_data%d_".printf (parent_block_id));
					ccode.add_declaration ("Block%dData*".printf (parent_block_id), new CCodeVariableDeclarator ("_data%d_".printf (parent_block_id)));
					ccode.add_assignment (new CCodeIdentifier ("_data%d_".printf (parent_block_id)), parent_data);

					closure_block = parent_closure_block;
					block_id = parent_block_id;
				}

				// add self variable for closures
				// as closures have block data parameter
				if (m.binding == MemberBinding.INSTANCE) {
					var cself = new CCodeMemberAccess.pointer (new CCodeIdentifier ("_data%d_".printf (block_id)), "self");
					ccode.add_declaration ("%s *".printf (get_ccode_name (current_type_symbol)), new CCodeVariableDeclarator ("self"));
					ccode.add_assignment (new CCodeIdentifier ("self"), cself);
				}

				// allow capturing generic type parameters
				foreach (var type_param in m.get_type_parameters ()) {
					string func_name;

					func_name = "%s_dup_func".printf (type_param.name.down ());
					ccode.add_declaration ("GBoxedCopyFunc", new CCodeVariableDeclarator (func_name));
					ccode.add_assignment (new CCodeIdentifier (func_name), new CCodeMemberAccess.pointer (get_variable_cexpression ("_data%d_".printf (block_id)), func_name));

					func_name = "%s_destroy_func".printf (type_param.name.down ());
					ccode.add_declaration ("GDestroyNotify", new CCodeVariableDeclarator (func_name));
					ccode.add_assignment (new CCodeIdentifier (func_name), new CCodeMemberAccess.pointer (get_variable_cexpression ("_data%d_".printf (block_id)), func_name));
				}
			}

			m.body.emit (this);
			var data_var = new CCodeIdentifier("_data_");
			var call_parent = new CCodeFunctionCall (new CCodeMemberAccess.pointer (data_var, "_callback_"));
			call_parent.add_argument (data_var);
			call_parent.add_argument (new CCodeMemberAccess.pointer (data_var, "_callback_data_"));
			function.add_expression(call_parent);
			function.add_return();
			pop_function ();
			cfile.add_function (function);
			pop_context ();

			var typename = new CCodeVariableDeclarator (closure_struct.name.substring (1));
			var typedef = new CCodeTypeDefinition ("struct " + closure_struct.name, typename);
			cfile.add_type_definition (typedef);
			cfile.add_type_declaration (closure_struct);

			pop_line ();
		} else {
			base.visit_method (m);
			var attr = m.get_attribute ("Interrupt");
			if (attr != null && !m.external_package) {
				if (m.binding == MemberBinding.INSTANCE)
					Report.error (m.source_reference, "Interrupts cannot be instance methods.");
				if (!(m.return_type is VoidType))
					Report.error (m.source_reference, "Interrupts must return void.");
				if (m.get_parameters ().size > 0)
					Report.error (m.source_reference, "Interrupts must take no parameters.");
				if (m.get_error_types ().size > 0)
					Report.error (m.source_reference, "Interrupts must not throw error domains.");
				if (m.access != SymbolAccessibility.PUBLIC) {
					Report.warning (m.source_reference, "Interrupts should be public.");
				}

				cfile.add_type_member_definition(new CCodeInterrupt (attr.get_string("vector"), attr.get_bool ("block", true), get_ccode_name (m)));
			}
		}
	}

	public override void visit_yield_statement (YieldStatement stmt) {
		if (!is_in_coroutine ()) {
			return;
		}

		if (stmt.yield_expression == null) {
			int state = next_coroutine_state++;

			ccode.add_assignment (new CCodeMemberAccess.pointer (new CCodeIdentifier ("_data_"), "_state_"), new CCodeConstant (state.to_string ()));
			ccode.add_return ();
			ccode.add_label ("_state_%d".printf (state));
			ccode.add_statement (new CCodeEmptyStatement ());

			return;
		}

		ccode.add_expression (get_cvalue (stmt.yield_expression));

		foreach (var value in temp_ref_values) {
			ccode.add_expression (destroy_value (value));
		}

		temp_ref_values.clear ();
	}

	Map<int, CCodeExpression> generate_arguments (MethodCall expr, Vala.List<Vala.Parameter> @params, ParameterDirection dir) {
		var m = ((MethodType) expr.call.value_type).method_symbol;
		var ma = expr.call as MemberAccess;
		int i = 1;
		int arg_pos;
		var carg_map = new HashMap<int,CCodeExpression> (direct_hash, direct_equal);

		var params_it = @params.iterator ();
		foreach (Expression arg in expr.get_argument_list ()) {
			CCodeExpression cexpr = get_cvalue (arg);

			if (params_it.next ()) {
				var param = params_it.get ();
				if (param.direction != dir && param.name != "_finish_context_")
					continue;

				var unary = arg as UnaryExpression;
				if (unary == null || unary.operator != UnaryOperator.OUT) {
					if (get_ccode_array_length (param) && param.variable_type is ArrayType) {
						var array_type = (ArrayType) param.variable_type;
						for (int dim = 1; dim <= array_type.rank; dim++) {
							CCodeExpression? array_length_expr = null;
							if (get_ccode_array_length_type (param) != null) {
								array_length_expr = new CCodeCastExpression (get_array_length_cexpression (arg, dim), get_ccode_array_length_type (param));
							} else {
								array_length_expr = get_array_length_cexpression (arg, dim);
							}
							carg_map.set (get_param_pos (get_ccode_array_length_pos (param) + 0.01 * dim), array_length_expr);
						}
					} else if (param.variable_type is DelegateType) {
						var deleg_type = (DelegateType) param.variable_type;
						var d = deleg_type.delegate_symbol;
						if (d.has_target) {
							CCodeExpression delegate_target_destroy_notify;
							var delegate_target = get_delegate_target_cexpression (arg, out delegate_target_destroy_notify);
							assert (delegate_target != null);
							carg_map.set (get_param_pos (get_ccode_delegate_target_pos (param)), delegate_target);
							if (deleg_type.value_owned) {
								assert (delegate_target_destroy_notify != null);
								carg_map.set (get_param_pos (get_ccode_delegate_target_pos (param) + 0.01), delegate_target_destroy_notify);
							}
						}
					} else if (param.variable_type is MethodType) {
						// callbacks in dynamic method calls
						CCodeExpression delegate_target_destroy_notify;
						carg_map.set (get_param_pos (get_ccode_delegate_target_pos (param)), get_delegate_target_cexpression (arg, out delegate_target_destroy_notify));
					} else if (param.variable_type is GenericType) {
						if (m != null && get_ccode_simple_generics (m)) {
							var generic_type = (GenericType) param.variable_type;
							int type_param_index = m.get_type_parameter_index (generic_type.type_parameter.name);
							var type_arg = ma.get_type_arguments ().get (type_param_index);
							if (param.variable_type.value_owned) {
								if (requires_copy (type_arg)) {
									carg_map.set (get_param_pos (get_ccode_destroy_notify_pos (param)), get_destroy_func_expression (type_arg));
								} else {
									carg_map.set (get_param_pos (get_ccode_destroy_notify_pos (param)), new CCodeConstant ("NULL"));
								}
							}
						}
					}

					cexpr = handle_struct_argument (param, arg, cexpr);
				} else {
					arg.target_value = null;

					var temp_var = get_temp_variable (param.variable_type, param.variable_type.value_owned);
					emit_temp_var (temp_var);
					set_cvalue (arg, get_variable_cexpression (temp_var.name));
					arg.target_value.value_type = arg.target_type;

					cexpr = new CCodeUnaryExpression (CCodeUnaryOperator.ADDRESS_OF, get_cvalue (arg));

					if (get_ccode_array_length (param) && param.variable_type is ArrayType) {
						var array_type = (ArrayType) param.variable_type;
						var array_length_type = int_type;
						if (get_ccode_array_length_type (param) != null) {
							array_length_type = new CType (get_ccode_array_length_type (param));
						}
						for (int dim = 1; dim <= array_type.rank; dim++) {
							var temp_array_length = get_temp_variable (array_length_type);
							emit_temp_var (temp_array_length);
							append_array_length (arg, get_variable_cexpression (temp_array_length.name));
							carg_map.set (get_param_pos (get_ccode_array_length_pos (param) + 0.01 * dim), new CCodeUnaryExpression (CCodeUnaryOperator.ADDRESS_OF, get_array_lengths (arg).get (dim - 1)));
						}
					} else if (param.variable_type is DelegateType) {
						var deleg_type = (DelegateType) param.variable_type;
						var d = deleg_type.delegate_symbol;
						if (d.has_target) {
							temp_var = get_temp_variable (new PointerType (new VoidType ()));
							emit_temp_var (temp_var);
							set_delegate_target (arg, get_variable_cexpression (temp_var.name));
							carg_map.set (get_param_pos (get_ccode_delegate_target_pos (param)), new CCodeUnaryExpression (CCodeUnaryOperator.ADDRESS_OF, get_delegate_target (arg)));
							if (deleg_type.value_owned) {
								temp_var = get_temp_variable (gdestroynotify_type);
								emit_temp_var (temp_var);
								set_delegate_target_destroy_notify (arg, get_variable_cexpression (temp_var.name));
								carg_map.set (get_param_pos (get_ccode_delegate_target_pos (param) + 0.01), new CCodeUnaryExpression (CCodeUnaryOperator.ADDRESS_OF, get_delegate_target_destroy_notify (arg)));
							}
						}
					}
				}

				if (get_ccode_type (param) != null) {
					cexpr = new CCodeCastExpression (cexpr, get_ccode_type (param));
				}
			arg_pos = get_param_pos (get_ccode_pos (param), false);
		} else {
			// default argument position
			cexpr = handle_struct_argument (null, arg, cexpr);
			arg_pos = get_param_pos (i, false);
		}

		carg_map.set (arg_pos, cexpr);

		i++;
	}
	return carg_map;
	}

	void generate_async_function (Method m) {
		push_context (new EmitContext ());

		var dataname = Symbol.lower_case_to_camel_case (get_ccode_name (m)) + "Data";
		var asyncfunc = new CCodeFunction (get_ccode_real_name (m), "void");
		var cparam_map = new HashMap<int,CCodeParameter> (direct_hash, direct_equal);

		cparam_map.set (get_param_pos (-1), new CCodeParameter ("_callback_", "AavrAsyncCallback"));
		cparam_map.set (get_param_pos (-0.9), new CCodeParameter ("_callback_data_", "void*"));

		generate_cparameters (m, cfile, cparam_map, asyncfunc, null, null, null, 1);

		push_function (asyncfunc);

		var dataalloc = new CCodeFunctionCall (new CCodeIdentifier ("g_slice_new0"));
		dataalloc.add_argument (new CCodeIdentifier (dataname));

		var data_var = new CCodeIdentifier ("_data_");

		ccode.add_declaration (dataname + "*", new CCodeVariableDeclarator ("_data_"));
		ccode.add_assignment (data_var, dataalloc);

		ccode.add_assignment (new CCodeMemberAccess.pointer (data_var, "_callback_"), new CCodeIdentifier("_callback_"));
		ccode.add_assignment (new CCodeMemberAccess.pointer (data_var, "_callback_data_"), new CCodeIdentifier("_callback_data_"));

		if (m.binding == MemberBinding.INSTANCE) {
			var this_type = m.this_parameter.variable_type.copy ();
			this_type.value_owned = true;

			// create copy if necessary as variables in async methods may need to be kept alive
			CCodeExpression cself = new CCodeIdentifier ("self");
			if (this_type.is_real_non_null_struct_type ()) {
				cself = new CCodeUnaryExpression (CCodeUnaryOperator.POINTER_INDIRECTION, cself);
			}
			if (requires_copy (this_type))  {
				cself = get_cvalue_ (copy_value (new GLibValue (m.this_parameter.variable_type, cself, true), m.this_parameter));
			}

			ccode.add_assignment (new CCodeMemberAccess.pointer (data_var, "self"), cself);
		}

		emit_context.push_symbol (m);
		foreach (var param in m.get_parameters ()) {
			if (param.direction != ParameterDirection.OUT) {
				// create copy if necessary as variables in async methods may need to be kept alive
				var old_captured = param.captured;
				param.captured = false;
				current_method.coroutine = false;

				TargetValue value;
				if (param.variable_type.value_owned) {
					// do not use load_parameter for reference/ownership transfer
					// otherwise delegate destroy notify will not be moved
					value = get_parameter_cvalue (param);
				} else  {
					value = load_parameter (param);
				}

				current_method.coroutine = true;

				store_parameter (param, value);

				param.captured = old_captured;
			}
		}
		emit_context.pop_symbol ();

		foreach (var type_param in m.get_type_parameters ()) {
			var dup_func = "%s_dup_func".printf (type_param.name.down ());
			var destroy_func = "%s_destroy_func".printf (type_param.name.down ());
			ccode.add_assignment (new CCodeMemberAccess.pointer (data_var, dup_func), new CCodeIdentifier (dup_func));
			ccode.add_assignment (new CCodeMemberAccess.pointer (data_var, destroy_func), new CCodeIdentifier (destroy_func));
		}

		var ccall = new CCodeFunctionCall (new CCodeIdentifier (get_ccode_real_name (m) + "_co"));
		ccall.add_argument (new CCodeIdentifier ("NULL"));
		ccall.add_argument (data_var);
		ccode.add_expression (ccall);

		cfile.add_function_declaration (asyncfunc);
		cfile.add_function (asyncfunc);

		pop_context ();
	}

	void generate_call (MethodCall expr, CCodeFunctionCall ccall, Vala.Map<int, CCodeExpression> carg_map) {
		int last_pos;
		int min_pos;

			last_pos = -1;
			while (true) {
				min_pos = -1;
				foreach (int pos in carg_map.get_keys ()) {
					if (pos > last_pos && (min_pos == -1 || pos < min_pos)) {
						min_pos = pos;
					}
				}
				if (min_pos == -1) {
					break;
				}
				ccall.add_argument (carg_map.get (min_pos));
				last_pos = min_pos;
			}
	}

	CCodeStruct generate_data_struct (Method m) {
		string dataname = Symbol.lower_case_to_camel_case (get_ccode_name (m)) + "Data";
		var data = new CCodeStruct ("_" + dataname);

		data.add_field ("int", "_state_");
		data.add_field ("AavrAsyncCallback", "_callback_");
		data.add_field ("void*", "_callback_data_");

		if (m is CreationMethod) {
			data.add_field ("GType", "object_type");
		}

		if (m.binding == MemberBinding.INSTANCE) {
			var type_sym = (TypeSymbol) m.parent_symbol;
			if (type_sym is ObjectTypeSymbol) {
				data.add_field (get_ccode_name (type_sym) + "*", "self");
			} else {
				data.add_field (get_ccode_name (type_sym), "self");
			}
		}

		foreach (var param in m.get_parameters ()) {
			bool is_unowned_delegate = param.variable_type is DelegateType && !param.variable_type.value_owned;

			var param_type = param.variable_type.copy ();
			param_type.value_owned = true;
			data.add_field (get_ccode_name (param_type), get_variable_cname (param.name));

			if (param.variable_type is ArrayType) {
				var array_type = (ArrayType) param.variable_type;
				if (get_ccode_array_length (param)) {
					for (int dim = 1; dim <= array_type.rank; dim++) {
						data.add_field ("int", get_parameter_array_length_cname (param, dim));
					}
				}
			} else if (param.variable_type is DelegateType) {
				var deleg_type = (DelegateType) param.variable_type;
				if (deleg_type.delegate_symbol.has_target) {
					data.add_field ("void*", get_ccode_delegate_target_name (param));
					if (!is_unowned_delegate) {
						data.add_field ("GDestroyNotify", get_delegate_target_destroy_notify_cname (get_variable_cname (param.name)));
					}
				}
			}
		}

		foreach (var type_param in m.get_type_parameters ()) {
			data.add_field ("GBoxedCopyFunc", "%s_dup_func".printf (type_param.name.down ()));
			data.add_field ("GDestroyNotify", "%s_destroy_func".printf (type_param.name.down ()));
		}

		if (!(m.return_type is VoidType)) {
			data.add_field (get_ccode_name (m.return_type), "result");
			if (m.return_type is ArrayType) {
				var array_type = (ArrayType) m.return_type;
				if (get_ccode_array_length (m)) {
					for (int dim = 1; dim <= array_type.rank; dim++) {
						data.add_field ("int", get_array_length_cname ("result", dim));
					}
				}
			} else if (m.return_type is DelegateType) {
				var deleg_type = (DelegateType) m.return_type;
				if (deleg_type.delegate_symbol.has_target) {
					data.add_field ("void*", get_delegate_target_cname ("result"));
					data.add_field ("GDestroyNotify", get_delegate_target_destroy_notify_cname ("result"));
				}
			}
		}

		return data;
	}

	void generate_finish_function (Method m) {
		push_context (new EmitContext ());

		string dataname = Symbol.lower_case_to_camel_case (get_ccode_name (m)) + "Data";

		var finishfunc = new CCodeFunction (get_ccode_finish_real_name (m));

		var cparam_map = new HashMap<int,CCodeParameter> (direct_hash, direct_equal);

		cparam_map.set (get_param_pos (0.1), new CCodeParameter ("_res_", "void*"));

		generate_cparameters (m, cfile, cparam_map, finishfunc, null, null, null, 2);

		if (m.is_private_symbol ()) {
			finishfunc.modifiers |= CCodeModifiers.STATIC;
		}

		push_function (finishfunc);

		var return_type = m.return_type;
		if (!(return_type is VoidType) && !return_type.is_real_non_null_struct_type ()) {
			ccode.add_declaration (get_ccode_name (m.return_type), new CCodeVariableDeclarator ("result"));
		}

		var data_var = new CCodeIdentifier ("_data_");

		ccode.add_declaration (dataname + "*", new CCodeVariableDeclarator("_data_"));

		ccode.add_assignment(data_var, new CCodeCastExpression(new CCodeIdentifier("_res_"), dataname + "*"));

		emit_context.push_symbol (m);
		foreach (var param in m.get_parameters ()) {
			if (param.direction != ParameterDirection.IN) {
				return_out_parameter (param);
				if (!(param.variable_type is ValueType) || param.variable_type.nullable) {
					ccode.add_assignment (new CCodeMemberAccess.pointer (data_var, get_variable_cname (param.name)), new CCodeConstant ("NULL"));
				}
			}
		}
		emit_context.pop_symbol ();

		if (return_type.is_real_non_null_struct_type ()) {
			// structs are returned via out parameter
			CCodeExpression cexpr = new CCodeMemberAccess.pointer (data_var, "result");
			if (requires_copy (return_type)) {
				cexpr = get_cvalue_ (copy_value (new GLibValue (return_type, cexpr, true), return_type));
			}
			ccode.add_assignment (new CCodeUnaryExpression (CCodeUnaryOperator.POINTER_INDIRECTION, new CCodeIdentifier ("result")), cexpr);
		} else if (!(return_type is VoidType)) {
			ccode.add_assignment (new CCodeIdentifier ("result"), new CCodeMemberAccess.pointer (data_var, "result"));
			if (return_type is ArrayType) {
				var array_type = (ArrayType) return_type;
				if (get_ccode_array_length (m)) {
					for (int dim = 1; dim <= array_type.rank; dim++) {
						ccode.add_assignment (new CCodeUnaryExpression (CCodeUnaryOperator.POINTER_INDIRECTION, new CCodeIdentifier (get_array_length_cname ("result", dim))), new CCodeMemberAccess.pointer (data_var, get_array_length_cname ("result", dim)));
					}
				}
			} else if (return_type is DelegateType && ((DelegateType) return_type).delegate_symbol.has_target) {
				ccode.add_assignment (new CCodeUnaryExpression (CCodeUnaryOperator.POINTER_INDIRECTION, new CCodeIdentifier (get_delegate_target_cname ("result"))), new CCodeMemberAccess.pointer (data_var, get_delegate_target_cname ("result")));
			}
			if (!(return_type is ValueType) || return_type.nullable) {
				ccode.add_assignment (new CCodeMemberAccess.pointer (data_var, "result"), new CCodeConstant ("NULL"));
			}
		}

		// Now free all the other stuff in the structure

		foreach (var param in m.get_parameters ()) {
			if (!param.captured && param.direction != ParameterDirection.OUT) {
				var param_type = param.variable_type.copy ();
				if (!param_type.value_owned) {
					param_type.value_owned = !no_implicit_copy (param_type);
				}

				if (requires_destroy (param_type)) {
					ccode.add_expression (destroy_parameter (param));
				}
			}
		}

		if (m.binding == MemberBinding.INSTANCE) {
			var this_type = m.this_parameter.variable_type.copy ();
			this_type.value_owned = true;

			if (requires_destroy (this_type)) {
				ccode.add_expression (destroy_parameter (m.this_parameter));
			}
		}

		var freecall = new CCodeFunctionCall (new CCodeIdentifier ("free"));
		freecall.add_argument (data_var);
		ccode.add_expression (freecall);

		if (!return_type.is_real_non_null_struct_type () && !(return_type is VoidType)) {
			ccode.add_return (new CCodeIdentifier ("result"));
		}

		pop_function ();

		cfile.add_function_declaration (finishfunc);
		cfile.add_function (finishfunc);

		pop_context ();
	}

	public override void generate_method_declaration (Method m, CCodeFile decl_space) {
		if (m.coroutine) {
			if (add_symbol_declaration (decl_space, m, get_ccode_name (m))) {
				return;
			}

			var asyncfunc = new CCodeFunction (get_ccode_name (m), "void");
			var cparam_map = new HashMap<int,CCodeParameter> (direct_hash, direct_equal);
			var carg_map = new HashMap<int,CCodeExpression> (direct_hash, direct_equal);

			if (m.is_private_symbol ()) {
				asyncfunc.modifiers |= CCodeModifiers.STATIC;
			}

			var finishfunc = new CCodeFunction (get_ccode_finish_name (m));
			cparam_map = new HashMap<int,CCodeParameter> (direct_hash, direct_equal);
			carg_map = new HashMap<int,CCodeExpression> (direct_hash, direct_equal);

			if (m.is_private_symbol ()) {
				finishfunc.modifiers |= CCodeModifiers.STATIC;
			}
		} else {
			base.generate_method_declaration (m, decl_space);
		}
	}

	Vala.List<Vala.Parameter> generate_params (MethodCall expr, ParameterDirection dir) {
		Vala.List<Vala.Parameter> @params = new Vala.ArrayList<Vala.Parameter>();

		foreach (var param in expr.call.value_type.get_parameters ()) {
			if (param.ellipsis || param.params_array) {
				Report.error (expr.source_reference, "Ellipses cannot be used in asynchronous methods.");
			}
			if (param.direction == dir) {
				@params.add(param);
			}
		}
		return @params;
	}

	bool is_variadic (Method m) {
		foreach (var param in m.get_parameters ()) {
			if (param.ellipsis)
				return true;
		}
		return false;
	}
}

class Avr.Compiler {
	public static bool allow_async;
	static string basedir;
	static string cc_command;
	[CCode (array_length = false, array_null_terminated = true)]
	static string[]? cc_options;
	static bool ccode_only;
	static bool compile_only;
	static bool debug;
	[CCode (array_length = false, array_null_terminated = true)]
	static string[] defines;
	static string dependencies;
	static bool deprecated;
	static string directory;
	static bool disable_version_header;
	static bool disable_warnings;
	static string dump_tree;
	static bool enable_checking;
	static bool enable_version_header;
	static string entry_point;
	static bool experimental;
	static bool experimental_non_null;
	static bool fatal_warnings;
	static int f_cpu = 0;
	static string header_filename;
	static string includedir;
	static string internal_header_filename;
	static string mcu;
	static string output;
	[CCode (array_length = false, array_null_terminated = true)]
	static string[] packages;
	static bool quiet_mode;
	static bool save_temps;
	[CCode (array_length = false, array_null_terminated = true)]
	static string[] sources;
	static string symbols_filename;
	static bool use_header;
	[CCode (array_length = false, array_null_terminated = true)]
	static string[] vapi_directories;
	static bool verbose_mode;
	static bool version;

	private CodeContext context;
	private string avr_arch = "${AVR_ARCH}";

	const OptionEntry[] options = {
		{ "allow-async", 'a', 0, OptionArg.NONE, ref allow_async, "Allow generation of asynchronous methods.", null },
		{ "basedir", 'b', 0, OptionArg.FILENAME, ref basedir, "Base source directory", "DIRECTORY" },
		{ "cc", 0, 0, OptionArg.STRING, ref cc_command, "Use COMMAND as C compiler command", "COMMAND" },
		{ "ccode", 'C', 0, OptionArg.NONE, ref ccode_only, "Output C code", null },
		{ "compile", 'c', 0, OptionArg.NONE, ref compile_only, "Compile but do not link", null },
		{ "debug", 'g', 0, OptionArg.NONE, ref debug, "Produce debug information", null },
		{ "define", 'D', 0, OptionArg.STRING_ARRAY, ref defines, "Define SYMBOL", "SYMBOL..." },
		{ "deps", 0, 0, OptionArg.STRING, ref dependencies, "Write make-style dependency information to this file", null },
		{ "directory", 'd', 0, OptionArg.FILENAME, ref directory, "Output directory", "DIRECTORY" },
		{ "disable-version-header", 0, 0, OptionArg.NONE, ref disable_version_header, "Do not write vala build version in generated files", null },
		{ "disable-warnings", 0, 0, OptionArg.NONE, ref disable_warnings, "Disable warnings", null },
		{ "dump-tree", 0, 0, OptionArg.FILENAME, ref dump_tree, "Write code tree to FILE", "FILE" },
		{ "enable-checking", 0, 0, OptionArg.NONE, ref enable_checking, "Enable additional run-time checks", null },
		{ "enable-deprecated", 0, 0, OptionArg.NONE, ref deprecated, "Enable deprecated features", null },
		{ "enable-experimental", 0, 0, OptionArg.NONE, ref experimental, "Enable experimental features", null },
		{ "enable-experimental-non-null", 0, 0, OptionArg.NONE, ref experimental_non_null, "Enable experimental enhancements for non-null types", null },
		{ "enable-version-header", 0, 0, OptionArg.NONE, ref enable_version_header, "Write vala build version in generated files", null },
		{ "fatal-warnings", 0, 0, OptionArg.NONE, ref fatal_warnings, "Treat warnings as fatal", null },
		{ "freq", 0, 0, OptionArg.INT, ref f_cpu, "The CPU frequence (F_CPU)", "NUM" },
		{ "header", 'H', 0, OptionArg.FILENAME, ref header_filename, "Output C header file", "FILE" },
		{ "includedir", 0, 0, OptionArg.FILENAME, ref includedir, "Directory used to include the C header file", "DIRECTORY" },
		{ "main", 0, 0, OptionArg.STRING, ref entry_point, "Use SYMBOL as entry point", "SYMBOL..." },
		{ "mcu", 'M', 0, OptionArg.STRING, ref mcu, "Microcontoller architecture", "MODEL" },
		{ "output", 'o', 0, OptionArg.FILENAME, ref output, "Place output in file FILE", "FILE" },
		{ "pkg", 0, 0, OptionArg.STRING_ARRAY, ref packages, "Include binding for PACKAGE", "PACKAGE..." },
		{ "quiet", 'q', 0, OptionArg.NONE, ref quiet_mode, "Do not print messages to the console", null },
		{ "save-temps", 0, 0, OptionArg.NONE, ref save_temps, "Keep temporary files", null },
		{ "symbols", 0, 0, OptionArg.FILENAME, ref symbols_filename, "Output symbols file", "FILE" },
		{ "use-header", 0, 0, OptionArg.NONE, ref use_header, "Use C header file", null },
		{ "vapidir", 0, 0, OptionArg.FILENAME_ARRAY, ref vapi_directories, "Look for package bindings in DIRECTORY", "DIRECTORY..." },
		{ "verbose", 'v', 0, OptionArg.NONE, ref verbose_mode, "Print additional messages to the console", null },
		{ "version", 0, 0, OptionArg.NONE, ref version, "Display version number", null },
		{ "Xcc", 'X', 0, OptionArg.STRING_ARRAY, ref cc_options, "Pass OPTION to the C compiler", "OPTION..." },
		{ "", 0, 0, OptionArg.FILENAME_ARRAY, ref sources, null, "FILE..." },
		{ null }
	};

	bool package_exists(string package_name) {
		return run_pkg_config("--exists " + Shell.quote(package_name));
	}
	bool run_pkg_config(string command, out string? standard_output = null) {
		int exit_status;
		string pc = @"pkg-config --define-variable AVR_ARCH=$(Shell.quote(avr_arch)) --define-variable AVR_MCU=$(Shell.quote(mcu)) $(command)";

		try {
			Process.spawn_command_line_sync (pc, out standard_output, null, out exit_status);
			return (0 == exit_status);
		} catch (SpawnError e) {
			Report.error (null, e.message);
			return false;
		}
	}

	private string? get_mcu_architecture() {
		try {
			int exit_value = 0;
			string? standard_output;
			if (Process.spawn_sync(null, new string [] { cc_command, "-dM", "-E", @"-mmcu=$(mcu)", "-" }, null, SpawnFlags.SEARCH_PATH, null, out standard_output, null, out exit_value) && exit_value == 0) {
				foreach (var line in standard_output.split("\n")) {
					if ("__AVR_ARCH__" in line) {
						var parts = line.split(" ");
						return parts[2];
					}
				}
			} else {
				error("failed to run pkg-config: exited %d", exit_value);
			}
		} catch (SpawnError e) {
			error(e.message);
		}
		return null;
	}

	private int quit () {
		if (context.report.get_errors () == 0 && context.report.get_warnings () == 0) {
			return 0;
		}
		if (context.report.get_errors () == 0 && (!fatal_warnings || context.report.get_warnings () == 0)) {
			if (!quiet_mode) {
				stdout.printf ("Compilation succeeded - %d warning(s)\n", context.report.get_warnings ());
			}
			return 0;
		} else {
			if (!quiet_mode) {
				stdout.printf ("Compilation failed: %d error(s), %d warning(s)\n", context.report.get_errors (), context.report.get_warnings ());
			}
			return 1;
		}
	}

	private int run () {
		context = new CodeContext ();
		CodeContext.push (context);

		if (!ccode_only && !compile_only && output == null) {
			if (sources[0].last_index_of_char ('.') != -1) {
				int dot = sources[0].last_index_of_char ('.');
				output = Path.get_basename (sources[0].substring (0, dot));
			}
		}

		if (mcu == null) {
			Report.error (null, "A microcontroller architecture must be supplied with --mcu.");
			return quit();
		}

		context.assert = false;
		context.checking = enable_checking;
		context.deprecated = deprecated;
		context.experimental = experimental;
		context.experimental_non_null = experimental_non_null;
		context.report.enable_warnings = !disable_warnings;
		context.report.set_verbose_errors (!quiet_mode);
		context.verbose_mode = verbose_mode;
		context.version_header = !disable_version_header;

		context.ccode_only = ccode_only;
		context.compile_only = compile_only;
		context.header_filename = header_filename;
		if (header_filename == null && use_header) {
			Report.error (null, "--use-header may only be used in combination with --header");
		}
		context.use_header = use_header;
		context.internal_header_filename = internal_header_filename;
		context.symbols_filename = symbols_filename;
		context.includedir = includedir;
		context.output = output;
		if (basedir == null) {
			context.basedir = CodeContext.realpath (".");
		} else {
			context.basedir = CodeContext.realpath (basedir);
		}
		if (directory != null) {
			context.directory = CodeContext.realpath (directory);
		} else {
			context.directory = context.basedir;
		}
		var vapi_dirs = vapi_directories ?? new string[] {};
		vapi_dirs += Package.VAPI_DIR;
		context.vapi_directories = vapi_dirs;
		context.debug = debug;
		context.thread = false;
		context.mem_profiler = false;
		context.save_temps = save_temps;
		context.profile = Profile.POSIX;
		context.add_define ("AVR");
		context.add_define (@"MCU_$(mcu.up())");
		context.nostdpkg = true;
		context.entry_point_name = entry_point;

		if (defines != null) {
			foreach (string define in defines) {
				context.add_define (define);
			}
		}

		for (int i = 2; i <= 18; i += 2) {
			context.add_define ("VALA_0_%d".printf (i));
		}
		context.add_external_package ("avr");
		context.add_external_package (mcu.down());
		if (allow_async)
			context.add_external_package ("gio-2.0");

		if (packages != null) {
			foreach (string package in packages) {
				context.add_external_package (package);
			}
			packages = null;
		}

		if (context.report.get_errors () > 0 || (fatal_warnings && context.report.get_warnings () > 0)) {
			return quit ();
		}

		context.codegen = new CodeGen ();

		bool has_c_files = false;

		foreach (string source in sources) {
			if (context.add_source_filename (source, false, true)) {
				if (source.has_suffix (".c")) {
					has_c_files = true;
				}
			}
		}
		sources = null;

		if (context.report.get_errors () > 0 || (fatal_warnings && context.report.get_warnings () > 0)) {
			return quit ();
		}

		var parser = new Parser ();
		parser.parse (context);

		var genie_parser = new Genie.Parser ();
		genie_parser.parse (context);

		if (context.report.get_errors () > 0 || (fatal_warnings && context.report.get_warnings () > 0)) {
			return quit ();
		}

		context.check ();

		if (context.report.get_errors () > 0 || (fatal_warnings && context.report.get_warnings () > 0)) {
			return quit ();
		}

		if (!ccode_only && !compile_only) {
			// building program, require entry point
			if (!has_c_files && context.entry_point == null) {
				Report.error (null, "program does not contain a static `main' method");
			}
		}

		if (dump_tree != null) {
			var code_writer = new CodeWriter (CodeWriterType.DUMP);
			code_writer.write_file (context, dump_tree);
		}

		if (context.report.get_errors () > 0 || (fatal_warnings && context.report.get_warnings () > 0)) {
			return quit ();
		}

		context.codegen.emit (context);

		if (context.report.get_errors () > 0 || (fatal_warnings && context.report.get_warnings () > 0)) {
			return quit ();
		}

		if (dependencies != null) {
			context.write_dependencies (dependencies);
		}

		if (!ccode_only) {
			var compiler_call = new StringBuilder();
			if (cc_command == null && Environment.get_variable ("CC") != null) {
				cc_command = Environment.get_variable ("CC");
			}
			if (cc_command == null)
				cc_command = "avr-gcc";

			compiler_call.printf ("%s -mmcu=%s --std=c99 -O2", cc_command, mcu);
			if (f_cpu > 0)
				compiler_call.append_printf (" -DF_CPU=%d", f_cpu);
			foreach (unowned string option in cc_options) {
				compiler_call.append_printf (" %s", Shell.quote(option));
			}
			var architecture = get_mcu_architecture ();
			if (architecture == null) {
				return quit ();
			}
			avr_arch = architecture;

			unowned string? pkg_config = Environment.get_variable("AVR_PKG_CONFIG_PATH");
			Environment.set_variable("PKG_CONFIG_PATH", pkg_config == null ? Package.PKG_CONFIG_DIR : @"$(pkg_config):$(Package.PKG_CONFIG_DIR)", true);

			var pkg_config_command = new StringBuilder ();
			pkg_config_command.append ("--cflags --libs");
			foreach (var pkg in context.get_packages ()) {
				if (package_exists (pkg)) {
					pkg_config_command.append_printf (" %s", Shell.quote(pkg));
				}
			}
			string? pkg_flags;
			if (!run_pkg_config(pkg_config_command.str, out pkg_flags)) {
				return quit ();
			}
			if (context.debug) {
				compiler_call.append (" -g");
			}
			if (context.compile_only) {
				compiler_call.append (" -c");
			} else if (context.output != null) {
				string output = context.output;
				if (context.directory != null && context.directory != "" && !Path.is_absolute (context.output)) {
					output = "%s%c%s".printf (context.directory, Path.DIR_SEPARATOR, context.output);
				}
				compiler_call.append_printf (" -o %s", Shell.quote (output));
			}

			/* we're only interested in non-pkg source files */
			var source_files = context.get_source_files ();
			foreach (SourceFile file in source_files) {
				if (file.file_type == SourceFileType.SOURCE) {
					compiler_call.append( " " + Shell.quote (file.get_csource_filename ()));
				}
			}
			var c_source_files = context.get_c_source_files ();
			foreach (string file in c_source_files) {
				compiler_call.append( " " + Shell.quote (file));
			}

			compiler_call.append_c (' ');
			compiler_call.append (pkg_flags.strip());

			if (context.verbose_mode) {
				stdout.printf ("%s\n", compiler_call.str);
			}

			try {
				int exit_status;
				Process.spawn_command_line_sync (compiler_call.str, null, null, out exit_status);
				if (exit_status != 0) {
					Report.error (null, "cc exited with status %d".printf (exit_status));
				}
			} catch (SpawnError e) {
				Report.error (null, e.message);
			}

			/* remove generated C source and header files */
			foreach (SourceFile file in source_files) {
				if (file.file_type == SourceFileType.SOURCE) {
					if (!context.save_csources) {
						FileUtils.unlink (file.get_csource_filename ());
					}
				}
			}
		}

		return quit ();
	}

	static int main (string[] args) {
		// initialize locale
		Intl.setlocale (LocaleCategory.ALL, "");

		try {
			var opt_context = new OptionContext ("- AVR Vala Compiler");
			opt_context.set_help_enabled (true);
			opt_context.add_main_entries (options, null);
			opt_context.parse (ref args);
		} catch (OptionError e) {
			stdout.printf ("%s\n", e.message);
			stdout.printf ("Run '%s --help' to see a full list of available command line options.\n", args[0]);
			return 1;
		}

		if (version) {
			stdout.printf ("AVR Vala %s\n", Package.VERSION);
			return 0;
		}

		if (sources == null) {
			stderr.printf ("No source file specified.\n");
			return 1;
		}

		var compiler = new Compiler ();
		return compiler.run ();
	}
}
