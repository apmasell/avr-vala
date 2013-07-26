[CCode(cheader_filename = "avr/io.h", cprefix = "")]
namespace Posix {
	namespace Analog {
		[CCode(cname = "uint8_t")]
		public enum Channel {
			[CCode(cname = "0b000000")]
			ADC0,
			[CCode(cname = "0b000001")]
			ADC1,
			[CCode(cname = "0b000100")]
			ADC4,
			[CCode(cname = "0b000101")]
			ADC5,
			[CCode(cname = "0b000110")]
			ADC6,
			[CCode(cname = "0b000111")]
			ADC7,
			[CCode(cname = "0b001001")]
			ADC1_ADC0_10X,
			[CCode(cname = "0b001011")]
			ADC1_ADC0_200X,
			[CCode(cname = "0b010000")]
			ADC0_ADC1_1X,
			[CCode(cname = "0b010100")]
			ADC4_ADC1_1X,
			[CCode(cname = "0b010101")]
			ADC5_ADC1_1X,
			[CCode(cname = "0b010110")]
			ADC6_ADC1_1X,
			[CCode(cname = "0b010111")]
			ADC7_ADC1_1X,
			[CCode(cname = "0b011110")]
			BAND_GAP,
			[CCode(cname = "0b011111")]
			GROUND,
			[CCode(cname = "0b100000")]
			ADC8,
			[CCode(cname = "0b100001")]
			ADC9,
			[CCode(cname = "0b100010")]
			ADC10,
			[CCode(cname = "0b100011")]
			ADC11,
			[CCode(cname = "0b100100")]
			ADC12,
			[CCode(cname = "0b100101")]
			ADC13,
			[CCode(cname = "0b100110")]
			ADC1_ADC0_40X,
			[CCode(cname = "0b100111")]
			TEMPERATURE,
			[CCode(cname = "0b101000")]
			ADC4_ADC0_10X,
			[CCode(cname = "0b101001")]
			ADC5_ADC0_10X,
			[CCode(cname = "0b101010")]
			ADC6_ADC0_10X,
			[CCode(cname = "0b101011")]
			ADC7_ADC0_10X,
			[CCode(cname = "0b101100")]
			ADC4_ADC1_10X,
			[CCode(cname = "0b101101")]
			ADC5_ADC1_10X,
			[CCode(cname = "0b101110")]
			ADC6_ADC1_10X,
			[CCode(cname = "0b101111")]
			ADC7_ADC1_10X,
			[CCode(cname = "0b110000")]
			ADC4_ADC0_40X,
			[CCode(cname = "0b110001")]
			ADC5_ADC0_40X,
			[CCode(cname = "0b110010")]
			ADC6_ADC0_40X,
			[CCode(cname = "0b110011")]
			ADC7_ADC0_40X,
			[CCode(cname = "0b110100")]
			ADC4_ADC1_40X,
			[CCode(cname = "0b110101")]
			ADC5_ADC1_40X,
			[CCode(cname = "0b110110")]
			ADC6_ADC1_40X,
			[CCode(cname = "0b110111")]
			ADC7_ADC1_40X,
			[CCode(cname = "0b111000")]
			ADC4_ADC0_200X,
			[CCode(cname = "0b111001")]
			ADC5_ADC0_200X,
			[CCode(cname = "0b111010")]
			ADC6_ADC0_200X,
			[CCode(cname = "0b111011")]
			ADC7_ADC0_200X,
			[CCode(cname = "0b111100")]
			ADC4_ADC1_200X,
			[CCode(cname = "0b111101")]
			ADC5_ADC1_200X,
			[CCode(cname = "0b111110")]
			ADC6_ADC1_200X,
			[CCode(cname = "0b111111")]
			ADC7_ADC1_200X;
			[CCode(cname = "ADC_SELECT")]
			public void select();
		}
		[CCode(cname = "uint8")]
		public enum Digital0 {
			[CCode(cname = "_BV(ADC0D)")]
			P0,
			[CCode(cname = "_BV(ADC1D)")]
			P1,
			[CCode(cname = "_BV(ADC2D)")]
			P2,
			[CCode(cname = "_BV(ADC3D)")]
			P3,
			[CCode(cname = "_BV(ADC4D)")]
			P4,
			[CCode(cname = "_BV(ADC5D)")]
			P5,
			[CCode(cname = "_BV(ADC6D)")]
			P6,
			[CCode(cname = "_BV(ADC7D)")]
			P7
		}
		[CCode(cname = "uint8")]
		public enum Digital1 {
			[CCode(cname = "_BV(AIN0D)")]
			AIN0,
			[CCode(cname = "_BV(AIN1D)")]
			AIN1
		}
		[CCode(cname = "uint8")]
		public enum Digital2 {
			[CCode(cname = "_BV(ADC8D)")]
			P8,
			[CCode(cname = "_BV(ADC9D)")]
			P9,
			[CCode(cname = "_BV(ADC10D)")]
			P10,
			[CCode(cname = "_BV(ADC11D)")]
			P11,
			[CCode(cname = "_BV(ADC12D)")]
			P12,
			[CCode(cname = "_BV(ADC13D)")]
			P13
		}
		[CCode(cname = "uint8_t")]
		public enum Reference {
			[CCode(cname = "0")]
			AREF,
			[CCode(cname = "_BV(REFS0)")]
			AV_CC,
			[CCode(cname = "(_BV(REFS0) | _BV(REFS1))")]
			INTERNAL;
			[CCode(cname = "ADMUX & (_BV(REFS0) | _BV(REFS1));")]
			public static void get();
			[CCode(cname = "BIT_MASK_SET(ADMUX, _BV(REFS0) | _BV(REFS1))")]
			public void set();
		}
		[CCode(cname = "uint8_t")]
		public enum Status {
			[CCode(cname = "0")]
			INTERRUPT_ON_TOGGLE,
			[CCode(cname = "(_BV(ACIS1) | _BV(ACIS0))")]
			INTERRUPT_ON_RISING,
			[CCode(cname = "_BV(ACIS1)")]
			INTERRUPT_ON_FALLING,
			[CCode(cname = "_BV(ACIC)")]
			CAPTURE_ENABLE,
			[CCode(cname = "_BV(ACIE)")]
			INTERRUPT_ENABLE,
			[CCode(cname = "_BV(ACI)")]
			INTERRUPT_FLAG,
			[CCode(cname = "_BV(ACO)")]
			SYNC_OUTPUT,
			[CCode(cname = "_BV(ACBG)")]
			BANDGAP_REF,
			[CCode(cname = "_BV(ACD)")]
			DISABLE
		}
		[CCode(cname = "uint8")]
		[Flags]
		public enum StatusA {
			[CCode(cname = "_BV(ADPS0)")]
			DIV_BY_2,
			[CCode(cname = "_BV(ADPS1)")]
			DIV_BY_4,
			[CCode(cname = "(_BV(ADPS1) | _BV(ADPS0))")]
			DIV_BY_8,
			[CCode(cname = "_BV(ADPS2)")]
			DIV_BY_16,
			[CCode(cname = "(_BV(ADPS2) | _BV(ADPS0))")]
			DIV_BY_32,
			[CCode(cname = "(_BV(ADPS2) | _BV(ADPS1))")]
			DIV_BY_64,
			[CCode(cname = "(_BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0))")]
			DIV_BY_128,
			[CCode(cname = "_BV(ADIE)")]
			INTERRUPT_ENABLE,
			[CCode(cname = "_BV(ADIF)")]
			INTERRUPT_FLAG,
			[CCode(cname = "_BV(ADATE)")]
			AUTO_TRIGGER_ENABLE,
			[CCode(cname = "_BV(ADSC)")]
			START_CONVERSTION,
			[CCode(cname = "_BV(ADEN)")]
			ENABLE
		}
		[CCode(cname = "uint8")]
		public enum TriggerSource {
			[CCode(cname = "0")]
			FREE_RUN,
			[CCode(cname = "_BV(ADTS0)")]
			ANALOG_COMPARATOR,
			[CCode(cname = "_BV(ADTS1)")]
			EXTERNAL_INTERRUPT,
			[CCode(cname = "(_BV(ADTS1) | _BV(ADTS0))")]
			TIMER0_COMPARATOR,
			[CCode(cname = "_BV(ADTS2)")]
			TIMER0_OVERFLOW,
			[CCode(cname = "(_BV(ADTS2) | _BV(ADTS0))")]
			TIMER1_COMPARATOR,
			[CCode(cname = "(_BV(ADTS2) | _BV(ADTS1))")]
			TIMER1_OVERFLOW,
			[CCode(cname = "(_BV(ADTS2) | _BV(ADTS1) | _BV(ADTS0))")]
			TIMER1_CAPTURE,
			[CCode(cname = "_BV(ADTS3)")]
			TIMER4_OVERFLOW,
			[CCode(cname = "(_BV(ADTS3) | _BV(ADTS0))")]
			TIMER4_MATCH_A,
			[CCode(cname = "(_BV(ADTS3) | _BV(ADTS1))")]
			TIMER4_MATCH_B,
			[CCode(cname = "(_BV(ADTS3) | _BV(ADTS1) | _BV(ADTS0))")]
			TIMER4_MATCH_C;
			[CCode(cname = "ADCSRB & (_BV(ADTS3) | _BV(ADTS2) | _BV(ADTS1) | _BV(ADTS0))")]
			public static void get();
			[CCode(cname = "BIT_MASK_SET(ADCSRB, _BV(ADTS3) | _BV(ADTS2) | _BV(ADTS1) | _BV(ADTS0))")]
			public void set();
		}
		[CCode(cname = "BIT_GET(ADMUX, ADLAR)")]
		public bool get_adjust_left();
		[CCode(cname = "BIT_GET(ADCSRB, ADHSM)")]
		public bool get_comparator_enable();
		[CCode(cname = "BIT_GET(ADCSRB, ADHSM)")]
		public bool get_high_speed();
		[CCode(cname = "BIT_COND(ADMUX, ADLAR)")]
		public void set_adjust_left(bool @value);
		[CCode(cname = "BIT_COND(ADCSRB, ACME)")]
		public void set_comparator_enable(bool @value);
		[CCode(cname = "BIT_COND(ADCSRB, ADHSM)")]
		public void set_high_speed(bool @value);

