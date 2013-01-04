[CCode (cname = "bool", cheader_filename = "stdbool.h", default_value = "false")]
[BooleanType]
public struct bool {
}
[CCode (cname = "char", default_value = "\'\\0\'", cheader_filename = "ctype.h")]
[IntegerType (rank = 2, min = 0, max = 127)]
public struct char {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_byte_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static char read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_byte_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static char read_far(uint32 address);
	[CCode(cname = "isalnum")]
	public bool isalnum();
	[CCode(cname = "isalpha")]
	public bool isalpha();
	[CCode(cname = "isascii")]
	public bool isascii();
	[CCode(cname = "isblank")]
	public bool isblank();
	[CCode(cname = "iscntrl")]
	public bool iscntrl();
	[CCode(cname = "isdigit")]
	public bool isdigit();
	[CCode(cname = "isgraph")]
	public bool isgraph();
	[CCode(cname = "islower")]
	public bool islower();
	/**
	 * Calculate the parity bit for a byte.
	 * @return true if an odd number of bits set.
	 */
	[CCode(cname = "parity_even_bit", cheader_filename = "util/parity.h")]
	public bool isparity();
	[CCode(cname = "isprint")]
	public bool isprint();
	[CCode(cname = "ispunct")]
	public bool ispunct();
	[CCode(cname = "isspace")]
	public bool isspace();
	[CCode(cname = "isupper")]
	public bool isupper();
	[CCode(cname = "isxdigit")]
	public bool isxdigit();
	[CCode(cname = "toascii")]
	public char toascii();
	[CCode(cname = "tolower")]
	public char tolower();
	[CCode(cname = "toupper")]
	public char toupper();
}
[CCode (cname = "prog_char", default_value = "\'\\0\'", cheader_filename = "avr/io.h,avr/pgmspace.h")]
[IntegerType (rank = 2, min = 0, max = 127)]
public struct prog_char {
	[CCode(cname = "isalnum")]
	public bool isalnum();
	[CCode(cname = "isalpha")]
	public bool isalpha();
	[CCode(cname = "isascii")]
	public bool isascii();
	[CCode(cname = "isblank")]
	public bool isblank();
	[CCode(cname = "iscntrl")]
	public bool iscntrl();
	[CCode(cname = "isdigit")]
	public bool isdigit();
	[CCode(cname = "isgraph")]
	public bool isgraph();
	[CCode(cname = "islower")]
	public bool islower();
	/**
	 * Calculate the parity bit for a byte.
	 * @return true if an odd number of bits set.
	 */
	[CCode(cname = "parity_even_bit", cheader_filename = "util/parity.h")]
	public bool isparity();
	[CCode(cname = "isprint")]
	public bool isprint();
	[CCode(cname = "ispunct")]
	public bool ispunct();
	[CCode(cname = "isspace")]
	public bool isspace();
	[CCode(cname = "isupper")]
	public bool isupper();
	[CCode(cname = "isxdigit")]
	public bool isxdigit();
	[CCode(cname = "toascii")]
	public char toascii();
	[CCode(cname = "tolower")]
	public char tolower();
	[CCode(cname = "toupper")]
	public char toupper();
}
[CCode (cname = "unsigned char", default_value = "\'\\0\'")]
[IntegerType (rank = 3, min = 0, max = 255)]
public struct uchar {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_byte_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static uchar read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_byte_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static uchar read_far(uint32 address);
}
[CCode (cname = "prog_uchar", default_value = "\'\\0\'", cheader_filename = "avr/io.h,avr/pgmspace.h")]
[IntegerType (rank = 3, min = 0, max = 255)]
public struct prog_uchar {
}
[CCode (cname = "int", default_value = "0")]
[IntegerType (rank = 6)]
public struct int {
	[CCode(cname = "ffs", cheader_filename = "string.h")]
	public int ffs();
	/**
	 * Computes the absolute value of the integer.
	 */
	[CCode(cname = "abs", cheader_filename = "stdlib.h")]
	public int abs();
	/**
	 * Divides and provides the quotient and remainder.
	 */
	[CCode(cname = "div", cheader_filename = "stdlib.h")]
	public Posix.div_t? div(int denom);
}
[CCode (cname = "unsigned int", default_value = "0U")]
[IntegerType (rank = 7)]
public struct uint {
}
[CCode (cname = "short", default_value = "0")]
[IntegerType (rank = 4, min = -32768, max = 32767)]
public struct short {
}
[CCode (cname = "unsigned short", default_value = "0U")]
[IntegerType (rank = 5, min = 0, max = 65535)]
public struct ushort {
}
[CCode (cname = "long", default_value = "0L")]
[IntegerType (rank = 8)]
public struct long {
	[CCode(cname = "ffsl", cheader_filename = "string.h")]
	public int ffs();
	/**
	 * Computes the absolute value of the long integer.
	 */
	[CCode(cname = "labs", cheader_filename = "stdlib.h")]
	public long abs();
	/**
	 * Divides and provides the quotient and remainder.
	 */
	[CCode(cname = "ldiv", cheader_filename = "stdlib.h")]
	public Posix.ldiv_t? div(long denom);
}
[CCode (cname = "unsigned long", default_value = "0UL")]
[IntegerType (rank = 9)]
public struct ulong {
}
[CCode (cname = "size_t", default_value = "0UL")]
[IntegerType (rank = 9)]
public struct size_t {
}
[CCode (cname = "ssize_t", default_value = "0L")]
[IntegerType (rank = 8)]
public struct ssize_t {
}
[CCode (cname = "int8_t", cheader_filename = "stdint.h", default_value = "0")]
[IntegerType (rank = 1, min = -128, max = 127)]
public struct int8 {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_byte_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int8 read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_byte_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int8 read_far(uint32 address);
	/**
	 * Fractional multiply signed.
	 */
	[CCode(cname = "__builtin_avr_fmuls", cheader_filename = "avr/builtins.h")]
	public int fmul(int8 b);
	/**
	 * Fractional multiply with unsigned.
	 */
	[CCode(cname = "__builtin_avr_fmulsu", cheader_filename = "avr/builtins.h")]
	public int fmuls(uint8 b);
}
/**
 * A {@link int8} located in flash ROM.
 */
[CCode (cname = "prog_int8_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0")]
[IntegerType (rank = 1, min = -128, max = 127)]
public struct prog_int8 {
	/**
	 * Fractional multiply signed.
	 */
	[CCode(cname = "__builtin_avr_fmuls", cheader_filename = "avr/builtins.h")]
	public int fmul(int8 b);
	/**
	 * Fractional multiply with unsigned.
	 */
	[CCode(cname = "__builtin_avr_fmulsu", cheader_filename = "avr/builtins.h")]
	public int fmuls(uint8 b);
}
[CCode (cname = "uint8_t", cheader_filename = "stdint.h", default_value = "0U")]
[IntegerType (rank = 3, min = 0, max = 255)]
public struct uint8 {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_byte_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int8 read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_byte_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int8 read_far(uint32 address);
	/**
	 * Swap nibbles.
	 */
	[CCode(cname = "__builtin_avr_swap", cheader_filename = "avr/builtins.h")]
	public uint8 swap();
	/**
	 * Fractional multiply.
	 */
	[CCode(cname = "__builtin_avr_fmul", cheader_filename = "avr/builtins.h")]
	public uint8 fmul(uint8 b);
}
/**
 * A {@link uint8} located in flash ROM.
 */
[CCode (cname = "prog_uint8_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0U")]
[IntegerType (rank = 3, min = 0, max = 255)]
public struct prog_uint8 {
	/**
	 * Swap nibbles.
	 */
	[CCode(cname = "__builtin_avr_swap", cheader_filename = "avr/builtins.h")]
	public uint8 swap();
	/**
	 * Fractional multiply.
	 */
	[CCode(cname = "__builtin_avr_fmul", cheader_filename = "avr/builtins.h")]
	public uint8 fmul(uint8 b);
}
[CCode (cname = "int16_t", cheader_filename = "stdint.h", default_value = "0")]
[IntegerType (rank = 4, min = -32768, max = 32767)]
public struct int16 {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_word_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int16 read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_word_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int16 read_far(uint32 address);
}
/**
 * A {@link int16} located in flash ROM.
 */
[CCode (cname = "prog_int16_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0")]
[IntegerType (rank = 4, min = -32768, max = 32767)]
public struct prog_int16 {
}
[CCode (cname = "uint16_t", cheader_filename = "stdint.h", default_value = "0U")]
[IntegerType (rank = 5, min = 0, max = 65535)]
public struct uint16 {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_word_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static uint16 read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_word_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static uint16 read_far(uint32 address);
}
/**
 * A {@link uint16} located in flash ROM.
 */
[CCode (cname = "prog_uint16_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0U")]
[IntegerType (rank = 5, min = 0, max = 65535)]
public struct prog_uint16 {
}
[CCode (cname = "int32_t", cheader_filename = "stdint.h", default_value = "0")]
[IntegerType (rank = 6)]
public struct int32 {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_dword_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int32 read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_dword_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int32 read_far(uint32 address);
}
/**
 * A {@link int32} located in flash ROM.
 */
[CCode (cname = "prog_int32_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0")]
[IntegerType (rank = 6)]
public struct prog_int32 {
}
[CCode (cname = "uint32_t", cheader_filename = "stdint.h", default_value = "0U")]
[IntegerType (rank = 7)]
public struct uint32 {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_dword_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static uint32 read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_dword_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static uint32 read_far(uint32 address);
}
/**
 * A {@link int32} located in flash ROM.
 */
[CCode (cname = "prog_uint32_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0U")]
[IntegerType (rank = 7)]
public struct prog_uint32 {
}
[CCode (cname = "int64_t", cheader_filename = "stdint.h", default_value = "0LL")]
[IntegerType (rank = 10)]
public struct int64 {
}
/**
 * A {@link int64} located in flash ROM.
 */
