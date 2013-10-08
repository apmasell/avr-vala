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
		[CCode(cname = "uint8_t")]
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
		[CCode(cname = "uint8_t")]
		public enum Digital1 {
			[CCode(cname = "_BV(AIN0D)")]
			AIN0,
			[CCode(cname = "_BV(AIN1D)")]
			AIN1
		}
		[CCode(cname = "uint8_t")]
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
		[CCode(cname = "uint8_t")]
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
		[CCode(cname = "uint8_t")]
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
	namespace ClockSel {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control0 {
			[CCode(cname = "_BV(CLKS)")]
			CLOCK_SELECTOR,
			[CCode(cname = "_BV(EXTE)")]
			ENABLE_EXTERNAL_OR_LOW_POWER,
			[CCode(cname = "_BV(RCE)")]
			ENABLE_RC_OSCILLATOR,
			[CCode(cname = "_BV(EXSUT0)")]
			EXTERNAL_SUT_0,
			[CCode(cname = "_BV(EXSUT1)")]
			EXTERNAL_SUT_1,
			[CCode(cname = "_BV(RCSUT0)")]
			RC_SUT_0,
			[CCode(cname = "_BV(RCSUT1)")]
			RC_SUT_1
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control1 {
			[CCode(cname = "_BV(EXCKSEL0)")]
			EXTERNAL_0,
			[CCode(cname = "_BV(EXCKSEL1)")]
			EXTERNAL_1,
			[CCode(cname = "_BV(EXCKSEL2)")]
			EXTERNAL_2,
			[CCode(cname = "_BV(EXCKSEL3)")]
			EXTERNAL_3,
			[CCode(cname = "_BV(RCCKSEL0)")]
			RC_0,
			[CCode(cname = "_BV(RCCKSEL1)")]
			RC_1,
			[CCode(cname = "_BV(RCCKSEL2)")]
			RC_2,
			[CCode(cname = "_BV(RCCKSEL3)")]
			RC_3
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Status {
			[CCode(cname = "_BV(EXTON)")]
			EXTERNAL_ON,
			[CCode(cname = "_BV(RCON)")]
			RC_ON,
		}
		[CCode(cname = "CLKSEL0")]
		public Control0 control_0;
		[CCode(cname = "CLKSEL1")]
		public Control1 control_1;
		[CCode(cname = "CLKSTA")]
		public Status status;
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
		[CCode(cname = "uint8_t")]
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
		[CCode(cname = "uint8_t")]
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
	namespace Mcu {
		[CCode(cname = "uint8_t")]
		public enum InterruptVector {
			[CCode(cname = "_BV(IVCE)")]
			CHANGE_ENABLE,
			[CCode(cname = "_BV(IVSEL)")]
			SELECT
		}
		[CCode(cname = "uint8_t")]
		public enum Status {
			[CCode(cname = "_BV(5)")]
			USB_RESET,
			[CCode(cname = "_BV(PORF)")]
			POWER_ON_RESET,
			[CCode(cname = "_BV(EXTRF)")]
			EXTERNAL_RESET,
			[CCode(cname = "_BV(BORF)")]
			BROWN_OUT_RESET,
			[CCode(cname = "_BV(WDRF)")]
			WATCHDOG_RESET,
			[CCode(cname = "_BV(JTRF)")]
			JTAG_RESET
		}
		[CCode(cname = "MCUCR")]
		public InterruptVector control;
		[CCode(cname = "MCUSR")]
		public Status status;
	}
	namespace Oscillator {
		[CCode(cname = "OSCCAL")]
		public uint8 calibration;
		[CCode(cname = "RCCTRL")]
		public bool frequency_select;
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
	namespace PhaseLock {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control {
			[CCode(cname = "_BV(PLOCK)")]
			DETECTED,
			[CCode(cname = "_BV(PLLE)")]
			ENABLE,
			[CCode(cname = "_BV(PINDIV)")]
			PRESCALE_BY_2
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Frequency {
			[CCode(cname = "(_BV(PDIV1) | _BV(PDIV0))")]
			FREQ_40_MHZ,
			[CCode(cname = "_BV(PDIV2)")]
			FREQ_48_MHZ,
			[CCode(cname = "(_BV(PDIV2) | _BV(PDIV0))")]
			FREQ_56_MHZ,
			[CCode(cname = "(_BV(PDIV2) | _BV(PDIV1) | _BV(PDIV0))")]
			FREQ_72_MHZ,
			[CCode(cname = "_BV(PDIV3)")]
			FREQ_80_MHZ,
			[CCode(cname = "(_BV(PDIV3) | _BV(PDIV0))")]
			FREQ_88_MHZ,
			[CCode(cname = "(_BV(PDIV3) | _BV(PDIV1))")]
			FREQ_96_MHZ,
			[CCode(cname = "0")]
			HIGH_SPEED_POSTSCALER_DISABLE,
			[CCode(cname = "_BV(PLLTM0)")]
			HIGH_SPEED_POSTSCALER_1,
			[CCode(cname = "_BV(PLLTM1)")]
			HIGH_SPEED_POSTSCALER_1_5,
			[CCode(cname = "(_BV(PLLTM1) | _BV(PLLTM0))")]
			HIGH_SPEED_POSTSCALER_2,
			[CCode(cname = "_BV(PLLUSB)")]
			POSTSCALE_USB,
			[CCode(cname = "_BV(PINMUX)")]
			INPUT_MULTIPLEX
		}
		[CCode(cname = "PLLCSR")]
		public Control control;
		[CCode(cname = "PLLFRQ")]
		public Frequency frequency;
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
	namespace Power {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Reduction0 {
			[CCode(cname = "_BV(PRADC)")]
			ANALOG,
			[CCode(cname = "_BV(PRUSART0)")]
			USART_0,
			[CCode(cname = "_BV(PRSPI)")]
			SPI,
			[CCode(cname = "_BV(PRTIM1)")]
			TIMER_1,
			[CCode(cname = "_BV(PRTIM0)")]
			TIMER_0,
			[CCode(cname = "_BV(PRTWI)")]
			TWI
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Reduction1 {
			[CCode(cname = "_BV(PRUSART1)")]
			USART_0,
			[CCode(cname = "_BV(PRTIM4)")]
			TIMER_4,
			[CCode(cname = "_BV(PRTIM3)")]
			TIMER_3,
			[CCode(cname = "_BV(PRUSB)")]
			USB
		}
		[CCode(cname = "PRR0")]
		public Reduction0 reduction_0;
		[CCode(cname = "PRR1")]
		public Reduction1 reduction_1;
	}
	namespace Sleep {
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control {
			[CCode(cname = "_BV(SE)")]
			ENABLE,
			[CCode(cname = "0")]
			IDLE,
			[CCode(cname = "_BV(SM0)")]
			ADC_NOISE_REDUCTION,
			[CCode(cname = "_BV(SM1)")]
			POWER_DOWN,
			[CCode(cname = "(_BV(SM0) | _BV(SM1))")]
			POWER_SAVE,
			[CCode(cname = "(_BV(SM2) | _BV(SM1))")]
			STANDBY,
			[CCode(cname = "(_BV(SM2) | _BV(SM1) | _BV(SM0))")]
			EXTENDED_STANDBY
		}
		[CCode(cname = "SMCR")]
		public Control control;
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
		public enum GeneralControl {
			[CCode(cname = "_BV(PSRSYNC)")]
			PRESCALER_RESET,
			[CCode(cname = "TSM")]
			TIMER_SYNC
		}
		[CCode(cname = "GTCCR")]
		public GeneralControl control;

		/**
		 * Eight bit counter
		 */
		namespace zero {
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Control {
				[CCode(cname = "_BV(FOC0B)")]
					FORCE_OUTPUT_COMPARE_A,
					[CCode(cname = "_BV(FOC0A)")]
					FORCE_OUTPUT_COMPARE_B,
					[CCode(cname = "_BV(WGM02)")]
					WGM_2,
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
			[Flags]
			public enum Interrupt {
				[CCode(cname = "_BV(TOIE0)")]
				OVERLOW,
				[CCode(cname = "_BV(OCIE0A)")]
				COMPARE_A,
				[CCode(cname = "_BV(OCIE0B)")]
				COMPARE_B
			}
			[CCode(cname = "TCCR0A = TIMER0_MODE")]
			public void set_mode(bool wgm_0, bool wgm_1, CounterMode compare_a, CounterMode compare_b);

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
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Control {
				[CCode(cname = "_BV(ICNC1)")]
					CAPTURE_NOISE_CANCEL,
					[CCode(cname = "_BV(ICES1)")]
					CAPTURE_EDGE_SELECT,
					[CCode(cname = "_BV(WGM12)")]
					WGM_2,
					[CCode(cname = "_BV(WGM13)")]
					WGM_3,
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
					[CCode(cname = "(_BV(CS12) | _BV(CS10))")]
					SOURCE_IO_DIV_1024,
					[CCode(cname = "(_BV(CS12) | _BV(CS11))")]
					SOURCE_EXT_FALLING,
					[CCode(cname = "(_BV(CS12) | _BV(CS11) | _BV(CS10))")]
					SOURCE_EXT_RISING
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Interrupt {
				[CCode(cname = "_BV(TOIE1)")]
				OVERLOW,
				[CCode(cname = "_BV(OCIE1A)")]
				COMPARE_A,
				[CCode(cname = "_BV(OCIE1B)")]
				COMPARE_B,
				[CCode(cname = "_BV(OCIE1C)")]
				COMPARE_C,
				[CCode(cname = "_BV(ICIE1)")]
				CAPTURE
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum OutputCompare {
				[CCode(cname = "_BV(FOC1A)")]
				OVERLOW,
				[CCode(cname = "_BV(FOC1B)")]
				COMPARE_A,
				[CCode(cname = "_BV(FOC1C)")]
				COMPARE_B
			}
			[CCode(cname = "TCCR1A = TIMER_MODE")]
			public void set_mode(bool wgm_0, bool wgm_1, CounterMode compare_a, CounterMode compare_b, CounterMode compare_c);

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
			[CCode(cname = "TCCR1C")]
			public OutputCompare output_compare;
		}
		/**
		 * Sixteen bit counter
		 */
		namespace three {
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Control {
				[CCode(cname = "_BV(ICNC3)")]
					CAPTURE_NOISE_CANCEL,
					[CCode(cname = "_BV(ICES3)")]
					CAPTURE_EDGE_SELECT,
					[CCode(cname = "_BV(WGM32)")]
					WGM_2,
					[CCode(cname = "_BV(WGM33)")]
					WGM_3,
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
					[CCode(cname = "(_BV(CS12) | _BV(CS10))")]
					SOURCE_IO_DIV_1024,
					[CCode(cname = "(_BV(CS12) | _BV(CS11))")]
					SOURCE_EXT_FALLING,
					[CCode(cname = "(_BV(CS12) | _BV(CS11) | _BV(CS10))")]
					SOURCE_EXT_RISING
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Interrupt {
				[CCode(cname = "_BV(TOIE3)")]
				OVERLOW,
				[CCode(cname = "_BV(OCIE3A)")]
				COMPARE_A,
				[CCode(cname = "_BV(OCIE3B)")]
				COMPARE_B,
				[CCode(cname = "_BV(OCIE3C)")]
				COMPARE_C,
				[CCode(cname = "_BV(ICIE3)")]
				CAPTURE
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum OutputCompare {
				[CCode(cname = "_BV(FOC3A)")]
				OVERLOW
			}
			[CCode(cname = "TCCR3A = TIMER_MODE")]
			public void set_mode(bool wgm_0, bool wgm_1, CounterMode compare_a, CounterMode compare_b, CounterMode compare_c);

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
			[CCode(cname = "TCCR3C")]
			public OutputCompare output_compare;
		}
		/**
		 * Ten bit counter
		 */
		namespace four {
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum ControlA {
				[CCode(cname = "0")]
				NORMAL_A,
				[CCode(cname = "_BV(COM4A0)")]
				TOGGLE_ON_MATCH_A,
				[CCode(cname = "_BV(COM4A1)")]
				CLEAR_ON_MATCH_A,
				[CCode(cname = "(_BV(COM4A1) | _BV(COM4A0))")]
				SET_ON_MATCH_A,
				[CCode(cname = "0")]
				NORMAL_B,
				[CCode(cname = "_BV(COM4B0)")]
				TOGGLE_ON_MATCH_B,
				[CCode(cname = "_BV(COM4B1)")]
				CLEAR_ON_MATCH_B,
				[CCode(cname = "(_BV(COM4B1) | _BV(COM4B0))")]
				SET_ON_MATCH_B,
				[CCode(cname = "_BV(FOC4A)")]
				FORCE_OUTPUT_COMPARE_MATCH_A,
				[CCode(cname = "_BV(FOC4B)")]
				FORCE_OUTPUT_COMPARE_MATCH_B,
				[CCode(cname = "_BV(PWM4A)")]
				PWM_A_ENABLE,
				[CCode(cname = "_BV(PWM4B)")]
				PWM_B_ENABLE
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum ControlB {
				[CCode(cname = "_BV(PWM4X)")]
				PWM_INVERSION,
				[CCode(cname = "_BV(PSR4)")]
				PRESCALER_RESET,
				[CCode(cname = "0")]
				PRESCALER_DIV_BY_1,
				[CCode(cname = "_BV(DTPS40)")]
				PRESCALER_DIV_BY_2,
				[CCode(cname = "_BV(DTPS41)")]
				PRESCALER_DIV_BY_4,
				[CCode(cname = "(_BV(DTPS41) | _BV(DTPS40))")]
				PRESCALER_DIV_BY_8,
				[CCode(cname = "0")]
				CLOCK_STOP,
				[CCode(cname = "_BV(CS40)")]
				CLOCK_OVER_1,
				[CCode(cname = "_BV(CS41)")]
				CLOCK_OVER_2,
				[CCode(cname = "(_BV(CS41) | _BV(CS40))")]
				CLOCK_OVER_4,
				[CCode(cname = "_BV(CS42)")]
				CLOCK_OVER_8,
				[CCode(cname = "(_BV(CS42) | _BV(CS40))")]
				CLOCK_OVER_16,
				[CCode(cname = "(_BV(CS42) | _BV(CS41))")]
				CLOCK_OVER_32,
				[CCode(cname = "(_BV(CS42) | _BV(CS41) | _BV(CS40))")]
				CLOCK_OVER_64,
				[CCode(cname = "_BV(CS43)")]
				CLOCK_OVER_128,
				[CCode(cname = "(_BV(CS43) | _BV(CS40))")]
				CLOCK_OVER_256,
				[CCode(cname = "(_BV(CS43) | _BV(CS41))")]
				CLOCK_OVER_512,
				[CCode(cname = "(_BV(CS43) | _BV(CS41) | _BV(CS40))")]
				CLOCK_OVER_1024,
				[CCode(cname = "(_BV(CS43) | _BV(CS412)")]
				CLOCK_OVER_2048,
				[CCode(cname = "(_BV(CS43) | _BV(CS42) | _BV(CS40))")]
				CLOCK_OVER_4096,
				[CCode(cname = "(_BV(CS43) | _BV(CS42) | _BV(CS41))")]
				CLOCK_OVER_8192,
				[CCode(cname = "(_BV(CS43) | _BV(CS42) | _BV(CS41) | _BV(CS40))")]
				CLOCK_OVER_16384
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum ControlC {
				[CCode(cname = "_BV(COM4A1S)")]
				COMA1_SHADOW,
				[CCode(cname = "_BV(COM4A0S)")]
				COMA0_SHADOW,
				[CCode(cname = "_BV(COM4B1S)")]
				COMB1_SHADOW,
				[CCode(cname = "_BV(COM4B0S)")]
				COMB0_SHADOW,
				[CCode(cname = "_BV(COM4A1S)")]
				COMD1_SHADOW,
				[CCode(cname = "_BV(COM4D0S)")]
				COMD0_SHADOW,
				[CCode(cname = "_BV(FOC4D)")]
				FORCE_OUTPUT_COMPARE_MATCH_D,
				[CCode(cname = "_BV(COM4D0S)")]
				PWM_D_ENABLE
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum ControlD {
				[CCode(cname = "_BV(FPIE4)")]
				FAULT_PROTECTION_INTERRUPT_ENABLE,
				[CCode(cname = "_BV(FPEN4)")]
				FAULT_PROTECTION_ENABLE,
				[CCode(cname = "_BV(FPNC4)")]
				FAULT_PROTECTION_NOISE_CANCEL,
				[CCode(cname = "_BV(FPEX4)")]
				FAULT_PROTECTION_EDGE_SELECT,
				[CCode(cname = "_BV(FPAC4)")]
				FAULT_PROTECTION_ANALOG_COMPARATOR_ENABLE,
				[CCode(cname = "_BV(FPF4)")]
				FAULT_PROTECTION_INTERRUPT_FLAG,
				[CCode(cname = "0")]
				FAST_PWM,
				[CCode(cname = "_BV(WGM40)")]
				PHASE_FREQ_CORRECT_PWM,
				[CCode(cname = "_BV(WGM41)")]
				SINGLE_SLOPE_PWM6,
				[CCode(cname = "(_BV(WGM40) | _BV(WGM41))")]
				DUAL_SLOPE_PWM6,
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum ControlE {
				[CCode(cname = "_BV(TLOCK4)")]
				REGISTER_UPDATE_LOCK,
				[CCode(cname = "_BV(ENHC4)")]
				ENHANCE_COMPARE_MODE,
				[CCode(cname = "_BV(OC4OE5)")]
				OUTPUT_COMPARE_OVERRIDE_5,
				[CCode(cname = "_BV(OC4OE4)")]
				OUTPUT_COMPARE_OVERRIDE_4,
				[CCode(cname = "_BV(OC4OE3)")]
				OUTPUT_COMPARE_OVERRIDE_3,
				[CCode(cname = "_BV(OC4OE2)")]
				OUTPUT_COMPARE_OVERRIDE_2,
				[CCode(cname = "_BV(OC4OE1)")]
				OUTPUT_COMPARE_OVERRIDE_1,
				[CCode(cname = "_BV(OC4OE0)")]
				OUTPUT_COMPARE_OVERRIDE_0
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Interrupt {
				[CCode(cname = "_BV(TOIE4)")]
				OVERLOW,
				[CCode(cname = "_BV(OCIE1A)")]
				COMPARE_A,
				[CCode(cname = "_BV(OCIE1B)")]
				COMPARE_B,
				[CCode(cname = "_BV(OCIE1D)")]
				COMPARE_D,
				[CCode(cname = "_BV(ICIE1)")]
				CAPTURE
			}
			[CCode(cname = "TCCR4A")]
			public ControlA control_a;
			[CCode(cname = "TCCR4B")]
			public ControlB control_b;
			[CCode(cname = "TCCR4C")]
			public ControlC control_c;
			[CCode(cname = "OCR4A")]
			public uint8 compare_a;
			[CCode(cname = "OCR4B")]
			public uint8 compare_b;
			[CCode(cname = "OCR4C")]
			public uint8 compare_c;
			[CCode(cname = "OCR4D")]
			public uint8 compare_d;
			[CCode(cname = "TCNT4")]
			public uint8 counter;
			[CCode(cname = "TIMSK4")]
			public Interrupt interrupt_enable;
			[CCode(cname = "TIFR4")]
			public Interrupt interrupt_flag;
			[CCode(cname = "DT4")]
			public uint8 dead_time;
		}
	}
	namespace I2C {
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
		namespace Bus {
			[CCode(cname = "uint8_t")]
			public enum Control {
				[CCode(cname = "_BV(VBUSTE)")]
				VBUS_TRANSITION_INTERRUPT,
				[CCode(cname = "_BV(OTGPADE)")]
				VBUS_PAD,
				[CCode(cname = "_BV(FRZCLK)")]
				FREEZE_CLOCK,
				[CCode(cname = "_BV(USBE)")]
				ENABLE
			}
			[CCode(cname = "uint8_t")]
			public enum Status {
				[CCode(cname = "_BV(VBUS)")]
				VBUS
			}
			[CCode(cname = "USBCON")]
			public Control control;
			[CCode(cname = "USBSTA")]
			public Status status;
			[CCode(cname = "UHWCON")]
			public bool pad_regulator_enable;
			[CCode(cname = "USBINT")]
			public bool vbus_transition;
		}
		namespace Endpoint {
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Config {
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
				 * Enable an interrupt when {@link Status.ISO_UNDERFLOW} or {@link Status.ISO_OVERFLOW} is set.
				 */
				[CCode(cname = "_BV(FLERRE)")]
				FLOW_ERROR
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Setup {
				/**
				 * Allocate memory for the endpoint.
				 *
				 * Clear to free the memory.
				 */
				[CCode(cname = "_BV(ALLOC)")]
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
			}
			[CCode(cname = "uint8_t")]
			[Flags]
			public enum Status {
				/**
				 * Set by the hardware when the endpoint size and bank parameter in
				 * {@link endpoint_setup} are correct.
				 *
				 * This is updated when {@link EndpointSetup.ALLOC} is set. If this bit
				 * is cleared, {@link endpoint_setup} should be reprogrammed with the
				 * correct size and bank.
				 */
				[CCode(cname = "_BV(CFGOK)")]
				CONFIG_OK,
				/**
				 * Set by the hardware when underflow occurs in an isochronous endpoint.
				 */
				[CCode(cname = "_BV(UNDERFI)")]
				ISO_UNDERFLOW,
				/**
				 * Set by the hardware when overflow occurs in an isochronous endpoint.
				 */
				[CCode(cname = "_BV(OVERFI)")]
				ISO_OVERFLOW,
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
			public enum Status2 {
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
			[CCode(cname = "UENUM")]
			public uint8 number;
			[CCode(cname = "UECFG0X")]
			public Config endpont_config;
			[CCode(cname = "UECFG1X")]
			public Setup setup;
			[CCode(cname = "UESTA0X")]
			public Status status;
			[CCode(cname = "UESTA1X")]
			public Status2 status2;
			[CCode(cname = "UEIENX")]
			public Interrupt enable;
			[CCode(cname = "UEINT")]
			public uint8 interrupts;
			[CCode(cname = "UERST")]
			public uint8 fifo_reset;
		}
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
			CLEAR_TOGGLE,
			/**
			 * Disable the stall mechanism.
			 *
			 * Cleared by hardware immediately after the set. Clearing by software as no effect.
			 */
			[CCode(cname = "_BV(STALLRQC)")]
			STALL_DISABLE,
			/**
			 * Request a stall answer to the host for the next handshake.
			 *
			 * Cleared when a new setup is received. Clearing by software as no effect.
			 */
			[CCode(cname = "_BV(STALLRQ)")]
			STALL_REQUEST
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Control {
			[CCode(cname = "_BV(DETACH)")]
			DETACH,
			[CCode(cname = "_BV(RMWKUP)")]
			REMOTE_WAKE_UP,
			[CCode(cname = "_BV(LSM)")]
			LOW_SPEED_MODE,
			[CCode(cname = "_BV(RSTCPU)")]
			RESET_CPU
		}
		[CCode(cname = "uint8_t")]
		[Flags]
		public enum Interrupt {
			[CCode(cname = "_BV(SUSPI)")]
			SUSPEND,
			[CCode(cname = "_BV(SOFI)")]
			START_OF_FRAME,
			[CCode(cname = "_BV(EORSTI)")]
			END_OF_RESET,
			[CCode(cname = "_BV(WAKEUPI)")]
			WAKEUP_CPU,
			[CCode(cname = "_BV(EORSMI)")]
			END_OF_RESUME,
			[CCode(cname = "_BV(UPRSMI)")]
			UPSTREAM_RESUME
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
			FIFO_CONTROL
		}
		[CCode(cname = "UDADDR")]
		public uint8 address;
		[CCode(cname = "UECONX")]
		public Connection connection;
		[CCode(cname = "UEDATX")]
		public uint8 data;
		[CCode(cname = "UDCON")]
		public Control control;
		[CCode(cname = "UDFNUM")]
		public uint16 frame_number;
		[CCode(cname = "UDMFN")]
		public bool frame_number_crc_error;
		[CCode(cname = "UDINT")]
		public Interrupt interrupt_flag;
		[CCode(cname = "UDIEN")]
		public Interrupt interrupt_enable;
		[CCode(cname = "UEINTX")]
		public Status status;
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
	[CCode(cname = "GPIOR0")]
	public uint8 gpio_0;
	[CCode(cname = "GPIOR1")]
	public uint8 gpio_1;
	[CCode(cname = "GPIOR2")]
	public uint8 gpio_2;

	[CCode(cname = "SPM_PAGESIZE")]
	public const size_t SPM_PAGESIZE;
	[CCode(cname = "RAMSTART")]
	public const size_t RAM_START;
	[CCode(cname = "RAMSIZE")]
	public const size_t RAM_SIZE;
	[CCode(cname = "RAMEND")]
	public const size_t RAM_END;
	[CCode(cname = "XRAMSTART")]
	public const size_t XRAM_START;
	[CCode(cname = "XRAMSIZE")]
	public const size_t XRAM_SIZE;
	[CCode(cname = "XRAMEND")]
	public const size_t XRAM_END;
	[CCode(cname = "E2END")]
	public const size_t E2_END;
	[CCode(cname = "E2PAGESIZE")]
	public const size_t E2_PAGESIZE;
	[CCode(cname = "FLASHEND")]
	public const size_t FLASH_END;

	[CCode(cname = "SIGNATURE_0")]
	public const uint8 SIGNATURE_0;
	[CCode(cname = "SIGNATURE_1")]
	public const uint8 SIGNATURE_1;
	[CCode(cname = "SIGNATURE_2")]
	public const uint8 SIGNATURE_2;
}