		[CCode(cname = "ADC")]
		public uint16 data;
		[CCode(cname = "DIDR0")]
		public Digital0 digital_disable_0;
		[CCode(cname = "DIDR1")]
		public Digital1 digital_disable_1;
		[CCode(cname = "DIDR2")]
		public Digital2 digital_disable_2;
		[CCode(cname = "ACSR")]
		public Status status;
		[CCode(cname = "ADCSRA")]
		public StatusA status_a;
	}
	[CCode(cheader_filename = "avr/io.h", cprefix = "")]
	namespace Direction {
		[CCode(cname = "DDRA")]
		public uint8 a;
		[CCode(cname = "DDRB")]
		public uint8 b;
		[CCode(cname = "DDRC")]
		public uint8 c;
		[CCode(cname = "DDRD")]
		public uint8 d;
		[CCode(cname = "DDRE")]
		public uint8 e;
		[CCode(cname = "DDRF")]
		public uint8 f;
		[CCode(cname = "DDRG")]
		public uint8 g;
		[CCode(cname = "DDRH")]
		public uint8 h;
		[CCode(cname = "DDRI")]
		public uint8 i;
		[CCode(cname = "DDRJ")]
		public uint8 j;
		[CCode(cname = "DDRK")]
		public uint8 k;
		[CCode(cname = "DDRL")]
		public uint8 l;
	}
	namespace Interrupts {
		[CCode(cname = "uint8")]
		[Flags]
		public enum ExternalA {
			[CCode(cname = "0")]
			LOW_0,
			[CCode(cname = "_BV(ISC00)")]
			EDGE_0,
			[CCode(cname = "_BV(ISC01)")]
			FALL_0,
			[CCode(cname = "(_BV(ISC00) | _BV(ISC01))")]
			RISING_0,
			[CCode(cname = "0")]
			LOW_1,
			[CCode(cname = "_BV(ISC10)")]
			EDGE_1,
			[CCode(cname = "_BV(ISC11)")]
			FALL_1,
			[CCode(cname = "(_BV(ISC10) | _BV(ISC11))")]
			RISING_1,
			[CCode(cname = "0")]
			LOW_2,
			[CCode(cname = "_BV(ISC20)")]
			EDGE_2,
			[CCode(cname = "_BV(ISC21)")]
			FALL_2,
			[CCode(cname = "(_BV(ISC20) | _BV(ISC21))")]
			RISING_2,
			[CCode(cname = "0")]
			LOW_3,
			[CCode(cname = "_BV(ISC30)")]
			EDGE_3,
			[CCode(cname = "_BV(ISC31)")]
			FALL_3,
			[CCode(cname = "(_BV(ISC30) | _BV(ISC31))")]
			RISING_3
		}
		[CCode(cname = "uint8")]
		[Flags]
		public enum ExternalB {
			[CCode(cname = "0")]
			LOW_4,
			[CCode(cname = "_BV(ISC40)")]
			EDGE_4,
			[CCode(cname = "_BV(ISC41)")]
			FALL_4,
			[CCode(cname = "(_BV(ISC40) | _BV(ISC41))")]
			RISING_4,
			[CCode(cname = "0")]
			LOW_5,
			[CCode(cname = "_BV(ISC50)")]
			EDGE_5,
			[CCode(cname = "_BV(ISC51)")]
			FALL_5,
			[CCode(cname = "(_BV(ISC50) | _BV(ISC51))")]
			RISING_5,
			[CCode(cname = "0")]
			LOW_6,
			[CCode(cname = "_BV(ISC60)")]
			EDGE_6,
			[CCode(cname = "_BV(ISC61)")]
			FALL_6,
			[CCode(cname = "(_BV(ISC60) | _BV(ISC61))")]
			RISING_6,
			[CCode(cname = "0")]
			LOW_7,
			[CCode(cname = "_BV(ISC70)")]
			EDGE_7,
			[CCode(cname = "_BV(ISC71)")]
			FALL_7,
			[CCode(cname = "(_BV(ISC70) | _BV(ISC71))")]
			RISING_7
		}
		[CCode(cname = "EICRA")]
		public ExternalA enable_a;
		[CCode(cname = "EICRB")]
		public ExternalB enable_b;
		[CCode(cname = "EIFR")]
		public uint8 flags;
		[CCode(cname = "EIMSK")]
		public uint8 mask;
		[CCode(cname = "PCICR")]
		public bool pin_change_enable;
		[CCode(cname = "PCIFR")]
		public bool pin_change_flag;
		[CCode(cname = "PCMSK0")]
		public uint8 pin_change_mask;
	}
	[CCode(cheader_filename = "avr/io.h", cprefix = "")]
	namespace Pin {
		[CCode(cname = "PINB")]
		public uint8 b;
		[CCode(cname = "PINC")]
		public uint8 c;
		[CCode(cname = "PIND")]
		public uint8 d;
		[CCode(cname = "PINE")]
		public uint8 e;
		[CCode(cname = "PINF")]
		public uint8 f;
		[CCode(cname = "PING")]
		public uint8 g;
		[CCode(cname = "PINH")]
		public uint8 h;
		[CCode(cname = "PINI")]
		public uint8 i;
		[CCode(cname = "PINJ")]
		public uint8 j;
		[CCode(cname = "PINK")]
		public uint8 k;
		[CCode(cname = "PINL")]
		public uint8 l;
	}
	[CCode(cheader_filename = "avr/io.h", cprefix = "")]
	namespace Port {
		[CCode(cname = "PORTA")]
		public uint8 a;
		[CCode(cname = "PORTB")]
		public uint8 b;
		[CCode(cname = "PORTC")]
		public uint8 c;
		[CCode(cname = "PORTD")]
		public uint8 d;
		[CCode(cname = "PORTE")]
		public uint8 e;
		[CCode(cname = "PORTF")]
		public uint8 f;
		[CCode(cname = "PORTG")]
		public uint8 g;
		[CCode(cname = "PORTH")]
		public uint8 h;
		[CCode(cname = "PORTI")]
		public uint8 i;
		[CCode(cname = "PORTJ")]
		public uint8 j;
		[CCode(cname = "PORTK")]
		public uint8 k;
		[CCode(cname = "PORTL")]
		public uint8 l;
	}
	namespace Spi {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control {
			[CCode(cname = "0")]
			SPEED_QUARTER,
			[CCode(cname = "_BV(SPR0)")]
			SPEED_SIXTEENTH,
			[CCode(cname = "_BV(SPR1)")]
			SPEED_SIXTY_FOURTH,
			[CCode(cname = "(_BV(SPR1) | _BV(SPR1))")]
			SPEED_ONE_TWENTY_EIGTH,
			[CCode(cname = "_BV(CPHA)")]
			SAMPLE_ON_TRAILING_EDGE,
			[CCode(cname = "_BV(CPOL)")]
			CLOCK_IDLE_HIGH,
			[CCode(cname = "_BV(MSTR)")]
			MASTER_SELECT,
			[CCode(cname = "_BV(DORD)")]
			LSB_FIRST,
			[CCode(cname = "_BV(SPE)")]
			ENABLE,
			[CCode(cname = "_BV(SPIE)")]
			INTERRUPT_ENABLE
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Status {
			[CCode(cname = "_BV(SPI2X)")]
			DOUBLE_SPEED,
			[CCode(cname = "_BV(WCOL)")]
			WRITE_COLLISION,
			[CCode(cname = "_BV(SPIF)")]
			INTERRUPT
		}
		[CCode(cname = "SPCR")]
		public Control control;
		[CCode(cname = "SPDR")]
		public uint8 data;
		[CCode(cname = "SPSR")]
		public Status status;
	}
	namespace Timer {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control {
			[CCode(cname = "_BV(FOC0B)")]
				FORCE_OUTPUT_COMPARE_A,
				[CCode(cname = "_BV(FOC0A)")]
				FORCE_OUTPUT_COMPARE_B,
				[CCode(cname = "_BV(WGM02)")]
				PHASE_CORRECTING,
				[CCode(cname = "0")]
				SOURCE_STOP,
				[CCode(cname = "_BV(CS00)")]
				SOURCE_IO,
				[CCode(cname = "_BV(CS01)")]
				SOURCE_IO_DIV_8,
				[CCode(cname = "(_BV(CS01) | _BV(CS00))")]
				SOURCE_IO_DIV_64,
				[CCode(cname = "_BV(CS02)")]
				SOURCE_IO_DIV_128,
				[CCode(cname = "(_BV(CS02) | _BV(CS00))")]
				SOURCE_IO_DIV_1024,
				[CCode(cname = "(_BV(CS02) | _BV(CS01))")]
				SOURCE_EXT_FALLING,
				[CCode(cname = "(_BV(CS02) | _BV(CS01) | _BV(CS00))")]
				SOURCE_EXT_RISING
		}
		[CCode(cname = "uint8_t")]
		public enum CounterMode {
			[CCode(cname = "0")]
			NORMAL,
			[CCode(cname = "1")]
			TOGGLE_ON_COMPARE,
			[CCode(cname = "2")]
			CLEAR_ON_COMPARE,
			[CCode(cname = "3")]
			SET_ON_COMPARE
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Interrupt {
			[CCode(cname = "_BV(TOIE0)")]
			OVERLOW,
			[CCode(cname = "_BV(OCIE0A)")]
			COMPARE_A,
			[CCode(cname = "_BV(OCIE0B)")]
			COMPARE_B,
			[CCode(cname = "_BV(OCIE1C)")]
			COMPARE_C,
			[CCode(cname = "_BV(ICIE1)")]
			CAPTURE
		}

