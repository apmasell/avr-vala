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
		writer.write_string ("__ISR(");
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
	public override void visit_method (Method m) {
		base.visit_method(m);
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

class Avr.Compiler {
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

	const OptionEntry[] options = {
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
			var ccompiler = new CCodeCompiler ();
			if (cc_command == null && Environment.get_variable ("CC") != null) {
				cc_command = Environment.get_variable ("CC");
			}
			context.thread = false;
			var options = cc_options ?? new string[] { };
			options += @"-mmcu=$(mcu)";
			options += "--std=c99";
			unowned string? pkg_config = Environment.get_variable("AVR_PKG_CONFIG_PATH");
			Environment.set_variable("PKG_CONFIG_PATH", pkg_config == null ? Package.PKG_CONFIG_DIR : @"$(pkg_config):$(Package.PKG_CONFIG_DIR)", true);
			ccompiler.compile (context, cc_command ?? "avr-gcc", options);
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