[CCode (cname = "prog_int64_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0LL")]
[IntegerType (rank = 10)]
public struct prog_int64 {
}
[CCode (cname = "uint64_t", cheader_filename = "stdint.h", default_value = "0ULL")]
[IntegerType (rank = 11)]
public struct uint64 {
	[CCode(cname = "ffsll")]
	public int ffs();
}
/**
 * A {@link uint64} located in flash ROM.
 */
[CCode (cname = "prog_uint64_t", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0ULL")]
[IntegerType (rank = 11)]
public struct prog_uint64 {
	[CCode(cname = "ffsll")]
	public int ffs();
}
[CCode (cname = "float", default_value = "0.0F")]
[FloatingType (rank = 1)]
public struct float {
	/**
	 * Read from the program space with a 16-bit (near) address.
	 */
	[CCode(cname = "pgm_read_float_near", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int16 read_near(uint16 address);
	/**
	 * Read from the program space with a 32-bit (far) address.
	 */
	[CCode(cname = "pgm_read_float_far", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public static int16 read_far(uint32 address);
		[CCode(cname = "modff", cheader_filename = "math.h")]
		public float modf(out float fraction);
}
[CCode (cname = "double", default_value = "0.0")]
[FloatingType (rank = 2)]
public struct double {
	/**
	 * If the sign bit is set.
	 *
	 * This is not the same as checking if the number is less than zero because
	 * IEEE 754 floating point allows zero to be signed. The comparison -0.0 <
	 * 0.0 is false, but this will work as expected.
	 */
	public bool signbit {
		[CCode(cname = "signbit", cheader_filename = "math.h")]
		get;
	}
	/**
	 * Computes the absolute value of a floating-point number.
	 */
	[CCode(cname = "fabs", cheader_filename = "math.h")]
	public double abs();
	/**
	 * The principal value of the arc cosine.
	 *
	 * @return value is in the range [0, pi] radians. A domain error occurs for
	 * arguments not in the range [-1, +1].
	 */
	[CCode(cname = "acos", cheader_filename = "math.h")]
	public double acos();
	/**
	 * The principal value of the arc sine.
	 *
	 * @return value is in the range [-pi/2, pi/2] radians. A domain error occurs
	 * for arguments not in the range [-1, +1].
	 */
	[CCode(cname = "asin", cheader_filename = "math.h")]
	public double asin();
	/**
	 * The the principal value of the arc tangent.
	 *
	 * @returne value is in the range [-pi/2, pi/2] radians.
	 */
	[CCode(cname = "atan", cheader_filename = "math.h")]
	public double atan();
	/**
	 * The principal value of the arc tangent, using the signs of both arguments
	 * to determine the quadrant of the return value.
	 *
	 * @returne value is in the range [-pi, +pi] radians.
	 */
	[CCode(cname = "atan2")]
	public double atan2(double x);
	/**
	 * The cube root.
	 */
	[CCode(cname = "cbrt", cheader_filename = "math.h")]
	public double cbrt();
	/**
	 * The smallest integral value greater than or equal to the value, expressed
	 * as a floating-point number.
	 */
	[CCode(cname = "ceil", cheader_filename = "math.h")]
	public double ceil();
	/**
	 * Copies the sign of the argument to the value.
	 *
	 * Works even for zero and NaN.
	 */
	[CCode(cname = "copysign", cheader_filename = "math.h")]
	public inline double copysign (double sign);
	/**
	 * The cosine, measured in radians.
	 */
	[CCode(cname = "cos", cheader_filename = "math.h")]
	public double cos();
	/**
	 * The hyperbolic cosine.
	 */
	[CCode(cname = "cosh", cheader_filename = "math.h")]
	public double cosh();
	/**
	 * Multiplies a floating-point number by an integral power of 2.
	 */
	[CCode(cname = "ldexp", cheader_filename = "math.h")]
	public double dexp(int exp);
	/**
	 * The maximum of the value minus the argument or zero.
	 * @return If any value is NaN, NaN is returned.
	 */
	[CCode(cname = "fdim", cheader_filename = "math.h")]
	public double dim (double y);
	/**
	 * The exponential value.
	 */
	[CCode(cname = "exp", cheader_filename = "math.h")]
	public double exp();
	/**
	 * The largest integral value less than or equal to the value, expressed as a
	 * floating-point number.
	 */
	[CCode(cname = "floor", cheader_filename = "math.h")]
	public double floor();
	/**
	 * Returns the length of the hypotenuse of a right triangle with sides of
	 * length ''this'' and ''y'', or the distance of the point (''this'', ''y'')
	 * from the origin.
	 *
	 * Using this function instead of the direct formula is wise, since the error
	 * is much smaller. No underflow with small values. No overflow if result is
	 * in range.
	 */
	[CCode(cname = "hypot", cheader_filename = "math.h")]
	public double hypot (double y);
	/**
	 * Determines if the value is finite: not plus or minus infinity, and not NaN.
	 */
	[CCode(cname = "isfinite", cheader_filename = "math.h")]
	public bool isfinite();
	/**
	 * Determine of the number is infinite.
	 *
	 * The GCC 4.3 can replace this function with inline code that returns the 1
	 * value for both infinities (gcc bug #35509).
	 *
	 * @return 1 if the argument is positive infinity, -1 if it is negative
	 * infinity, and 0 otherwise.
	 */
	[CCode(cname = "isinf", cheader_filename = "math.h")]
	public int isinf();
	/**
	 * Determines whether the value represents a "not-a-number" (NaN) object.
	 */
	[CCode(cname = "isnan", cheader_filename = "math.h")]
	public bool isnan();
	/**
	 * The natural logarithm.
	 */
	[CCode(cname = "log", cheader_filename = "math.h")]
	public double log();
	/**
	 * Rounds to the nearest integer, but rounds halfway cases away from zero (instead of to the nearest even integer).
	 *
	 * This function is similar to {@link round} function, but it differs in type
	 * of return value and in that an overflow is possible.
	 *
	 * @return The rounded long integer value. If not a finite number or an
	 * overflow occured, this realization returns the {@link long.MIN} value.
	 */
	[CCode(cname = "lround", cheader_filename = "math.h")]
	public long lround();
	/**
	 * Rounds to the nearest integer, rounding the halfway cases to the even integer direction.
	 *
	 * That is both 1.5 and 2.5 values are rounded to 2.
	 *
	 * @return The rounded long integer value. If not a finite number or an
	 * overflow occurs, this realization returns the {@link long.MIN}.
	 */
	[CCode(cname = "lrint", cheader_filename = "math.h")]
	public long lrint();
	/**
	 * The logarithm to base 10.
	 */
	[CCode(cname = "log10", cheader_filename = "math.h")]
	public double log10();
	/**
	 * Performs floating-point multiply-add.
	 *
	 * This is the operation '''this''' * '''y''' + '''z''', but the intermediate
	 * result is not rounded to the destination type. This can sometimes improve
	 * the precision of a calculation.
	 */
	[CCode(cname = "fma", cheader_filename = "math.h")]
	public double ma (double y, double z);
	/**
	 * The greater of the two values.
	 *
	 * If an argument is NaN, the other argument is returned. If both arguments
	 * are NaN, NaN is returned.
	 */
	[CCode(cname = "fmax", cheader_filename = "math.h")]
	public double max(double y);
	/**
	 * The lesser of the two values.
	 *
	 * If an argument is NaN, the other argument is returned. If both arguments
	 * are NaN, NaN is returned.
	 */
	[CCode(cname = "fmin", cheader_filename = "math.h")]
	public double min(double y);
	/**
	 * The floating-point remainder of after dividing by the value supplied.
	 */
	[CCode(cname = "fmod", cheader_filename = "math.h")]
	public double mod(double divisor);
	/**
	 * Breaks the number into integral and fractional parts, each of which has
	 * the same sign as the argument.
	 */
	[CCode(cname = "modf", cheader_filename = "math.h")]
	public double modf(out double fraction);
	/**
	 * Raises the value to the exponent provided.
	 */
	[CCode(cname = "pow", cheader_filename = "math.h")]
	public double pow(double y);
	/**
	 * Breaks a floating-point number into a normalized fraction and an integral power of 2.
	 *
	 * If a normal float point number, the method returns a value, such that the
	 * value has a magnitude in the interval [1/2, 1) or zero, and the original
	 * number equals the returned value times 2 raised to the power the
	 * expondent, both parts of the result are zero. If not a finite number, the
	 * original value is returned and the exponent is zero.
	 */
	[CCode(cname = "frexp", cheader_filename = "math.h")]
	public double rexp(out int exponent);
	/**
	 * Rounds to the nearest integer, but rounds halfway cases away from zero
	 * (instead of to the nearest even integer).
	 *
	 * Overflow is impossible.
	 *
	 * @return The rounded value. If an integral or infinite, the original itself
	 * is returned. If NaN, then NaN is returned.
	 */
	[CCode(cname = "round", cheader_filename = "math.h")]
	public double round();
	/**
	 * The squared value.
	 */
	[CCode(cname = "square", cheader_filename = "math.h")]
	public double square();
	/**
	 * The non-negative square root.
	 */
	[CCode(cname = "sqrt", cheader_filename = "math.h")]
	public double sqrt();
	/**
	 * The sine, measured in radians.
	 */
	[CCode(cname = "sin", cheader_filename = "math.h")]
	public double sin();
	/**
	 * The hyperbolic sine.
	 */
	[CCode(cname = "sinh", cheader_filename = "math.h")]
	public double sinh();
	/**
	 * The tangent, measured in radians.
	 */
	[CCode(cname = "tan", cheader_filename = "math.h")]
	public double tan();
	/**
	 * The hyperbolic tangent.
	 */
	[CCode(cname = "tanh", cheader_filename = "math.h")]
	public double tanh();
	/**
	 * Rounds to the nearest integer not larger in absolute value.
	 */
	[CCode(cname = "trunc", cheader_filename = "math.h")]
	public double trunc();
}
[SimpleType]
[CCode (cheader_filename="stdarg.h", cprefix="va_", has_type_id = false, destroy_function = "va_end", lvalue_access = false)]
public struct va_list {
	[CCode (cname = "va_start")]
	public va_list ();
	[CCode (cname = "va_copy")]
	public va_list.copy (va_list src);
	[CCode (generic_type_pos = 1.1)]
	public unowned G arg<G> ();
}
[Compact]
[Immutable]
[CCode (cname = "char", const_cname = "const char", copy_function = "strdup", free_function = "free", cheader_filename = "stdlib.h,string.h")]
public class string {
	public int length {
		[CCode (cname="strlen")]
		get;
	}
	[CCode(cname = "strcasecmp")]
	public int casecmp(string other);
	[CCode(cname = "strcasecmp_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public int casecmp_p(prog_string other);
	[CCode(cname = "strncasecmp")]
	public int casecmp_array(uint8[] buffer);
	[CCode(cname = "strncasecmp_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public int casecmp_array_p(prog_uint8[] buffer);
	[CCode(cname = "strcasestr")]
	public unowned string? casefinds(string needle);
	[CCode(cname = "strcasestr_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public unowned string? casefinds_p(prog_string needle);
	[CCode(cname = "strcmp")]
	public int cmp(string other);
	[CCode(cname = "strcmp_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public int cmp_p(prog_string other);
	[CCode(cname = "strncmp")]
	public int cmp_array(uint8[] buffer);
	[CCode(cname = "strncmp_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public int cmp_array_p(prog_uint8[] buffer);
	[CCode(cname = "strcspn")]
	public size_t cspan(string reject);
	[CCode(cname = "strcspn_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public size_t cspan_p(prog_string reject);
	[CCode(cname = "strchr")]
	public unowned string? findc(int c);
	[CCode(cname = "strchrnul")]
	public unowned string findc_nul(int c);
	[CCode(cname = "strrchr")]
	public unowned string? findc_r(int c);
	[CCode(cname = "strpbrk")]
	public unowned string? find_chars(string accept);
	[CCode(cname = "strpbrk_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public unowned string? find_chars_p(prog_string accept);
	[CCode (cname = "strstr")]
	public unowned string? finds(string needle);
	[CCode (cname = "strstr_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public unowned string? finds_p(prog_string needle);
	[CCode(cname = "strspn")]
	public size_t span(string accept);
	[CCode(cname = "strspn_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
	public size_t span_p(prog_string accept);
	[CCode(cname = "strtod")]
	public double parse_double(out unowned string? end = null);
	/**
	 * Converts the string to a long value.
	 *
	 * The conversion is done according to the given base, which must be between
	 * 2 and 36 inclusive, or be the special value 0.
	 *
	 * The string may begin with an arbitrary amount of white space (as
	 * determined by {@link char.isspace}) followed by a single optional '''+'''
	 * or '''-''' sign. If base is zero or 16, the string may then include a
	 * '''0x''' prefix, and the number will be read in base 16; otherwise, a zero
	 * base is taken as 10 (decimal) unless the next character is '''0''', in
	 * which case it is taken as 8 (octal).
	 *
	 * The remainder of the string is converted to a long value in the obvious
	 * manner, stopping at the first character which is not a valid digit in the
	 * given base. (In bases above 10, the letter '''A''' in either upper or
	 * lower case represents 10, '''B''' represents 11, and so forth, with
	 * '''Z''' representing 35.)
	 *
	 * @param end the remainder of the string starting with the first invalid
	 * character. If there were no digits at all, this is the entire input. If
	 * the input is non-empty but this parameter is empty, the entire string was
	 * valid.
	 *
	 * @return The result of the conversion, unless the value would underflow or
	 * overflow. If no conversion could be performed, 0 is returned. If an
	 * overflow or underflow occurs, {@link Posix.errno} is set to
	 * {@link Posix.Error.RANGE} and the function return value is clamped to
	 * {@link long.MIN} or {@link long.MAX}, respectively.
	 */
	[CCode(cname = "strtol")]
	public long parse_long(out unowned string? end = null, int @base = 0);
	/**
	 * Converts the string to a long value.
	 *
	 * @return Either the result of the conversion or, if there was a leading
	 * minus sign, the negation of the result of the conversion, unless the
	 * original (non-negated) value would overflow; in the latter case,
	 * {@link ulong.MAX} is returned , and {@link Posix.errno} is set to
	 * {@link Posix.Error.RANGE}. If no conversion could be performed, 0 is
	 * returned.
	 * @see parse_long
	 */
	[CCode(cname = "strtoul")]
	public ulong parse_ulong(out unowned string? end = null, int @base = 0);
	/**
	 * Scans a formatted string.
	 * @see FileStream.vscanf
	 */
	[CCode(cname = "sscanf")]
	[ScanfFormat]
	public int scanf(string fmt, ...);
	/**
	 * Variant of {@link scanf} using a format string in program memory.
	 */
	[CCode(cname = "sscanf_P")]
	[ScanfFormat]
	public int scanf_p(prog_string fmt, ...);
	/**
	 * Converts the initial portion of the string to integer representation.
	 *
	 * In contrast to {@link strtol} this function does not detect overflow
	 * ({@link errno} is not changed and the result value is not predictable),
	 * uses smaller memory (flash and stack) and works more quickly.
	 */
	[CCode (cname="atoi")]
	public int to_int();
	/**
	 * Converts the initial portion of the string to integer representation.
	 *
	 * In contrast to {@link strtol} this function does not detect overflow
	 * ({@link errno} is not changed and the result value is not predictable),
	 * uses smaller memory (flash and stack) and works more quickly.
	 */
	[CCode (cname="atol")]
	public long to_long();
}
[Compact]
[Immutable]
[CCode (cname = "prog_char", const_cname = "const prog_char", copy_function = "", free_function = "", cheader_filename = "avr/io.h,avr/pgmspace.h")]
public class prog_string {
	public int length {
		[CCode (cname="strlen_P")]
		get;
	}
	[CCode(cname = "strchr_P")]
	public unowned string? findc(int c);
	[CCode(cname = "strchrnul_P")]
	public unowned string findc_nul(int c);
	[CCode(cname = "strrchr_P")]
	public unowned string? findc_r(int c);
}
namespace Posix {
	/**
	 * Setup for the UART baud rate prescaler registers of an AVR.
	 *
	 * This header file requires that, on entry, preprocessor values are already
	 * defined for {@link F_CPU} and '''BAUD'''. In addition, the
	 * {@link Baud.TOL} will define the baud rate tolerance (in percent) that is
	 * acceptable during the calculations.
	 */
	 namespace Baud {
		/**
		 * The acceptable baud rate tolerance in percent.
		 *
		 * If not set on entry, it will be set to its default value of 2.
		 */
		[CCode(cname = "BAUD_TOL", cheader_filename = "util/setbaud.h")]
		public const int TOL;
		/**
		 * The calculated baud rate prescaler value for the UBRR register.
		 */
		[CCode(cname = "UBRR_VALUE", cheader_filename = "util/setbaud.h")]
		public const int UBRR;
		/**
		 * The lower byte of the calculated prescaler value/
		 */
		[CCode(cname = "UBRRL_VALUE", cheader_filename = "util/setbaud.h")]
		public const uint8 UBRR_L;
		/**
		 * The upper byte of the calculated prescaler value.
		 */
		[CCode(cname = "UBRRH_VALUE", cheader_filename = "util/setbaud.h")]
		public const uint8 UBRR_H;
		/**
		 * Whether the desired baud rate tolerance could only be achieved by
		 * setting the U2X bit in the UART configuration.
		 */
		[CCode(cname = "USE_2X", cheader_filename = "util/setbaud.h")]
		public const bool USE_2X;
	}
	namespace Buffer {
		[CCode(cname = "strlcat")]
		public size_t append([CCode(array_length_type = "size_t", instance_pos = -1)] char[] buffer, string source);
		[CCode(cname = "strlcat_P")]
		public size_t append_p([CCode(array_length_type = "size_t", instance_pos = -1)] char[] buffer, prog_string source);
		[CCode(cname = "memcmp", cheader_filename = "stdlib.h")]
		public int compare([CCode(array_length = false)] uint8[] a, [CCode(array_length = false)] uint8[] b, size_t len);
		[CCode(cname = "memcmp_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
		public int compare_p([CCode(array_length = false)] uint8[] a, [CCode(array_length = false)] prog_uint8[] b, size_t len);
		[CCode(cname = "memcpy", cheader_filename = "stdlib.h")]
		public void copy([CCode(array_length = false)] uint8[] dest, [CCode(array_length_type = "size_t")] uint8[] source);
		[CCode(cname = "memcpy_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
		public void copy_p([CCode(array_length = false)] uint8[] dest, [CCode(array_length_type = "size_t")] prog_uint8[] source);
		[CCode(cname = "memccpy", cheader_filename = "stdlib.h")]
		public void copy_stop([CCode(array_length = false)] uint8[] dest, [CCode(array_length_type = "size_t", instance_pos = -1)] prog_uint8[] source, int stop_char);
		[CCode(cname = "memccpy_P", cheader_filename = "avr/io.h,avr/pgmspace.h")]
		public void copy_stop_p([CCode(array_length = false)] uint8[] dest, [CCode(array_length_type = "size_t", instance_pos = -1)] prog_uint8[] source, int stop_char);
		[CCode(cname = "memset", cheader_filename = "stdlib.h")]
		public void fill([CCode(array_length_type = "size_t", array_length_pos = -1)] uint8[] buffer, int @value);
		[CCode(cname = "memmem", cheader_filename = "stdlib.h", array_length = false)]
		public unowned uint8[]? find([CCode(array_length_type = "size_t")] uint8[] haystack, [CCode(array_length_type = "size_t")] uint8[] needle);
		[CCode(cname = "memmem_P", cheader_filename = "avr/io.h,avr/pgmspace.h", array_length = false)]
		public unowned uint8[]? find_p([CCode(array_length_type = "size_t")] uint8[] haystack, [CCode(array_length_type = "size_t")] prog_uint8[] needle);
		[CCode(cname = "memchr", cheader_filename = "stdlib.h", array_length = false)]
		public unowned uint8[]? findc([CCode(array_length_type = "size_t", array_length_pos = -1)] uint8[] buffer, int c);
		[CCode(cname = "memchr_P", cheader_filename = "avr/io.h,avr/pgmspace.h", array_length = false)]
		public unowned uint8[]? findc_p([CCode(array_length_type = "size_t", array_length_pos = -1)] prog_uint8[] buffer, int c);
		[CCode(cname = "memrchr", cheader_filename = "stdlib.h", array_length = false)]
		public unowned uint8[]? findc_r([CCode(array_length_type = "size_t", array_length_pos = -1)] uint8[] buffer, int c);
		[CCode(cname = "memrchr_P", cheader_filename = "avr/io.h,avr/pgmspace.h", array_length = false)]
		public unowned uint8[]? findc_rp([CCode(array_length_type = "size_t", array_length_pos = -1)] prog_uint8[] buffer, int c);
		[CCode(cname = "strnlen", cheader_filename = "stdlib.h")]
		public size_t length([CCode(array_length_type = "size_t")] char[] buffer);
		[CCode(cname = "strnlen", cheader_filename = "avr/io.h,avr/pgmspace.h")]
		public size_t length_p([CCode(array_length_type = "size_t")] prog_char[] buffer);
		/**
		 * Coverts all the characters in a buffer to upper case.
		 */
		[CCode(cname = "strlwr", cheader_filename = "stdlib.h")]
		public void lower([CCode(array_null_terminated = true)] char[] buffer);
		[CCode(cname = "memmove", cheader_filename = "stdlib.h")]
		public void move([CCode(array_length = false)] uint8[] dest, [CCode(array_length = false)] uint8[] src, size_t length);
		/**
		 * Puts formatted text into a buffer.
		 *
		 * @return the number of characters that would have been written to if there were enough space.
		 * @see FileStream.vprintf
		 */
		[CCode(cname = "snprintf")]
		[PrintfFormat]
		public int printf(char[] buffer, string fmt, ...);
		/**
		 * Variant of {@link sprintf} that uses a format string that resides in program memory.
		 */
		[CCode(cname = "snprintf_P")]
		[PrintfFormat]
		public int printf_p(char[] buffer, prog_string fmt, ...);
		[CCode(cname = "strlcpy")]
		public size_t replace([CCode(array_length_type = "size_t", instance_pos = -1)] char[] buffer, string source);
		[CCode(cname = "strlcpy_P")]
		public size_t replace_p([CCode(array_length_type = "size_t", instance_pos = -1)] char[] buffer, prog_string source);
		[CCode(cname = "strrev", cheader_filename = "stdlib.h")]
		public void reverse([CCode(array_null_terminated = true)] char[] buffer);
		/**
		 * Coverts all the characters in a buffer to lower case.
		 */
		[CCode(cname = "strupr", cheader_filename = "stdlib.h")]
		public void upper([CCode(array_null_terminated = true)] char[] buffer);
		/**
		 * Puts formatted text into a buffer from a varidiac list.
		 *
		 * @return the number of characters that would have been written to if
		 * there were enough space.
		 * @see FileStream.vprintf
		 */
		[CCode(cname = "vsnprintf")]
		[PrintfFormat]
		public int vprintf(char[] buffer, string fmt, va_list ap);
		/**
		 * Variant of {@link vsprintf} that uses a format string that resides in
		 * program memory.
		 */
		[CCode(cname = "vsnprintf_P")]
		[PrintfFormat]
		public int vprintf_p(char[] buffer, prog_string fmt, va_list ap);
	}
	[CCode(cheader_filename = "util/crc16.h")]
	namespace CRC {
		/**
		 * Optimized CRC-CCITT calculation.
		 *
		 * Polynomial: x^16 + x^12 + x^5 + 1 (0x8408)
		 *
		 * Initial value: 0xffff
		 *
		 * This is the CRC used by PPP and IrDA.
		 *
		 * See RFC1171 (PPP protocol) and IrDA IrLAP 1.1
		 *
		 * Although the CCITT polynomial is the same as that used by the Xmodem
		 * protocol, they are quite different. The difference is in how the bits
		 * are shifted through the alorgithm. Xmodem shifts the MSB of the CRC and
		 * the input first, while CCITT shifts the LSB of the CRC and the input
		 * first.
		 */
		[CCode(cname = "_crc_ccitt_update")]
		public uint16 ccitt(uint16 crc, uint8 data);
		/**
		 * Optimized Dallas (now Maxim) iButton 8-bit CRC calculation.
		 *
		 * Polynomial: x^8 + x^5 + x^4 + 1 (0x8C)<br
		 *
		 * Initial value: 0x0
		 *
		 * See http://www.maxim-ic.com/appnotes.cfm/appnote_number/27
		 */
		[CCode(cname = "_crc_ibutton_update")]
		public uint16 ibutton(uint16 crc, uint8 data);
		/**
		 * Optimized CRC-16 calculation.
		 *
		 * Polynomial: x^16 + x^15 + x^2 + 1 (0xa001)
		 *
		 * Initial value: 0xffff
		 *
		 * This CRC is normally used in disk-drive controllers.
		 */
		[CCode(cname = "_crc16_update")]
		public uint16 sixteen(uint16 crc, uint8 data);
		/**
		 * Optimized CRC-XMODEM calculation.
		 *
		 * Polynomial: x^16 + x^12 + x^5 + 1 (0x1021)
		 *
		 * Initial value: 0x0
		 *
		 * This is the CRC used by the Xmodem-CRC protocol.
		 */
		[CCode(cname = "_crc_xmodem_update")]
		public uint16 xmodem(uint16 crc, uint8 data);
	}
	/**
	 * EEPROM handling
	 *
	 * This is the interface to some simple library routines suitable for
	 * handling the data EEPROM contained in the AVR microcontrollers. The
	 * implementation uses a simple polled mode interface. Applications that
	 * require interrupt-controlled EEPROM access to ensure that no time will be
	 * wasted in spinloops will have to deploy their own implementation.
	 *
	 * As these functions modify IO registers, they are known to be
	 * non-reentrant. If any of these functions are used from both, standard and
	 * interrupt context, the applications must ensure proper protection (e.g.,
	 * by disabling interrupts before accessing them).
	 *
	 * For Xmega the EEPROM start address is 0, like other architectures. The
	 * reading functions add the 0x2000 value to use EEPROM mapping into data
	 * space.
	 */
	[CCode(cheader_filename = "avr/eeprom.h")]
	namespace Eeprom {
		[CCode(cname = "uint8_t", cprefix = "EE")]
		public enum Control {
			RE,
			WE,
			MWE,
			RIE
		}
		/**
		 * Control Register
		 */
		[CCode(cname = "EECR")]
		public Control control;
		/**
		 * Data Register
		 */
		[CCode(cname = "EEDR")]
		public uint8 data;
		/**
		 * Address Register
		 */
		[CCode(cname = "EEAR")]
		public uint16 address;
		[CCode(cname = "EEARH")]
		public uint8 address_high;
		[CCode(cname = "EEARL")]
		public uint8 address_low;
		/**
		 * Loops until the eeprom is no longer busy.
		 */
		[CCode(cname = "eeprom_busy_wait")]
		public void busy_wait();
		/**
		 * Check if EEPROM is ready for a new read/write operation.
		 *
		 * All of the read/write functions first make sure the EEPROM is ready to be accessed. Since this may cause long delays if a write operation is still pending, time-critical applications should first poll the EEPROM before attempting any actual I/O.
		 */
		[CCode(cname = "eeprom_is_ready")]
		public bool is_ready();
		[CCode (cname = "uint8_t EEMEM", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0U")]
		[IntegerType (rank = 3, min = 0, max = 255)]
		public struct eem_uint8 {
		}
		/**
		 * A {@link uint8} located in EEPROM.
		 */
		[CCode (cname = "uint8_t*")]
		[SimpleType]
		public struct eeprom_uint8 {
			[CCode(cname = "")]
			public eeprom_uint8(ref eem_uint8 source);
			/**
			 * Read from an EEPROM address.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_read_byte")]
			public uint8 read();
			/**
			 * Write to an EEPROM address.
			 *
			 * Writing forces erase_and_write programming mode.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_write_byte")]
			public void write(uint8 @value);
			/**
			 * Update to an EEPROM address.
			 *
			 * This reads each byte first and skip the burning if the old value is
			 * the same with new. The scaning direction is from high address to low,
			 * to obtain quick return in common cases.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_update_byte")]
			public void update(uint8 @value);
		}
		[CCode (cname = "uint16_t EEMEM", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0U")]
		[IntegerType (rank = 5, min = 0, max = 65535)]
		public struct eem_uint16 {
		}
		/**
		 * A {@link uint16} located in EEPROM.
		 */
		[CCode (cname = "uint16_t*")]
		[SimpleType]
		public struct eeprom_uint16 {
			[CCode(cname = "")]
			public eeprom_uint16(ref eem_uint16 source);
			/**
			 * Read from an EEPROM address.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_read_word")]
			public uint16 read();
			/**
			 * Write to an EEPROM address.
			 *
			 * Writing forces erase_and_write programming mode.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_write_word")]
			public void write(uint16 @value);
			/**
			 * Update to an EEPROM address.
			 *
			 * This reads each byte first and skip the burning if the old value is
			 * the same with new. The scaning direction is from high address to low,
			 * to obtain quick return in common cases.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_update_word")]
			public void update(uint16 @value);
		}
		[CCode (cname = "uint32_t EEMEM", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0U")]
		[IntegerType (rank = 5, min = 0, max = 65535)]
		public struct eem_uint32 {
		}
		/**
		 * A {@link uint32} located in EEPROM.
		 */
		[CCode (cname = "uint32_t*")]
		[SimpleType]
		public struct eeprom_uint32 {
			[CCode(cname = "")]
			public eeprom_uint32(ref eem_uint32 source);
			/**
			 * Read from an EEPROM address.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_read_dword")]
			public uint32 read();
			/**
			 * Write to an EEPROM address.
			 *
			 * Writing forces erase_and_write programming mode.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_write_dword")]
			public void write(uint32 @value);
			/**
			 * Update to an EEPROM address.
			 *
			 * This reads each byte first and skip the burning if the old value is
			 * the same with new. The scaning direction is from high address to low,
			 * to obtain quick return in common cases.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_update_dword")]
			public void update(uint32 @value);
		}
		[CCode (cname = "float EEMEM", cheader_filename = "avr/io.h,avr/pgmspace.h", default_value = "0U")]
		[FloatingType (rank = 1)]
		public struct eem_float {
		}
		/**
		 * A {@link float} located in EEPROM.
		 */
		[CCode (cname = "float*")]
		[SimpleType]
		public struct eeprom_float {
			[CCode(cname = "")]
			public eeprom_float(ref eem_float source);
			/**
			 * Read from an EEPROM address.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_read_float")]
			public float read();
			/**
			 * Write to an EEPROM address.
			 *
			 * Writing forces erase_and_write programming mode.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_write_float")]
			public void write(float @value);
			/**
			 * Update to an EEPROM address.
			 *
			 * This reads each byte first and skip the burning if the old value is
			 * the same with new. The scaning direction is from high address to low,
			 * to obtain quick return in common cases.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_update_float")]
			public void update(float @value);
		}
		/**
		 * A {@link uint8} array located in EEPROM.
		 */
		[CCode (cname = "block*")]
		[SimpleType]
		public struct eeprom_block {
			[CCode(cname = "")]
			public eeprom_block(ref eem_uint8[] source);
			/**
			 * Read from an EEPROM address.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_read_block", instance_pos = 1.1)]
			public void read([CCode(array_length_type = "size_t", array_length_pos = 1.2)] uint8[] dst);
			/**
			 * Write to an EEPROM address.
			 *
			 * Writing forces erase_and_write programming mode.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_write_block")]
			public void write([CCode(array_length_type = "size_t")] uint8[] @value);
			/**
			 * Update to an EEPROM address.
			 *
			 * This reads each byte first and skip the burning if the old value is
			 * the same with new. The scaning direction is from high address to low,
			 * to obtain quick return in common cases.
			 * @see is_ready
			 */
			[CCode(cname = "eeprom_update_block")]
			public void update([CCode(array_length_type = "size_t")] uint8[] @value);
		}
	}
	[CCode(prefix = "M_", cheader_filename = "math.h")]
	namespace Math {
		/**
		 * The constant e.
		 */
		public const double E;
		/**
		 * Infinity constant.
		 */
		[CCode(cname = "INFINITY")]
		public const double INFINITY;
		/**
		 * The natural logarithm of 2.
		 */
		public const double LN2;
		/**
		 * The natural logarithm of 10.
		 */
		public const double LN10;
		/**
		 * The logarithm of the e to base 2.
		 */
		public const double LOG2E;
		/**
		 * The logarithm of the e to base 10.
		 */
		public const double LOG10E;
		/**
		 * Not a number constant.
		 */
		[CCode(cname = "NAN")]
		public const double NAN;
		/**
		 * The constant 1/π.
		 */
		[CCode(cname = "M_1_PI")]
		public const double OVER_PI;
		/**
		 * The constant π.
		 */
		public const double PI;
		/**
		 * The constant π/2.
		 */
		public const double PI_2;
		/**
		 * The constant π/4.
		 */
		public const double PI_4;
		/**
		 * The square root of 2.
		 */
		public const double SQRT2	;
		/**
		 * The constant 1/√2.
		 */
		public const double SQRT1_2;
		/**
		 * The constant 2/π.
		 */
		[CCode(cname = "M_2_PI")]
		public const double TWO_OVER_PI;
		/**
		 * The constant 2/√π.
		 */
		[CCode(cname = "M_2_SQRTPI")]
		public const double TWO_OVER_SQRTPI;
	}
	/**
	 * Power Reduction Management
	 *
	 * Many AVRs contain a Power Reduction Register (PRR) or Registers (PRRx)
	 * that allow you to reduce power consumption by disabling or enabling
	 * various on-board peripherals as needed.
	 *
	 * Not all AVR devices have a Power Reduction Register (for example the
	 * ATmega128). On those devices without a Power Reduction Register, these
	 * macros are not available.
	 *
	 * Not all AVR devices contain the same peripherals (for example, the LCD
	 * interface), or they will be named differently (for example, USART and
	 * USART0). Please consult your device's datasheet, or the header file, to
	 * find out which macros are applicable to your device.
	 */
	[CCode(cheader_filename = "avr/power.h")]
	namespace Power {
		/**
		 * Disable the Analog to Digital Converter module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, AT90PWM81, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_adc_disable")]
		public void adc_disable();
		/**
		 * Enable the Analog to Digital Converter module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, AT90PWM81, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_adc_enable")]
		public void adc_enable();
		/**
		 * Disable all modules.
		 *
		 * ATxmega6A4, ATxmega32A4, ATxmega64A1, ATxmega64A1U, ATxmega64A3, ATxmegaA1, ATxmegaA1U, ATxmega128A3, ATxmega192A3, ATxmega256A3, ATxmegaA3B, ATxmega16D4, ATxmega32D4, ATxmega64D3, ATxmega128D3,ATxmega192D3, ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega325A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_all_disable")]
		public void all_disable();
		/**
		 * Enable all modules.
		 *
		 * ATxmega6A4, ATxmega32A4, ATxmega64A1, ATxmega64A1U, ATxmega64A3, ATxmegaA1, ATxmegaA1U, ATxmega128A3, ATxmega192A3, ATxmega256A3, ATxmegaA3B, ATxmega16D4, ATxmega32D4, ATxmega64D3, ATxmega128D3, ATxmega192D3, ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega325A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_all_enable")]
		public void all_enable();
		/**
		 * Disable the LCD module.
		 *
		 * ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490
		 */
		[CCode(cname = "power_lcd_disable")]
		public void lcd_disable();
		/**
		 * Enable the LCD module.
		 *
		 * ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490
		 */
		[CCode(cname = "power_lcd_enable")]
		public void lcd_enable();
		/**
		 * Disable the Power Stage Controller 0 module.
		 *
		 * AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B
		 */
		[CCode(cname = "power_psc0_disable")]
		public void psc0_disable();
		/**
		 * Enable the Power Stage Controller 0 module.
		 *
		 * AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B
		 */
		[CCode(cname = "power_psc0_enable")]
		public void psc0_enable();
		/**
		 * Disable the Power Stage Controller 1 module.
		 *
		 * AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B
		 */
		[CCode(cname = "power_psc1_disable")]
		public void psc1_disable();
		/**
		 * Enable the Power Stage Controller 1 module.
		 *
		 * AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B
		 */
		[CCode(cname = "power_psc1_enable")]
		public void psc1_enable();
		/**
		 * Disable the Power Stage Controller 2 module.
		 *
		 * AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM81
		 */
		[CCode(cname = "power_psc2_disable")]
		public void psc2_disable();
		/**
		 * Enable the Power Stage Controller 2 module.
		 *
		 * AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM81
		 */
		[CCode(cname = "power_psc2_enable")]
		public void psc2_enable();
		/**
		 * Disable the Reduced Power Stage Controller module.
		 *
		 * AT90PWM81
		 */
		[CCode(cname = "power_pscr_disable")]
		public void pscr_disable();
		/**
		 * Enable the Reduced Power Stage Controller module.
		 *
		 * AT90PWM81
		 */
		[CCode(cname = "power_pscr_enable")]
		public void pscr_enable();
		/**
		 * Disable the Serial Peripheral Interface module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, AT90PWM81, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_spi_disable")]
		public void spi_disable();
		/**
		 * Enable the Serial Peripheral Interface module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, AT90PWM81, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_spi_enable")]
		public void spi_enable();
		/**
		 * Disable the Timer 0 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_timer0_disable")]
		public void timer0_disable();
		/**
		 * Enable the Timer 0 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM216, AT90PWM316, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_timer0_enable")]
		public void timer0_enable();
		/**
		 * Disable the Timer 1 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, AT90PWM81, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_timer1_disable")]
		public void timer1_disable();
		/**
		 * Enable the Timer 1 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, AT90PWM1, AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B, AT90PWM216, AT90PWM316, AT90PWM81, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168, ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_timer1_enable")]
		public void timer1_enable();
		/**
		 * Disable the Timer 2 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_timer2_disable")]
		public void timer2_disable();
		/**
		 * Enable the Timer 2 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_timer2_enable")]
		public void timer2_enable();
		/**
		 * Disable the Timer 3 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287
		 */
		[CCode(cname = "power_timer3_disable")]
		public void timer3_disable();
		/**
		 * Enable the Timer 3 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287
		 */
		[CCode(cname = "power_timer3_enable")]
		public void timer3_enable();
		/**
		 * Disable the Timer 4 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_timer4_disable")]
		public void timer4_disable();
		/**
		 * Enable the Timer 4 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_timer4_enable")]
		public void timer4_enable();
		/**
		 * Disable the Timer 5 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_timer5_disable")]
		public void timer5_disable();
		/**
		 * Enable the Timer 5 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_timer5_enable")]
		public void timer5_enable();
		/**
		 * Disable the Two Wire Interface module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_twi_disable")]
		public void twi_disable();
		/**
		 * Enable the Two Wire Interface module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, ATmega164P, ATmega324P, ATmega644, ATmega406, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_twi_enable")]
		public void twi_enable();
		/**
		 * Disable the USART 0 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_usart0_disable")]
		public void usart0_disable();
		/**
		 * Enable the USART 0 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, ATmega165, ATmega165P, ATmega325, ATmega325A, ATmega3250, ATmega3250A, ATmega645, ATmega6450, ATmega169, ATmega169P, ATmega329, ATmega329A, ATmega3290, ATmega3290A, ATmega649, ATmega6490, ATmega164P, ATmega324P, ATmega644, ATmega48, ATmega88, ATmega168
		 */
		[CCode(cname = "power_usart0_enable")]
		public void usart0_enable();
		/**
		 * Disable the USART 1 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, ATmega164P, ATmega324P, ATmega644
		 */
		[CCode(cname = "power_usart1_disable")]
		public void usart1_disable();
		/**
		 * Enable the USART 1 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega128RFA1, ATmega2560, ATmega2561, AT90USB646, AT90USB647, AT90USB1286, AT90USB1287, ATmega164P, ATmega324P, ATmega644
		 */
		[CCode(cname = "power_usart1_enable")]
		public void usart1_enable();
		/**
		 * Disable the USART 2 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_usart2_disable")]
		public void usart2_disable();
		/**
		 * Enable the USART 2 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_usart2_enable")]
		public void usart2_enable();
		/**
		 * Disable the USART 3 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_usart3_disable")]
		public void usart3_disable();
		/**
		 * Enable the USART 3 module.
		 *
		 * ATmega640, ATmega1280, ATmega1281, ATmega2560, ATmega2561
		 */
		[CCode(cname = "power_usart3_enable")]
		public void usart3_enable();
		/**
		 * Disable the USART module.
		 *
		 * AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B
		 */
		[CCode(cname = "power_usart_disable")]
		public void usart_disable();
		/**
		 * Enable the USART module.
		 *
		 * AT90PWM2, AT90PWM2B, AT90PWM3, AT90PWM3B
		 */
		[CCode(cname = "power_usart_enable")]
		public void usart_enable();
		/**
		 * Disable the USB module.
		 *
		 * AT90USB646, AT90USB647, AT90USB1286, AT90USB1287
		 */
		[CCode(cname = "power_usb_disable")]
		public void usb_disable();
		/**
		 * Enable the USB module.
		 *
		 * AT90USB646, AT90USB647, AT90USB1286, AT90USB1287
		 */
		[CCode(cname = "power_usb_enable")]
		public void usb_enable();
		/**
		 * Disable the Universal Serial Interface module.
		 *
		 * ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_usi_disable")]
		public void usi_disable();
		/**
		 * Enable the Universal Serial Interface module.
		 *
		 * ATtiny24, ATtiny44, ATtiny84, ATtiny84A, ATtiny25, ATtiny45, ATtiny85, ATtiny261, ATtiny461, ATtiny861
		 */
		[CCode(cname = "power_usi_enable")]
		public void usi_enable();
		/**
		 * Disable the Voltage ADC module.
		 *
		 * ATmega406
		 */
		[CCode(cname = "power_vadc_disable")]
		public void vadc_disable();
		/**
		 * Enable the Voltage ADC module.
		 *
		 * ATmega406
		 */
		[CCode(cname = "power_vadc_enable")]
		public void vadc_enable();
	}
	namespace Random {
		/**
		 * Highest number that can be generated by {@link next}.
		 */
		[CCode(cname = "RANDOM_MAX", cheader_filename = "stdlib.h")]
		public const int MAX;
		/**
		 * Computes a sequence of pseudo-random integers in the range of 0 to {@link MAX}.
		 */
		[CCode(cname = "random", cheader_filename = "stdlib.h")]
		public long next();
		/**
		 * Variant of {@link next} that stores the context in the user-supplied variable so the function becomes re-entrant.
		 */
		[CCode(cname = "random_r", cheader_filename = "stdlib.h")]
		public long next_r(ref ulong ctx);
		/**
		 * Sets the seed for a new sequence of pseudo-random numbers to be returned by {@link next}.
		 *
		 * These sequences are repeatable with the same seed value.
		 *
		 * If no seed value is provided, the functions are automatically seeded with a value of 1.
		 */
		[CCode(cname = "srandom", cheader_filename = "stdlib.h")]
		public void set_seed(ulong seed);
	}
	/**
	 * Clock System Prescale Register control
	 *
	 * Some of the newer AVRs contain a System Clock Prescale Register (CLKPR)
	 * that allows you to decrease the system clock frequency and the power
	 * consumption when the need for processing power is low. Below are two
	 * macros and an enumerated type that can be used to interface to the Clock
	 * Prescale Register.
	 *
	 * Not all AVR devices have a Clock Prescale Register.
	 */
	[CCode(cname = "clock_div_t", cheader_filename = "avr/power.h")]
	public enum ClockDiv {
		[CCode(cname = "clock_div_1")]
		ONE,
		[CCode(cname = "clock_div_2")]
		TWO,
		[CCode(cname = "clock_div_4")]
		FOUR,
		[CCode(cname = "clock_div_8")]
		EIGHT,
		[CCode(cname = "clock_div_16")]
		SIXTEEN,
		[CCode(cname = "clock_div_32")]
		THIRY_TWO,
		[CCode(cname = "clock_div_64")]
		SIXTY_FOUR,
		[CCode(cname = "clock_div_128")]
		ONE_TWENTY_EIGHT,
		[CCode(cname = "clock_div_256")]
		TWO_FIFTY_SIX;
		[CCode(cname = "clock_prescale_set")]
		public void set();
		[CCode(cname = "clock_prescale_get")]
		public static ClockDiv get();
	}
	[CCode(cname = "int", cprefix = "E", cheader_filename = "errno.h")]
	public enum Error {
		/**
		 * Domain error
		 */
		DOM,
		/**
		 * Range error
		 */
		RANGE
	}
	[CCode(cname = "uint8_t", cprefix = "SREG_")]
	public enum Status {
		C,
		Z,
		N,
		V,
		S,
		H,
		T,
		I
	}
	/**
	 * I²C status
	 *
	 * ''MT'' is the master transmitter, ''MR'' is the master receiver, ''ST'' is the slave transmitter, and ''SR'' is the slave receiver.
 */
	[CCode(cname = "int", cheader_filename = "avr/twi.h", cprefix = "TW_")]
	public enum Twi {
		/**
		 * Start condition transmitted
		 */
		START,
		/**
		 * Repeated start condition transmitted
			*/
		REP_START,
		/**
		 * SLA+W transmitted, ACK received
		 */
		MT_SLA_ACK,
		/**
		 * SLA+W transmitted, NACK received
		 */
		MT_SLA_NACK,
		/**
		 * Data transmitted, ACK received
		 */
		MT_DATA_ACK,
		/**
		 * Data transmitted, NACK received
		 */
		MT_DATA_NACK,
		/**
 arbItration lost in SLA+W or data
		 */
		MT_ARB_LOST,
		/**
		 * Arbitration lost in SLA+R or NACK
		 */
		MR_ARB_LOST,
		/**
		 * SLA+R transmitted, ACK received
		 */
		MR_SLA_ACK,
		/**
		 * SLA+R transmitted, NACK received
		 */
		MR_SLA_NACK,
		/**
		 * Data received, ACK returned
		 */
		MR_DATA_ACK,
		/**
		 * Data received, NACK returned
		 */
		MR_DATA_NACK,
		/**
		 * SLA+R received, ACK returned
		 */
		ST_SLA_ACK,
		/**
		 * Arbitration lost in SLA+RW, SLA+R received, ACK returned
		 */
		ST_ARB_LOST_SLA_ACK,
		/**
		 * Data transmitted, ACK received
		 */
		ST_DATA_ACK,
		/**
		 * Data transmitted, NACK received
		 */
		ST_DATA_NACK,
		/**
		 * Last data byte transmitted, ACK received
		 */
		ST_LAST_DATA,
		/**
		 * SLA+W received, ACK returned
		 */
		SR_SLA_ACK,
		/**
		 * Arbitration lost in SLA+RW, SLA+W received, ACK returned
		 */
		SR_ARB_LOST_SLA_ACK,
		/**
		 * General call received, ACK returned
		 */
		SR_GCALL_ACK,
		/**
		 * Arbitration lost in SLA+RW, general call received, ACK returned
		 */
		SR_ARB_LOST_GCALL_ACK,
		/**
		 * Data received, ACK returned
		 */
		SR_DATA_ACK,
		/**
		 * Data received, NACK returned
		 */
		SR_DATA_NACK,
		/**
		 * General call data received, ACK returned
		 */
		SR_GCALL_DATA_ACK,
		/**
		 * General call data received, NACK returned
		 */
		SR_GCALL_DATA_NACK,
		/**
		 * Stop or repeated start condition received while selected
		 */
		SR_STOP,
		/**
		 * No state information available
		 */
		NO_INFO,
		/**
		 * Illegal start or stop condition
		 */
		BUS_ERROR;
		[CCode(cname = "TW_READ & TWSR", cheader_filename = "util/twi.h")]
		public const bool IS_READ;
		[CCode(cname = "TW_STATUS", cheader_filename = "util/twi.h")]
		public const Twi REGISTER;
	}
	[CCode(cheader_filename = "stdio.h", cname = "int", cprefix = "_FDEV_SETUP_")]
	public enum FileMode {
		READ,
		WRITE,
		RW
	}
	[CCode(cname = "div_t", cheader_filename = "stdlib.h")]
	public struct div_t {
		/**
		 * The quotient
		 */
		int quot;
		/**
		 * The remainder
		 */
		int rem;
	}
	[CCode(cname = "ldiv_t", cheader_filename = "stdlib.h")]
	public struct ldiv_t {
		/**
		 * The quotient
		 */
		long quot;
		/**
		 * The remainder
		 */
		long rem;
	}
	[CCode(cheader_filename = "stdio.h", cname = "FILE", free_function = "")]
	public struct FileStream {
		/**
		 * Declares the value that is returned by various standard IO functions in
		 * case of an error. Since the AVR platform (currently) doesn't contain an
		 * abstraction for actual files, its origin as "end of file" is somewhat
		 * meaningless here.
		 */
		[CCode(cname = "EOF")]
		public const int EOF;
		/**
		 * Return code for an error condition during device read.
		 *
		 * @see GetChar
		 */
		[CCode(cname = "_FDEV_ERR")]
		public const int FDEV_ERR;
		/**
		 * Return code for an end-of-file condition during device read.
		 *
		 * @see GetChar
		 */
		[CCode(cname = "_FDEV_EOF")]
		public const int FDEV_EOF;
		public void* data {
			[CCode(cname = "fdev_set_udata")]
			set;
			[CCode(cname = "fdev_get_udata")]
			get;
		}
		/**
		 * The error flag.
		 *
		 * This flag can only be cleared by a call to {@link clearerr}.
		 */
		public bool error {
			[CCode(cname = "ferror")]
			get;
		}
		/**
		 * The end-of-file flag.
		 *
		 * This flag can only be cleared by a call to {@link clearerr}.
		 */
		public bool	eof {
			[CCode(cname = "feof")]
			get;
		}
		/**
		 * Setup a user-supplied buffer as an stdio stream
		 *
		 * No assignments to the standard streams will be performed by. If standard
		 * streams are to be used, these need to be assigned by the user. See also
		 * under “Running stdio without malloc()”.
		 */
		[CCode(cname = "fdev_setup_stream", instance_pos = 0)]
		public FileStream(PutChar? pc, GetChar? gc, FileMode m);
		/**
		 * Clear the error and end-of-file flags.
		 */
		[CCode(cname = "clearerr")]
		public void clearerr();
		/**
		 * Flush the stream.
		 *
		 * This is a null operation provided for source-code compatibility only, as
		 * the standard IO implementation currently does not perform any buffering.
		 */
		[CCode(cname = "!fflush")]
		public bool flush();
		/**
		 * Reads a character from \c stream.
		 * @return the character, or {@link EOF} in case end-of-file was
		 * encountered or an error occurred.
		 * @see eof
		 * @see error
		 */
		[CCode(cname = "fgetc")]
		public int getc();
		/**
		 * Read bytes until a newline character was encountered.
		 * @param buffer where to store the characters
		 * @return If an error has encountered, null and the error flag is set. Otherwise, line read.
		 * @see error
		 */
		[CCode(cname = "fgets", instance_pos = -1)]
		public unowned string? gets(uint8[] buffer);
		[CCode(cname = "fprintf")]
		[PrintfFormat]
		public int printf(string fmt, ...);
		/**
		 * Variant of {@link printf} that uses a string that resides in program memory.
		 */
		[CCode(cname = "fprintf_P")]
		[PrintfFormat]
		public int printf_p(prog_string fmt, ...);
		/**
		 * Sends the character to the stream.
		 * @return the character, or {@link EOF} in case an error occurred.
		 */
		[CCode(cname = "fputc", instance_pos = -1)]
		public int putc(int c);
		/**
		 * Write the string to the stream.
		 */
		[CCode(cname = "!fputs", instance_pos = -1)]
		public bool puts(string str);
		/**
		 * Variant of {@link puts} where the string resides in program memory.
		 */
		[CCode(cname = "!fputs_P", instance_pos = -1)]
		public bool puts_p(prog_string str);
		/**
		 * Read bytes into a buffer.
		 * @return the number of bytes successfully read, unless an input error
		 * occured or end-of-file was encountered. {@link eof} and {@link error}
		 * must be used to distinguish between these two conditions.
		 */
		[CCode(cname = "fread", instance_pos = -1)]
		public size_t read([CCode(array_length_pos = -1)] uint8[] buffer, size_t size = 1);
		/**
		 * Reads formatted input, reading the input data from the stream.
		 * @see vscanf for details.
		 */
		[CCode(cname = "fscanf")]
		[ScanfFormat]
		public int scanf(string fmt, ...);
		/**
		 * Variant of {@link scanf} using a format string in program memory.
		 */
		[CCode(cname = "fscanf_P")]
		[ScanfFormat]
		public int scanf_p(prog_string fmt, ...);
		/**
		 * Write bytes.
		 * @return the number of bytes written
		 */
		[CCode(cname = "fwrite", instance_pos = -1)]
		public size_t write([CCode(array_length_pos = -1)] uint8[] data, size_t size = 1);
		/**
		 * Outputs values to a stream under control of a format string. The actual values to print are passed as a variable argument list.
		 *
		 * The format string is composed of zero or more directives: ordinary
		 * characters (not '''%'''), which are copied unchanged to the output
		 * stream; and conversion specifications, each of which results in fetching
		 * zero or more subsequent arguments. Each conversion specification is
		 * introduced by the '''%''' character. The arguments must properly
		 * correspond (after type promotion) with the conversion specifier. After
		 * the '''%''', the following appear in sequence:
		 *
		 * Zero or more of the following flags:
		 *
		 * '''#''' The value should be converted to an "alternate form". For c, d,
		 * i, s, and u conversions, this option has no effect. For o conversions,
		 * the precision of the number is increased to force the first character of
		 * the output string to a zero (except if a zero value is printed with an
		 * explicit precision of zero). For x and X conversions, a non-zero result
		 * has the string `0x' (or `0X' for X conversions) prepended to it.
		 *
		 * '''0''' (zero) Zero padding. For all conversions, the converted value
		 * is padded on the left with zeros rather than blanks. If a precision is
		 * given with a numeric conversion (d, i, o, u, i, x, and X), the 0 flag is
		 * ignored.
		 *
		 * '''-''' A negative field width flag; the converted value is to be left
		 * adjusted on the field boundary. The converted value is padded on the
		 * right with blanks, rather than on the left with blanks or zeros. A -
		 * overrides a 0 if both are given.
		 *
		 * (space) A blank should be left before a positive number produced by a
		 * signed conversion (d, or i).
		 *
		 * '''+''' A sign must always be placed before a number produced by a
		 * signed conversion. A + overrides a space if both are used.
		 *
		 * An optional decimal digit string specifying a minimum field width. If
		 * the converted value has fewer characters than the field width, it will
		 * be padded with spaces on the left (or right, if the left-adjustment flag
		 * has been given) to fill out the field width.
		 *
		 * An optional precision, in the form of a period followed by an optional
		 * digit string. If the digit string is omitted, the precision is taken as
		 * zero. This gives the minimum number of digits to appear for d, i, o, u,
		 * x, and X conversions, or the maximum number of characters to be printed
		 * from a string for '''s''' conversions.
		 *
		 * An optional '''l''' or '''h''' length modifier, that specifies that the
		 * argument for the d, i, o, u, x, or X conversion is a {@link long} rather
		 * than {@link int}. The '''h''' is ignored, as {@link short} is equivalent
		 * to {@link int}.
		 *
		 * A character that specifies the type of conversion to be applied.
		 *
		 * The conversion specifiers and their meanings are:
		 *
		 * '''diouxX''' The {@link int} (or appropriate variant) argument is
		 * converted to signed decimal (d and i), unsigned octal (o), unsigned
		 * decimal (u), or unsigned hexadecimal (x and X) notation. The letters
		 * "abcdef" are used for x conversions; the letters "ABCDEF" are used for X
		 * conversions. The precision, if any, gives the minimum number of digits
		 * that must appear; if the converted value requires fewer digits, it is
		 * padded on the left with zeros.
		 *
		 * '''p''' The argument is taken as an unsigned integer, and converted
		 * similarly as a '''%#x''' command would do.
		 *
		 * '''c''' The {@link int} argument is converted to an {@link uchar}, and
		 * the resulting character is written.
		 *
		 * '''s''' The string argument is written up to (but not including) a
		 * terminating NUL character; if a precision is specified, no more than the
		 * number specified are written. If a precision is given, no null
		 * character need be present; if the precision is not specified, or is
		 * greater than the size of the string, the array must contain a
		 * terminating NUL character.
		 *
		 * '''%''' A '''%''' is written. No argument is converted.
		 *
		 * '''eE''' The double argument is rounded and converted in the format
		 * '''[-]d.ddde±dd''' where there is one digit before the decimal-point
		 * character and the number of digits after it is equal to the precision;
		 * if the precision is missing, it is taken as 6; if the precision is zero,
		 * no decimal-point character appears. An '''E''' conversion uses the
		 * letter '''E''' (rather than '''e''') to introduce the exponent. The
		 * exponent always contains two digits; if the value is zero, the exponent
		 * is 00.
		 *
		 * '''fF''' The double argument is rounded and converted to decimal
		 * notation in the format '''[-]ddd.ddd''', where the number of digits
		 * after the decimal-point character is equal to the precision
		 * specification. If the precision is missing, it is taken as 6; if the
		 * precision is explicitly zero, no decimal-point character appears. If a
		 * decimal point appears, at least one digit appears before it.
		 *
		 * '''gG''' The double argument is converted in style '''f''' or '''e'''
		 * (or '''F''' or '''E''' for '''G''' conversions). The precision
		 * specifies the number of significant digits. If the precision is
		 * missing, 6 digits are given; if the precision is zero, it is treated as
		 * 1. Style '''e''' is used if the exponent from its conversion is less
		 * than -4 or greater than or equal to the precision. Trailing zeros are
		 * removed from the fractional part of the result; a decimal point appears
		 * only if it is followed by at least one digit.
		 *
		 * '''S''' Similar to the '''s''' format, except the pointer is expected to
		 * point to a program-memory (ROM) string instead of a RAM string.
		 *
		 * In no case does a non-existent or small field width cause truncation of
		 * a numeric field; if the result of a conversion is wider than the field
		 * width, the field is expanded to contain the conversion result.
		 *
		 * Since the full implementation of all the mentioned features becomes
		 * fairly large, three different flavours can be selected using linker
		 * options. The default implements all the mentioned functionality except
		 * floating point conversions. A minimized version of is available that
		 * only implements the very basic integer and string conversion facilities,
		 * but only the '''#''' additional option can be specified using conversion
		 * flags (these flags are parsed correctly from the format specification,
		 * but then simply ignored). This version can be requested using the
		 * following compiler options:
		 *
		 * {{{
		 * -Wl,-u,vfprintf -lprintf_min
		 * }}}
		 *
		 * If the full functionality including the floating point conversions is
		 * required, the following options should be used:
		 *
		 * {{{
		 * -Wl,-u,vfprintf -lprintf_flt -lm
		 * }}}
		 *
		 * The specified width and precision can be at most 255.
		 *
		 * For floating-point conversions, if you link default or minimized
		 * version, the symbol '''?''' will be output and double argument will be
		 * skiped. So you output below will not be crashed. For default version
		 * the width field and the "pad to left" (symbol minus) option will work in
		 * this case.
		 *
		 * The '''hh''' length modifier is ignored ({@link char} argument is
		 * promouted to {@link int}). More exactly, this realization does not check
		 * the number of '''h''' symbols.
		 *
		 * The '''ll''' length modifier will to abort the output, as this
		 * realization does not operate {@link int64} arguments.
		 *
		 * The variable width or precision field (an asterisk symbol) is not
		 * realized and will to abort the output.
		 */
		[CCode(cname = "vfprintf")]
		public int vprintf(string fmt, va_list ap);
		/**
		 * Variant of {@link vprintf} that uses a string that resides in program memory.
		 */
		[CCode(cname = "vfprintf_P")]
		public int vprintf_p(prog_string fmt, va_list ap);
		[CCode(cname = "vfscanf")]
		public int vscanf(string fmt, va_list ap);
		/**
		 * Variant of {@link vscanf} using a format string in program memory.
		 */
		[CCode(cname = "vfscanf_P")]
		public int vscanf_p(prog_string fmt, va_list ap);
		/**
		 * Pushes a character back onto the input stream.
		 *
		 * The pushed-back character will be returned by a subsequent read on the stream.
		 *
		 * Currently, only a single character can be pushed back onto the stream.
		 * @return the character pushed back after the conversion, or {@link EOF} if the operation fails.
		 */
		[CCode(cname = "ungetc", instance_pos = -1)]
		public int ungetc(int c);
	}
	/**
	 * The CPU clock frequency (in Hertz).
	 *
	 * You may wish to pass this in as a compiler flag.
	 */
	[CCode(cname = "F_CPU", cheader_filename = "util/delay.h")]
	public const long F_CPU;
	[CCode(cheader_filename = "assert.h", cname = "assert")]
	public void assert(bool expression);
	[CCode(cname = "errno", cheader_filename = "errno.h")]
	public Error errno;
	/**
	 * Stream that will be used as an input stream.
	 */
	[CCode(cheader_filename = "stdio.h", cname = "stdin")]
	public FileStream stdin;
	/**
	 * Stream that will be used as an output stream.
	 */
	[CCode(cheader_filename = "stdio.h", cname = "stdout")]
	public FileStream stdout;
	/**
	 * Stream destined for error output. Unless specifically assigned, identical to {@link stdout}.
	 */
	[CCode(cheader_filename = "stdio.h", cname = "stderr")]
	public FileStream stderr;
	/**
	 * Comparison function type
	 */
	[CCode(cname = "__compar_fn_t", has_target = false, simple_generics = true, cheader_filename = "stdlib.h")]
	public delegate int Compare<T>(T x, T y);
	[CCode(cname = "get", has_target = false)]
	public delegate int GetChar(FileStream file);
	[CCode(cname = "put", has_target = false)]
	public delegate bool PutChar(char c, FileStream file);
	/**
	 * Causes abnormal program termination to occur.
	 *
	 * This realization disables interrupts and jumps to {@link exit} function
	 * with argument equal to 1. In the limited AVR environment, execution is
	 * effectively halted by entering an infinite loop.
	 */
	[CCode(cname = "abort", cheader_filename = "stdlib.h")]
	[NoReturn]
	public void abort();
	/**
	 * Searches an array of objects for a member that matches the object pointed to by key.
	 *
	 * The contents of the array should be in ascending sorted order according
	 * to the comparison function referenced by comparison function. The
	 * comparison routine is expected to have two arguments which point to the
	 * key object and to an array member, in that order, and should return an
	 * integer less than, equal to, or greater than zero if the key object is
	 * found, respectively, to be less than, to match, or be greater than the
	 * array member.
	 *
	 * @return a pointer to a matching member of the array, or a null pointer if no match is found. If two members compare as equal, which member is matched is unspecified.
	 */
	[CCode(cname = "bsearch", simple_generics = true, cheader_filename = "stdlib.h")]
	public unowned T? bsearch<T>(T key, T[] list, Compare<T> compare_func, [CCode(pos = 2.5)] size_t size = sizeof(T));
	/**
	 *
	 * Delay loop using an 8-bit counter, so up to 256 iterations are possible.
	 *
	 * The value 256 would have to be passed as 0. The loop executes three CPU
	 * cycles per iteration, not including the overhead the compiler needs to
	 * setup the counter register.
	 *
	 * Thus, at a CPU speed of 1 MHz, delays of up to 768 microseconds can be achieved.
	 */
	[CCode(cname = "_delay_loop_1", cheader_filename = "util/delay_basic.h")]
	public void delay_loop_1(uint8 count);
	/**
	 * Delay loop using a 16-bit counter, so up to 65536 iterations are possible.
	 *
	 * The value 65536 would have to be passed as 0. The loop executes four CPU
	 * cycles per iteration, not including the overhead the compiler requires to
	 * setup the counter register pair.
	 *
	 * Thus, at a CPU speed of 1 MHz, delays of up to about 262.1 milliseconds can be achieved.
	 */
	[CCode(cname = "_delay_loop_2", cheader_filename = "util/delay_basic.h")]
	public void delay_loop_2(uint16 count);
	/**
	 * Perform a delay in milliseconds.
	 *
	 * The maximal possible delay is 262.14 ms / {@link F_CPU} in MHz.
	 *
	 * When the user request delay which exceed the maximum possible one, this method provides a decreased resolution functionality. In this mode, it will work with a resolution of 1/10 ms, providing delays up to 6.5535 seconds (independent from CPU frequency). The user will not be informed about decreased resolution.
	 *
	 * If the avr-gcc toolchain has '''__builtin_avr_delay_cycles(unsigned long)''' support, maximal possible delay is 4294967.295 ms/ F_CPU in MHz. For values greater than the maximal possible delay, overflows results in no delay i.e., 0ms.
	 *
	 * Conversion of µs into clock cycles may not always result in integer. By default, the clock cycles rounded up to next integer. This ensures that the user gets at least the specified number of microseconds of delay.
	 *
	 * Alternatively, user can define '''__DELAY_ROUND_DOWN__''' and '''__DELAY_ROUND_CLOSEST__''' to round down and round to closest integer.
	 */
	[CCode(cname = "_delay_ms", cheader_filename = "util/delay.h")]
	public void delay_ms(double ms);
	/**
	 * Perform a delay in microseconds.
	 *
	 * The maximal possible delay is 768 us / {@link F_CPU} in MHz.
	 *
	 * If the user requests a delay greater than the maximal possible one, this method will automatically call {@link delay_ms} instead. The user will not be informed about this case.
	 * @see delay_ms
	 */
	[CCode(cname = "_delay_us", cheader_filename = "util/delay.h")]
	public void delay_us(double ms);
	/**
	 * Disables all interrupts by clearing the global interrupt mask.
	 * @see atomic
	 */
	[CCode(cname = "cli", cheader_filename = "interrupt.h")]
	public void disable_interrupts();
	/**
	 * Enables interrupts by setting the global interrupt mask.
	 * @see atomic
	 */
	[CCode(cname = "sei", cheader_filename = "interrupt.h")]
	public void enable_interrupts();
	/**
	 * Terminates the application.
	 *
	 * Since there is no environment to return to, the argument is ignored, and
	 * code execution will eventually reach an infinite loop, thereby effectively
	 * halting all code processing. Before entering the infinite loop,
	 * interrupts are globally disabled.
	 */
	[CCode(cname = "exit", cheader_filename = "stdlib.h")]
	[NoReturn]
	public void exit(int status);
	/**
	 * Implement a read/write memory barrier.
	 *
	 * A memory barrier instructs the compiler to not cache any memory data in registers beyond the barrier. This can sometimes be more effective than blocking certain optimizations by declaring some object with a '''volatile''' qualifier.
	 */
	[CCode(cname = "_MemoryBarrier", cheader_filename = "avr/cpufunc.h")]
	public void memory_barrier();
	/**
	 * Execute a “no operation” CPU instruction.
	 *
	 * This should not be used to implement delays. For debugging purposes, a NOP can be useful to have an instruction that is guaranteed to be not optimized away by the compiler, so it can always become a breakpoint in the debugger.
	 * @see delay
	 */
	[CCode(cname = "_NOP", cheader_filename = "avr/cpufunc.h")]
	public void nop();
	/**
	 * A modified partition-exchange sort, or quicksort.
	 *
	 * Sorts an array of objects in ascending order.
	 * @param size The size of each object.
	 * @param compar Comparison callback.
	 */
	[CCode(cname = "qsort", simple_generics = true, cheader_filename = "stdlib.h")]
	public void qsort<T>(T[] list, Compare<T> compare_func, [CCode(pos = 1.5)] size_t size = sizeof(T));
	[CCode(cname = "__builtin_avr_wdr", cheader_filename = "avr/builtins.h")]
	public void reset_watchdog();
	[CCode(cname = "__builtin_avr_sleep", cheader_filename = "avr/builtins.h")]
	public void sleep();
	/**
	 * Extended Indirect Register
	 */
	[CCode(cname = "EIND")]
	public uint16 eind;
	/**
	 * Stack pointer register.
	 *
	 * AVR architecture 1 has no RAM, thus no stack pointer.
	 *
	 * All other architectures do have a stack pointer. Some devices have only
	 * less than 256 bytes of possible RAM locations (128 Bytes of SRAM and no
	 * option for external RAM), thus SPH is officially "reserved" for them.
	 * @see sp_low
	 * @see sp_high
	 */
	[CCode(cname = "SP")]
	public uint16 sp;
	[CCode(cname = "SPL")]
	public uint8 sp_low;
	[CCode(cname = "SPH")]
	public uint8 sp_high;
	/**
	 * Status Register
	 */
	[CCode(cname = "SREG")]
	public Status status;
	/**
	 * RAMPD Register
	 */
	[CCode(cname = "RAMPD")]
	public uint16 rampd;
	/**
	 * RAMPX Register
	 */
	[CCode(cname = "RAMPX")]
	public uint16 rampx;
	/**
	 * RAMPY Register
	 */
	[CCode(cname = "RAMPY")]
	public uint16 rampy;
	/**
	 * RAMPZ Register
	 */
	[CCode(cname = "RAMPZ")]
	public uint16 rampz;
}