		/**
		 * Eight bit counter
		 */
		namespace zero {
			[CCode(cname = "TCCR0A = TIMER0_MODE")]
			public void set_mode(bool single_slope, bool user_defined_top, CounterMode compare_a, CounterMode compare_b);

			[CCode(cname = "TCCR0B")]
			public Control control;
			[CCode(cname = "OCR0A")]
			public uint8 compare_a;
			[CCode(cname = "OCR0B")]
			public uint8 compare_b;
			[CCode(cname = "TCNT0")]
			public uint8 counter;
			[CCode(cname = "TIMSK0")]
			public Interrupt interrupt_enable;
			[CCode(cname = "TIFR0")]
			public Interrupt interrupt_flag;
		}
		/**
		 * Sixteen bit counter
		 */
		namespace one {
			[CCode(cname = "TCCR1A = TIMER_MODE")]
			public void set_mode(bool single_slope, bool user_defined_top, CounterMode compare_a, CounterMode compare_b,  CounterMode compare_c);

			[CCode(cname = "TCCR1B")]
			public Control control;
			[CCode(cname = "OCR1A")]
			public uint16 compare_a;
			[CCode(cname = "OCR1B")]
			public uint16 compare_b;
			[CCode(cname = "OCR1C")]
			public uint16 compare_c;
			[CCode(cname = "TCNT1")]
			public uint16 counter;
			[CCode(cname = "TIMSK1")]
			public Interrupt interrupt_enable;
			[CCode(cname = "TIFR1")]
			public Interrupt interrupt_flag;
		}
		/**
		 * Sixteen bit counter
		 */
		namespace three {
			[CCode(cname = "TCCR3A = TIMER_MODE")]
			public void set_mode(bool single_slope, bool user_defined_top, CounterMode compare_a, CounterMode compare_b, CounterMode compare_c);

			[CCode(cname = "TCCR3B")]
			public Control control;
			[CCode(cname = "OCR3A")]
			public uint16 compare_a;
			[CCode(cname = "OCR3B")]
			public uint16 compare_b;
			[CCode(cname = "OCR3C")]
			public uint16 compare_c;
			[CCode(cname = "TCNT3")]
			public uint16 counter;
			[CCode(cname = "TIMSK3")]
			public Interrupt interrupt_enable;
			[CCode(cname = "TIFR3")]
			public Interrupt interrupt_flag;
		}
		/**
		 * Ten bit counter
		 */
		namespace four {
				[CCode(cname = "TCCR4A = TIMER_MODE")]
				public void set_mode(bool single_slope, bool user_defined_top, CounterMode compare_a, CounterMode compare_b, /*TODO*/ void*x = null);
				[CCode(cname = "TCCR4B")]
				public Control control;
				[CCode(cname = "OCR4A")]
				public uint16 compare_a;
				[CCode(cname = "OCR4B")]
				public uint16 compare_b;
				[CCode(cname = "OCR4C")]
				public uint16 compare_c;
				[CCode(cname = "TCNT4")]
				public uint16 counter;
				[CCode(cname = "TIMSK4")]
				public Interrupt interrupt_enable;
				[CCode(cname = "TIFR4")]
				public Interrupt interrupt_flag;
		}
	}
	namespace Twi {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Prescaler {
			[CCode(cname = "0")]
			ONE,
			[CCode(cname = "_BV(TWPS0)")]
			FOUR,
			[CCode(cname = "_BV(TWPS1)")]
			SIXTEEN,
			[CCode(cname = "(_BV(TWPS1) | _BV(TWPS0))")]
			SIXTY_FOUR
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control {
			[CCode(cname = "_BV(TWIE)")]
			INTERRUPT_ENABLE,
			[CCode(cname = "_BV(TWEN)")]
			ENABLE,
			[CCode(cname = "_BV(TWWC)")]
			WRITE_COLLISION,
			[CCode(cname = "_BV(TWSTO)")]
			STOP_CONDITION,
			[CCode(cname = "_BV(TWSTA)")]
			START_CONDITION,
			[CCode(cname = "_BV(TWEA)")]
			ENABLE_ACK,
			[CCode(cname = "_BV(TWINT)")]
			INTERRUPT
		}

		[CCode(cname = "TWAR")]
		public uint8 address;
		[CCode(cname = "TWAMR")]
		public uint8 address_mask;
		[CCode(cname = "TWBR")]
		public uint8 bit_rate;
		[CCode(cname = "TWCR")]
		public Control control;
		[CCode(cname = "TWDR")]
		public uint8 data;
		[CCode(cname = "TWSR")]
		public Prescaler prescaler;
	}
	namespace Usart {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum ControlA {
			[CCode(cname = "_BV(MPCM1)")]
			MULTI_PROCESSOR_COMMUNICATION,
			[CCode(cname = "_BV(U2X1)")]
			DOUBLE_SPEED,
			[CCode(cname = "_BV(UPE1)")]
			PARITY_ERROR,
			[CCode(cname = "_BV(DOR1)")]
			DATA_OVERRUN,
			[CCode(cname = "_BV(FE1)")]
			FRAME_ERROR,
			[CCode(cname = "_BV(UDRE1)")]
			DATA_REG_EMPTY,
			[CCode(cname = "_BV(TXC1)")]
			TRANSMIT_COMPLETE,
			[CCode(cname = "_BV(RXC1)")]
			RECEIVE_COMPLETE
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum ControlB {
			[CCode(cname = "_BV(TXB81)")]
			TRANSMIT_BIT_8,
			[CCode(cname = "_BV(RXB81)")]
			RECEIVE_BIT_8,
			[CCode(cname = "_BV(UCSZ12)")]
			CHAR_SIZE_9,
			[CCode(cname = "_BV(TXEN1)")]
			TRANSMIT_ENABLE,
			[CCode(cname = "_BV(RXEN1)")]
			RECEIVE_ENABLE,
			[CCode(cname = "_BV(UDRIE1)")]
			DATA_REG_EMPTY_INTERRUPT,
			[CCode(cname = "_BV(TXCIE1)")]
			TRANSMIT_COMPLETE_INTERRUPT,
			[CCode(cname = "_BV(RXCIE1)")]
			RECEIVE_COMPLETE_INTERRUPT
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum ControlC {
			[CCode(cname = "_BV(UCPOL1)")]
			RISING_CLOCK_EDGE,
			[CCode(cname = "0")]
			CHAR_SIZE_5,
			[CCode(cname = "_BV(UCSZ10)")]
			CHAR_SIZE_6,
			[CCode(cname = "_BV(UCSZ11)")]
			CHAR_SIZE_7,
			[CCode(cname = "(_BV(UCSZ10) | _BV(UCSZ11))")]
			CHAR_SIZE_8,
			[CCode(cname = "_BV(USBS1)")]
			TWO_STOP_BITS,
			[CCode(cname = "0")]
			PARITY_NONE,
			[CCode(cname = "(_BV(UPM11) | _BV(UPM10))")]
			PARITY_ODD,
			[CCode(cname = "_BV(UPM11)")]
			PARITY_EVEN,
			[CCode(cname = "0")]
			ASYNC_USART,
			[CCode(cname = "_BV(UMSEL10)")]
			SYNC_USAR,
			[CCode(cname = "(_BV(UMSEL10) | _BV(UMSEL11))")]
			MASTER_SPI
		}
		[CCode(cname = "UBRR1")]
		public uint16 baud_rate;
		[CCode(cname = "UCSR1A")]
		public ControlA control_a;
		[CCode(cname = "UCSR1B")]
		public ControlB control_b;
		[CCode(cname = "UCSR1C")]
		public ControlC control_c;
		[CCode(cname = "UDR1")]
		public uint8 data1;
	}
	namespace Usb {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Connection {
			/**
			 * Enable the endpoint according to the device configuration.
			 *
			 * Endpoint 0 shall always be enabled after a hardware or USB reset and
			 * participate in the device configuration.
			 */
			[CCode(cname = "_BV(EPEN)")]
			EP_ENABLE,
			/**
			 * Automatically clear the data toggle sequence.
			 *
			 * For the out endpoint, the next received packet wil have the data
			 * toggle 0. For the in endpoint, the next packet to be sent will have
			 * the data toggle 0.
			 *
			 * Cleared by hardware instantaneously. The firmware does not have to
			 * wait that the bit is cleared. Clearing by software as no effect.
			 */
			[CCode(cname = "_BV(RSTDT)")]
			RSTDT,
			/**
			 * Disable the stall mechanism.
			 *
			 * Cleared by hardware immediately after the set. Clearing by software as no effect.
			 */
			[CCode(cname = "_BV(STALLRQC)")]
			STALLRQC,
			/**
			 * Request a stall answer to the host for the next handshake.
			 *
			 * Cleared when a new setup is received. Clearing by software as no effect.
			 */
			[CCode(cname = "_BV(STALLRQ)")]
			STALLRQ
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum EndpointConfig {
			/**
			 * Configure an in direction. Otherwies, output.
			 */
			[CCode(cname = "_BV(EPDIR)")]
			INPUT,
			[CCode(cname = "0")]
			CONTROL,
			[CCode(cname = "_BV(ETYPE1)")]
			BULK,
			[CCode(cname = "_BV(ETYPE0)")]
			ISOCHRONOUS,
			[CCode(cname = "(_BV(ETYPE1) | _BV(ETYPE0))")]
			INTERRUPT
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum EndpointSetup {
			/**
			 * Allocate memory for the endpoint.
			 *
			 * Clear to free the memory.
			 */
			[CCode(cname = "ALLOC")]
			ALLOC,
			[CCode(cname = "_BV(EPBK0)")]
			DOUBLE_BANK,
			[CCode(cname = "0")]
			SIZE8,
			[CCode(cname = "_BV(EPSIZE0)")]
			SIZE16,
			[CCode(cname = "_BV(EPSIZE1)")]
			SIZE32,
			[CCode(cname = "(_BV(EPSIZE1) | _BV(EPSIZE0))")]
			SIZE64,
			[CCode(cname = "_BV(EPSIZE2)")]
			SIZE128,
			[CCode(cname = "(_BV(EPSIZE2) | _BV(EPSIZE0))")]
			SIZE256
		}		[CCode(cname = "uint8_t")]
		[Flags]
		public enum EndpointStatus {
			/**
			 * Set by the hardware when the endpoint size and bank parameter in
			 * {@link endpoint_setup} are correct.
			 *
			 * This is updated when {@link EndpointSetup.ALLOC} is set. If this bit
			 * is cleared, {@link endpoint_setup} should be reprogrammed with the
			 * correct size and bank.
			 */
			[CCode(cname = "_BV(CFGOK)")]
			CFGOK,
			/**
			 * Set by the hardware when underflow occurs in an isochronous endpoint.
			 */
			[CCode(cname = "_BV(UNDERFI)")]
			UNDERFI,
			/**
			 * Set by the hardware when overflow occurs in an isochronous endpoint.
			 */
			[CCode(cname = "_BV(OVERFI)")]
			OVERFI,
			/**
			 * Set by the hardware to indicate the PID of the current is Data1.
			 *
			 * For out transfer, this value indicates the last data toggle received
			 * on the current bank.  For in transfer, this value indicates the toggle
			 * that will be used for the next packet sent. This is not relative to
			 * the current bank.
			 */
			[CCode(cname = "_BV(DTSEQ0)")]
			DATA1,
			/**
			 * Set by the hardware to indicate the number of busy bank.
			 *
			 * For in endpoint, it indicates sthe number of busy banks, filled by the
			 * user, ready for in transfer. For out endpoint, it indicates the number
			 * of busy banks filled by out transaction from the host.
			 */
			[CCode(cname = "0")]
			ZERO_BANKS_BUSY,
			[CCode(cname = "_BV(NBUSYBK0)")]
			ONE_BANK_BUSY,
			[CCode(cname = "_BV(NBUSYBK1)")]
			TWO_BANKS_BUSY
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Interrupt {
			/**
			 * Enable an interrupt when {@link Status.TX_IN} is set.
			 */
			[CCode(cname = "_BV(TXINE)")]
			TX_IN,
			/**
			 * Enable an interrupt when {@link Status.STALLED} is set.
			 */
			[CCode(cname = "_BV(STALLEDE)")]
			STALLED,
			/**
			 * Enable an interrupt when {@link Status.RX_OUT} is set.
			 */
			[CCode(cname = "_BV(RXOUTE)")]
			RX_OUT,
			/**
			 * Enable an interrupt when {@link Status.RX_SETUP} is set.
			 */
			[CCode(cname = "_BV(RXSTPE)")]
			RX_SETUP,
			/**
			 * Enable an interrupt when {@link Status.NAK_OUT} is set.
			 */
			[CCode(cname = "_BV(NAKOUTE)")]
			NAK_OUT,
			/**
			 * Enable an interrupt when {@link Status.NAK_IN} is set.
			 */
			[CCode(cname = "_BV(NAKINE)")]
			NAK_IN,
			/**
			 * Enable an interrupt when {@link Status.OVERFI} or {@link Status.UNDERFI} is set.
			 */
			[CCode(cname = "_BV(FLERRE)")]
			FL_ERR
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum EndpointStatus2 {
			/**
			 * Set by hardware after a setup packet and gives the direction of the following packet.
			 */
			[CCode(cname = "CTRLDIR")]
			INPUT,
			/**
			 * Set by hardware to indicate the number of the current bank.
			 */
			[CCode(cname = "_BV(CURRBK0)")]
			BANK1
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Status {
			/**
			 * Set by the hardwher whena NAK hankdshake has ben sent inrepsonse of the in request from the host.
			 *
			 * Shall be cleared by software. Setting by software has no effect.
			 */
			[CCode(cname = "_BV(NAKINI)")]
			NAK_IN,
			/**
			 * Set by hardware to signal that the current bank is free and can be filled.
			 *
			 * This bis is cleared if the endpoint is an out endpoint.
			 */
			[CCode(cname = "_BV(TXINI)")]
			TX_IN,
			/**
			 * Set by hardware to signal that a stall hankshake has been sent or that a CRC error has been detected in an out isochronous endpoint.
			 *
			 * Shall be cleared by software. Setting by software has no effect.
			 */
			[CCode(cname = "_BV(STALLEDI)")]
			STALLED,
			/**
			 * Set to kill the last written bank.
			 *
			 * Cleared by hardware when the bank is killed. Clearing by software has no effect.
			 */
			[CCode(cname = "_BV(RXOUTI)")]
			KILL_BK,
			/**
			 * Set by hardware to signal that the current bank contains a new packet.
			 *
			 * Shall be cleared by software to handshake the interrupt. Setting by software has no effect.
			 */
			[CCode(cname = "_BV(RXOUTI)")]
			RX_OUT,
			/**
			 * Set by hardware to signal that the current bank contains a new valid setup packet.
			 *
			 * Shall be cleared by software to hankshake the interript. Setting by software has no effect.
			 *
			 * This is never set if the endpoint is an in endpoint.
			 */
			[CCode(cname = "_BV(RXSTPI)")]
			RX_SETUP,
			/**
			 * Set by hardware when a NAK handshake has been sent in response of a out/ping request from the host..
			 *
			 * Shall be cleared by software. Setting by sofware has no effect.
			 */
			[CCode(cname = "_BV(NAKOUTI)")]
			NAK_OUT,
			/**
			 * Set by hardware to indicate that, for an in endpoint, the current bank is not full, the software can push data into the FIFO, or, for an out endpoint, the current bank is not empty, that is, the software can read data from the FIFO.
			 *
			 * This bit is never set if {@link Connection.STALLRQ} is set, or in case of error.
			 *
			 * Cleared by the hardware otherwise.
			 *
			 * This bit shall not be used for the control endpoint.
			 */
			[CCode(cname = "_BV(RWAL)")]
			RW_ALLOW,
			/**
			 * FIFO control bit
			 *
			 * For out and setup endpoints, set by the hardware when a new out message is stored in the current bank, at the same time than {@link RX_OUT} or {@link RX_SETUP}.
			 *
			 * Clear to free the current bank and switch to the following bank. Setting by software has no effect.
			 *
			 * For in endpoints, set by hardware when the current bank is free, at the same time than {@link TX_IN}.
			 *
			 * Clear to send the FIFO data and switch the bank. Setting by software has no effect.
			 */
			[CCode(cname = "_BV(FIFOCON)")]
			FIFOCON
		}
		[CCode(cname = "UEBCX")]
		public uint16 byte_count;
		[CCode(cname = "UECONX")]
		public Connection connection;
		[CCode(cname = "UEDATX")]
		public uint8 data;
		[CCode(cname = "UENUM")]
		public uint8 endpoint;
		[CCode(cname = "UECFG0X")]
		public EndpointConfig endpont_config;
		[CCode(cname = "UECFG1X")]
		public EndpointSetup endpoint_setup;
		[CCode(cname = "UESTA0X")]
		public EndpointStatus endpoint_status;
		[CCode(cname = "UESTA1X")]
		public EndpointStatus2 endpoint_status2;
		[CCode(cname = "UEIENX")]
		public Interrupt interrupt_enable;
		[CCode(cname = "UEINT")]
		public uint8 interrupt_endpoint;
		[CCode(cname = "UERST")]
		public uint8 endpoint_fifo;
		[CCode(cname = "UEINTX")]
		public Status status;
	public uint8 UPERRX;
	public uint8 UPBCLX;
	public uint8 UPBCHX;
	public uint8 UPINT;
	}
	namespace WatchDog {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control {
			[CCode(cname = "_BV(WDP0)")]
			PRESCALER_0,
			[CCode(cname = "_BV(WDP1)")]
			PRESCALER_1,
			[CCode(cname = "_BV(WDP2)")]
			PRESCALER_2,
			[CCode(cname = "_BV(WDE)")]
			SYS_RESET_ENABLE,
			[CCode(cname = "_BV(WDCE)")]
			CHANGE_ENABLE,
			[CCode(cname = "_BV(WDP3)")]
			PRESCALER_3,
			/**
			 * Puts the timer in Interrupt and System Reset mode.
			 */
			[CCode(cname = "_BV(WDIE)")]
			ENABLE_INTERRUPT,
			/**
			 * Set when a time-out occurs.
			 *
			 * Cleared by hardware when the handing vector is activated or set in the register.
			 */
			[CCode(cname = "_BV(WDIF)")]
			INTERRUPT;
		}
		[CCode(cname = "WDTCSR")]
		public Control control;
	}

	[CCode(cname = "OCDR")]
	public uint8 debug_data;

	public uint8 TIFR2;
	public const uint8 TOV2;
	public const uint8 OCF2A;
	public const uint8 OCF2B;

	public uint8 TIFR4;
	public const uint8 TOV4;
	public const uint8 OCF4B;
	public const uint8 OCF4A;
	public const uint8 OCF4D;

	public uint8 TIFR5;


	public uint8 GPIOR0;
	public const uint8 GPIOR00;
	public const uint8 GPIOR01;
	public const uint8 GPIOR02;
	public const uint8 GPIOR03;
	public const uint8 GPIOR04;
	public const uint8 GPIOR05;
	public const uint8 GPIOR06;
	public const uint8 GPIOR07;

	public uint8 GTCCR;
	public const uint8 PSRSYNC;
	public const uint8 PSRASY;
	public const uint8 TSM;

	public uint8 PLLCSR;
	public const uint8 PLOCK;
	public const uint8 PLLE;
	public const uint8 PINDIV;

	public uint8 GPIOR1;
	public const uint8 GPIOR10;
	public const uint8 GPIOR11;
	public const uint8 GPIOR12;
	public const uint8 GPIOR13;
	public const uint8 GPIOR14;
	public const uint8 GPIOR15;
	public const uint8 GPIOR16;
	public const uint8 GPIOR17;

	public uint8 GPIOR2;
	public const uint8 GPIOR20;
	public const uint8 GPIOR21;
	public const uint8 GPIOR22;
	public const uint8 GPIOR23;
	public const uint8 GPIOR24;
	public const uint8 GPIOR25;
	public const uint8 GPIOR26;
	public const uint8 GPIOR27;


	public uint8 PLLFRQ;
	public const uint8 PDIV0;
	public const uint8 PDIV1;
	public const uint8 PDIV2;
	public const uint8 PDIV3;
	public const uint8 PLLTM0;
	public const uint8 PLLTM1;
	public const uint8 PLLUSB;
	public const uint8 PINMUX;

	public uint8 SMCR;
	public const uint8 SE;
	public const uint8 SM0;
	public const uint8 SM1;
	public const uint8 SM2;

	public uint8 MCUSR;
	public const uint8 PORF;
	public const uint8 EXTRF;
	public const uint8 BORF;
	public const uint8 WDRF;
	public const uint8 JTRF;

	public uint8 MCUCR;
	public const uint8 IVCE;
	public const uint8 IVSEL;
	public const uint8 PUD;
	public const uint8 JTD;

	public uint8 EIND;
	public const uint8 EIND0;


	public uint8 PRR0;
	public const uint8 PRADC;
	public const uint8 PRUSART0;
	public const uint8 PRSPI;
	public const uint8 PRTIM1;
	public const uint8 PRTIM0;
	public const uint8 PRTIM2;
	public const uint8 PRTWI;

	public uint8 PRR1;
	public const uint8 PRUSART1;
	public const uint8 PRTIM3;
	public const uint8 PRUSB;

	public uint8 OSCCAL;
	public const uint8 CAL0;
	public const uint8 CAL1;
	public const uint8 CAL2;
	public const uint8 CAL3;
	public const uint8 CAL4;
	public const uint8 CAL5;
	public const uint8 CAL6;
	public const uint8 CAL7;

	public uint8 RCCTRL;
	public const uint8 RCFREQ;

	[CCode(cname = "ICR1")]
	public uint16 ICR1;
	public uint16 OCR1A;
	public uint16 OCR1B;
	public uint16 OCR1C;

	public uint8 TCCR3B;
	public const uint8 CS30;
	public const uint8 CS31;
	public const uint8 CS32;
	public const uint8 WGM32;
	public const uint8 WGM33;
	public const uint8 ICES3;
	public const uint8 ICNC3;

	public uint8 TCCR3C;
	public const uint8 FOC3C;
	public const uint8 FOC3B;
	public const uint8 FOC3A;


	public uint8 ICR3;
	public uint8 OCR3A;
	public uint8 OCR3B;
	public uint8 OCR3C;
	public uint8 UHCON;
	public uint8 UHINT;
	public uint8 UHIEN;
	public uint8 UHADDR;
	public uint8 UHFNUM;
	public uint8 UHFNUML;
	public uint8 UHFNUMH;
	public uint8 UHFLEN;
	public uint8 UPINRQX;
	public uint8 UPINTX;
	public uint8 UPNUM;
	public uint8 UPRST;
	public uint8 UPCONX;
	public uint8 UPCFG0X;
	public uint8 UPCFG1X;
	public uint8 UPSTAX;
	public uint8 UPCFG2X;
	public uint8 UPIENX;
	public uint8 UPDATX;

	public uint8 TCCR2A;
	public const uint8 WGM20;
	public const uint8 WGM21;
	public const uint8 COM2B0;
	public const uint8 COM2B1;
	public const uint8 COM2A0;
	public const uint8 COM2A1;

	public uint8 TCCR2B;
	public const uint8 CS20;
	public const uint8 CS21;
	public const uint8 CS22;
	public const uint8 WGM22;
	public const uint8 FOC2B;
	public const uint8 FOC2A;

	public uint8 TCNT2;

	public uint8 OCR2A;
	public uint8 OCR2B;

	public uint8 TCCR4A;
	public const uint8 PWM4B;
	public const uint8 PWM4A;
	public const uint8 FOC4B;
	public const uint8 FOC4A;
	public const uint8 COM4B0;
	public const uint8 COM4B1;
	public const uint8 COM4A0;
	public const uint8 COM4A1;

	public uint8 TCCR4B;
	public const uint8 CS40;
	public const uint8 CS41;
	public const uint8 CS42;
	public const uint8 CS43;
	public const uint8 DTPS40;
	public const uint8 DTPS41;
	public const uint8 PSR4;
	public const uint8 PWM4X;

	public uint8 TCCR4C;
	public const uint8 PWM4D;
	public const uint8 FOC4D;
	public const uint8 COM4D0;
	public const uint8 COM4D1;
	public const uint8 COM4B0S;
	public const uint8 COM4B1S;
	public const uint8 COM4A0S;
	public const uint8 COM4A1S;

	public uint8 TCCR4D;
	public const uint8 WGM40;
	public const uint8 WGM41;
	public const uint8 FPF4;
	public const uint8 FPAC4;
	public const uint8 FPES4;
	public const uint8 FPNC4;
	public const uint8 FPEN4;
	public const uint8 FPIE4;

	public uint8 TCCR4E;
	public const uint8 OC4OE0;
	public const uint8 OC4OE1;
	public const uint8 OC4OE2;
	public const uint8 OC4OE3;
	public const uint8 OC4OE4;
	public const uint8 OC4OE5;
	public const uint8 ENHC4;
	public const uint8 TLOCK4;

	public uint8 CLKSEL0;
	public const uint8 CLKS;
	public const uint8 EXTE;
	public const uint8 RCE;
	public const uint8 EXSUT0;
	public const uint8 EXSUT1;
	public const uint8 RCSUT0;
	public const uint8 RCSUT1;

	public uint8 CLKSEL1;
	public const uint8 EXCKSEL0;
	public const uint8 EXCKSEL1;
	public const uint8 EXCKSEL2;
	public const uint8 EXCKSEL3;
	public const uint8 RCCKSEL0;
	public const uint8 RCCKSEL1;
	public const uint8 RCCKSEL2;
	public const uint8 RCCKSEL3;

	public uint8 CLKSTA;
	public const uint8 EXTON;
	public const uint8 RCON;


	public uint8 OCR4A;
	public uint8 OCR4B;
	public uint8 OCR4C;
	public uint8 OCR4D;
	public uint8 DT4;
	public uint8 UHWCON;
	public const uint8 UVREGE;

	public uint8 USBCON;
	public const uint8 VBUSTE;
	public const uint8 OTGPADE;
	public const uint8 FRZCLK;
	public const uint8 USBE;

	public uint8 USBSTA;
	public const uint8 VBUS;
	public const uint8 SPEED;

	public uint8 USBINT;
	public const uint8 VBUSTI;

	public uint8 OTGCON;

	public uint8 OTGIEN;

	public uint8 OTGINT;

	public uint8 UDCON;
	public const uint8 DETACH;
	public const uint8 RMWKUP;
	public const uint8 LSM;
	public const uint8 RSTCPU;

	public uint8 UDINT;
	public const uint8 SUSPI;
	public const uint8 SOFI;
	public const uint8 EORSTI;
	public const uint8 WAKEUPI;
	public const uint8 EORSMI;
	public const uint8 UPRSMI;

	public uint8 UDIEN;
	public const uint8 SUSPE;
	public const uint8 SOFE;
	public const uint8 EORSTE;
	public const uint8 WAKEUPE;
	public const uint8 EORSME;
	public const uint8 UPRSME;

	public uint8 UDADDR;
	public const uint8 UADD0;
	public const uint8 UADD1;
	public const uint8 UADD2;
	public const uint8 UADD3;
	public const uint8 UADD4;
	public const uint8 UADD5;
	public const uint8 UADD6;
	public const uint8 ADDEN;

	public uint8 UDFNUM;

	public uint8 UDFNUML;
	public const uint8 FNUM0;
	public const uint8 FNUM1;
	public const uint8 FNUM2;
	public const uint8 FNUM3;
	public const uint8 FNUM4;
	public const uint8 FNUM5;
	public const uint8 FNUM6;
	public const uint8 FNUM7;

	public uint8 UDFNUMH;
	public const uint8 FNUM8;
	public const uint8 FNUM9;
	public const uint8 FNUM10;

	public uint8 UDMFN;
	public const uint8 FNCERR;

	public uint8 UDTST;


	public uint8 OTGTCON;
	public const int SPM_PAGESIZE;
	public const size_t RAMSTART;
	public const size_t RAMSIZE;
	public const size_t RAMEND;
	public const size_t XRAMSTART;
	public const size_t XRAMSIZE;
	public const size_t XRAMEND;
	public const size_t E2END;
	public const size_t E2PAGESIZE;
	public const size_t FLASHEND;

	/**
	 * Fuses
	 */
	public const uint8 FUSE_MEMORY_SIZE;

	/**
	 * Low Fuse Byte - Select Clock Source
	 */
	public const uint8 FUSE_CKSEL0;
	/**
	 * Low Fuse Byte - Select Clock Source
	 */
	public const uint8 FUSE_CKSEL1;
	/**
	 * Low Fuse Byte - Select Clock Source
	 */
	public const uint8 FUSE_CKSEL2;
	/**
	 * Low Fuse Byte - Select Clock Source
	 */
	public const uint8 FUSE_CKSEL3;
	/**
	 * Low Fuse Byte - Select start-up time
	 */
	public const uint8 FUSE_SUT0;
	/**
	 * Low Fuse Byte - Select start-up time
	 */
	public const uint8 FUSE_SUT1;
	/**
	 * Low Fuse Byte - Oscillator options
	 */
	public const uint8 FUSE_CKOUT;
	/**
	 * Low Fuse Byte - Divide clock by 8
	 */
	public const uint8 FUSE_CKDIV8;
	public const uint8 LFUSE_DEFAULT;

	/**
	 * High Fuse Byte - Select Reset Vector
	 */
	public const uint8 FUSE_BOOTRST;
	/**
	 * High Fuse Byte - Select Boot Size
	 */
	public const uint8 FUSE_BOOTSZ0;
	/**
	 * High Fuse Byte - Select Boot Size
	 */
	public const uint8 FUSE_BOOTSZ1;
	/**
	 * High Fuse Byte - EEPROM memory is preserved through chip erase
	 */
	public const uint8 FUSE_EESAVE;
	/**
	 * High Fuse Byte - Watchdog timer always on
	 */
	public const uint8 FUSE_WDTON;
	/**
	 * High Fuse Byte - Enable Serial programming and Data Downloading
	 */
	public const uint8 FUSE_SPIEN;
	/**
	 * High Fuse Byte - Enable JTAG
	 */
	public const uint8 FUSE_JTAGEN;
	/**
	 * High Fuse Byte - Enable OCD
	 */
	public const uint8 FUSE_OCDEN;
	public const uint8 HFUSE_DEFAULT;

	/**
	 * Extended Fuse Byte - Brown-out Detector trigger level
	 */
	public const uint8 FUSE_BODLEVEL0;
	/**
	 * Extended Fuse Byte - Brown-out Detector trigger level
	 */
	public const uint8 FUSE_BODLEVEL1;
	/**
	 * Extended Fuse Byte - Brown-out Detector trigger level
	 */
	public const uint8 FUSE_BODLEVEL2;
	/**
	 * Extended Fuse Byte - Hardware Boot Enable
	 */
	public const uint8 FUSE_HWBE;
	public const uint8 EFUSE_DEFAULT;

	public const uint8 SIGNATURE_0;
	public const uint8 SIGNATURE_1;
	public const uint8 SIGNATURE_2;
}
