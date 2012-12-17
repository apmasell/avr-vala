[CCode(cheader_filename = "avr/io.h", cprefix = "")]
namespace Avr {
	public uint8 PINB;
	public const uint8 PINB0;
	public const uint8 PINB1;
	public const uint8 PINB2;
	public const uint8 PINB3;
	public const uint8 PINB4;
	public const uint8 PINB5;
	public const uint8 PINB6;
	public const uint8 PINB7;

	public uint8 DDRB;
	public const uint8 DDB0;
	public const uint8 DDB1;
	public const uint8 DDB2;
	public const uint8 DDB3;
	public const uint8 DDB4;
	public const uint8 DDB5;
	public const uint8 DDB6;
	public const uint8 DDB7;

	public uint8 PORTB;
	public const uint8 PORTB0;
	public const uint8 PORTB1;
	public const uint8 PORTB2;
	public const uint8 PORTB3;
	public const uint8 PORTB4;
	public const uint8 PORTB5;
	public const uint8 PORTB6;
	public const uint8 PORTB7;

	public uint8 PINC;
	public const uint8 PINC6;
	public const uint8 PINC7;

	public const uint8 DDRC;
	public const uint8 DDC6;
	public const uint8 DDC7;

	public const uint8 PORTC;
	public const uint8 PORTC6;
	public const uint8 PORTC7;

	public const uint8 PIND;
	public const uint8 PIND0;
	public const uint8 PIND1;
	public const uint8 PIND2;
	public const uint8 PIND3;
	public const uint8 PIND4;
	public const uint8 PIND5;
	public const uint8 PIND6;
	public const uint8 PIND7;

	public uint8 DDRD;
	public const uint8 DDD0;
	public const uint8 DDD1;
	public const uint8 DDD2;
	public const uint8 DDD3;
	public const uint8 DDD4;
	public const uint8 DDD5;
	public const uint8 DDD6;
	public const uint8 DDD7;

	public uint8 PORTD;
	public const uint8 PORTD0;
	public const uint8 PORTD1;
	public const uint8 PORTD2;
	public const uint8 PORTD3;
	public const uint8 PORTD4;
	public const uint8 PORTD5;
	public const uint8 PORTD6;
	public const uint8 PORTD7;

	public uint8 PINE;
	public const uint8 PINE2;
	public const uint8 PINE6;

	public uint8 DDRE;
	public const uint8 DDE2;
	public const uint8 DDE6;

	public uint8 PORTE;
	public const uint8 PORTE2;
	public const uint8 PORTE6;

	public uint8 PINF;
	public const uint8 PINF0;
	public const uint8 PINF1;
	public const uint8 PINF4;
	public const uint8 PINF5;
	public const uint8 PINF6;
	public const uint8 PINF7;

	public uint8 DDRF;
	public const uint8 DDF0;
	public const uint8 DDF1;
	public const uint8 DDF4;
	public const uint8 DDF5;
	public const uint8 DDF6;
	public const uint8 DDF7;

	public uint8 PORTF;
	public const uint8 PORTF0;
	public const uint8 PORTF1;
	public const uint8 PORTF4;
	public const uint8 PORTF5;
	public const uint8 PORTF6;
	public const uint8 PORTF7;

	public uint8 TIFR0;
	public const uint8 TOV0;
	public const uint8 OCF0A;
	public const uint8 OCF0B;

	public uint8 TIFR1;
	public const uint8 TOV1;
	public const uint8 OCF1A;
	public const uint8 OCF1B;
	public const uint8 OCF1C;
	public const uint8 ICF1;

	public uint8 TIFR2;
	public const uint8 TOV2;
	public const uint8 OCF2A;
	public const uint8 OCF2B;

	public uint8 TIFR3;
	public const uint8 TOV3;
	public const uint8 OCF3A;
	public const uint8 OCF3B;
	public const uint8 OCF3C;
	public const uint8 ICF3;

	public uint8 TIFR4;
	public const uint8 TOV4;
	public const uint8 OCF4B;
	public const uint8 OCF4A;
	public const uint8 OCF4D;

	public uint8 TIFR5;

	public uint8 PCIFR;
	public const uint8 PCIF0;

	public uint8 EIFR;
	public const uint8 INTF0;
	public const uint8 INTF1;
	public const uint8 INTF2;
	public const uint8 INTF3;
	public const uint8 INTF4;
	public const uint8 INTF5;
	public const uint8 INTF6;
	public const uint8 INTF7;

	public uint8 EIMSK;
	public const uint8 INT0;
	public const uint8 INT1;
	public const uint8 INT2;
	public const uint8 INT3;
	public const uint8 INT4;
	public const uint8 INT5;
	public const uint8 INT6;
	public const uint8 INT7;

	public uint8 GPIOR0;
	public const uint8 GPIOR00;
	public const uint8 GPIOR01;
	public const uint8 GPIOR02;
	public const uint8 GPIOR03;
	public const uint8 GPIOR04;
	public const uint8 GPIOR05;
	public const uint8 GPIOR06;
	public const uint8 GPIOR07;

	public uint8 EECR;
	public const uint8 EERE;
	public const uint8 EEPE;
	public const uint8 EEMPE;
	public const uint8 EERIE;
	public const uint8 EEPM0;
	public const uint8 EEPM1;

	public uint8 EEDR;
	public const uint8 EEDR0;
	public const uint8 EEDR1;
	public const uint8 EEDR2;
	public const uint8 EEDR3;
	public const uint8 EEDR4;
	public const uint8 EEDR5;
	public const uint8 EEDR6;
	public const uint8 EEDR7;

	public uint8 EEAR;

	public uint8 EEARL;
	public const uint8 EEAR0;
	public const uint8 EEAR1;
	public const uint8 EEAR2;
	public const uint8 EEAR3;
	public const uint8 EEAR4;
	public const uint8 EEAR5;
	public const uint8 EEAR6;
	public const uint8 EEAR7;

	public uint8 EEARH;
	public const uint8 EEAR8;
	public const uint8 EEAR9;
	public const uint8 EEAR10;
	public const uint8 EEAR11;

	public uint8 GTCCR;
	public const uint8 PSRSYNC;
	public const uint8 PSRASY;
	public const uint8 TSM;

	public uint8 TCCR0A;
	public const uint8 WGM00;
	public const uint8 WGM01;
	public const uint8 COM0B0;
	public const uint8 COM0B1;
	public const uint8 COM0A0;
	public const uint8 COM0A1;

	public uint8 TCCR0B;
	public const uint8 CS00;
	public const uint8 CS01;
	public const uint8 CS02;
	public const uint8 WGM02;
	public const uint8 FOC0B;
	public const uint8 FOC0A;

	public uint8 TCNT0;
	public const uint8 TCNT0_0;
	public const uint8 TCNT0_1;
	public const uint8 TCNT0_2;
	public const uint8 TCNT0_3;
	public const uint8 TCNT0_4;
	public const uint8 TCNT0_5;
	public const uint8 TCNT0_6;
	public const uint8 TCNT0_7;

	public uint8 OCR0A;
	public const uint8 OCR0A_0;
	public const uint8 OCR0A_1;
	public const uint8 OCR0A_2;
	public const uint8 OCR0A_3;
	public const uint8 OCR0A_4;
	public const uint8 OCR0A_5;
	public const uint8 OCR0A_6;
	public const uint8 OCR0A_7;

	public uint8 OCR0B;
	public const uint8 OCR0B_0;
	public const uint8 OCR0B_1;
	public const uint8 OCR0B_2;
	public const uint8 OCR0B_3;
	public const uint8 OCR0B_4;
	public const uint8 OCR0B_5;
	public const uint8 OCR0B_6;
	public const uint8 OCR0B_7;

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

	public uint8 SPCR;
	public const uint8 SPR0;
	public const uint8 SPR1;
	public const uint8 CPHA;
	public const uint8 CPOL;
	public const uint8 MSTR;
	public const uint8 DORD;
	public const uint8 SPE;
	public const uint8 SPIE;

	public uint8 SPSR;
	public const uint8 SPI2X;
	public const uint8 WCOL;
	public const uint8 SPIF;

	public uint8 SPDR;
	public const uint8 SPDR0;
	public const uint8 SPDR1;
	public const uint8 SPDR2;
	public const uint8 SPDR3;
	public const uint8 SPDR4;
	public const uint8 SPDR5;
	public const uint8 SPDR6;
	public const uint8 SPDR7;

	public uint8 ACSR;
	public const uint8 ACIS0;
	public const uint8 ACIS1;
	public const uint8 ACIC;
	public const uint8 ACIE;
	public const uint8 ACI;
	public const uint8 ACO;
	public const uint8 ACBG;
	public const uint8 ACD;

	public uint8 OCDR;
	public const uint8 OCDR0;
	public const uint8 OCDR1;
	public const uint8 OCDR2;
	public const uint8 OCDR3;
	public const uint8 OCDR4;
	public const uint8 OCDR5;
	public const uint8 OCDR6;
	public const uint8 OCDR7;

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

	public uint8 SPMCSR;
	public const uint8 SPMEN;
	public const uint8 PGERS;
	public const uint8 PGWRT;
	public const uint8 BLBSET;
	public const uint8 RWWSRE;
	public const uint8 SIGRD;
	public const uint8 RWWSB;
	public const uint8 SPMIE;

	public uint8 RAMPZ;
	public const uint8 RAMPZ0;

	public uint8 EIND;
	public const uint8 EIND0;

	public uint8 WDTCSR;
	public const uint8 WDP0;
	public const uint8 WDP1;
	public const uint8 WDP2;
	public const uint8 WDE;
	public const uint8 WDCE;
	public const uint8 WDP3;
	public const uint8 WDIE;
	public const uint8 WDIF;

	public uint8 CLKPR;
	public const uint8 CLKPS0;
	public const uint8 CLKPS1;
	public const uint8 CLKPS2;
	public const uint8 CLKPS3;
	public const uint8 CLKPCE;

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

	public uint8 PCICR;
	public const uint8 PCIE0;

	public uint8 EICRA;
	public const uint8 ISC00;
	public const uint8 ISC01;
	public const uint8 ISC10;
	public const uint8 ISC11;
	public const uint8 ISC20;
	public const uint8 ISC21;
	public const uint8 ISC30;
	public const uint8 ISC31;

	public uint8 EICRB;
	public const uint8 ISC40;
	public const uint8 ISC41;
	public const uint8 ISC50;
	public const uint8 ISC51;
	public const uint8 ISC60;
	public const uint8 ISC61;
	public const uint8 ISC70;
	public const uint8 ISC71;

	public uint8 PCMSK0;
	public const uint8 PCINT0;
	public const uint8 PCINT1;
	public const uint8 PCINT2;
	public const uint8 PCINT3;
	public const uint8 PCINT4;
	public const uint8 PCINT5;
	public const uint8 PCINT6;
	public const uint8 PCINT7;

	public uint8 PCMSK1;

	public uint8 PCMSK2;

	public uint8 TIMSK0;
	public const uint8 TOIE0;
	public const uint8 OCIE0A;
	public const uint8 OCIE0B;

	public uint8 TIMSK1;
	public const uint8 TOIE1;
	public const uint8 OCIE1A;
	public const uint8 OCIE1B;
	public const uint8 OCIE1C;
	public const uint8 ICIE1;

	public uint8 TIMSK2;
	public const uint8 TOIE2;
	public const uint8 OCIE2A;
	public const uint8 OCIE2B;

	public uint8 TIMSK3;
	public const uint8 TOIE3;
	public const uint8 OCIE3A;
	public const uint8 OCIE3B;
	public const uint8 OCIE3C;
	public const uint8 ICIE3;

	public uint8 TIMSK4;
	public const uint8 TOIE4;
	public const uint8 OCIE4B;
	public const uint8 OCIE4A;
	public const uint8 OCIE4D;

	public uint8 TIMSK5;

	public uint8 ADC;
	public uint8 ADCW;

	public uint8 ADCL;
	public const uint8 ADCL0;
	public const uint8 ADCL1;
	public const uint8 ADCL2;
	public const uint8 ADCL3;
	public const uint8 ADCL4;
	public const uint8 ADCL5;
	public const uint8 ADCL6;
	public const uint8 ADCL7;

	public uint8 ADCH;
	public const uint8 ADCH0;
	public const uint8 ADCH1;
	public const uint8 ADCH2;
	public const uint8 ADCH3;
	public const uint8 ADCH4;
	public const uint8 ADCH5;
	public const uint8 ADCH6;
	public const uint8 ADCH7;

	public uint8 ADCSRA;
	public const uint8 ADPS0;
	public const uint8 ADPS1;
	public const uint8 ADPS2;
	public const uint8 ADIE;
	public const uint8 ADIF;
	public const uint8 ADATE;
	public const uint8 ADSC;
	public const uint8 ADEN;

	public uint8 ADCSRB;
	public const uint8 ADTS0;
	public const uint8 ADTS1;
	public const uint8 ADTS2;
	public const uint8 ADTS3;
	public const uint8 MUX5;
	public const uint8 ACME;
	public const uint8 ADHSM;

	public uint8 ADMUX;
	public const uint8 MUX0;
	public const uint8 MUX1;
	public const uint8 MUX2;
	public const uint8 MUX3;
	public const uint8 MUX4;
	public const uint8 ADLAR;
	public const uint8 REFS0;
	public const uint8 REFS1;

	public uint8 DIDR2;
	public const uint8 ADC8D;
	public const uint8 ADC9D;
	public const uint8 ADC10D;
	public const uint8 ADC11D;
	public const uint8 ADC12D;
	public const uint8 ADC13D;

	public uint8 DIDR0;
	public const uint8 ADC0D;
	public const uint8 ADC1D;
	public const uint8 ADC2D;
	public const uint8 ADC3D;
	public const uint8 ADC4D;
	public const uint8 ADC5D;
	public const uint8 ADC6D;
	public const uint8 ADC7D;

	public uint8 DIDR1;
	public const uint8 AIN0D;
	public const uint8 AIN1D;

	public uint8 TCCR1A;
	public const uint8 WGM10;
	public const uint8 WGM11;
	public const uint8 COM1C0;
	public const uint8 COM1C1;
	public const uint8 COM1B0;
	public const uint8 COM1B1;
	public const uint8 COM1A0;
	public const uint8 COM1A1;

	public uint8 TCCR1B;
	public const uint8 CS10;
	public const uint8 CS11;
	public const uint8 CS12;
	public const uint8 WGM12;
	public const uint8 WGM13;
	public const uint8 ICES1;
	public const uint8 ICNC1;

	public uint8 TCCR1C;
	public const uint8 FOC1C;
	public const uint8 FOC1B;
	public const uint8 FOC1A;

	public uint8 TCNT1;

	public uint8 TCNT1L;
	public const uint8 TCNT1L0;
	public const uint8 TCNT1L1;
	public const uint8 TCNT1L2;
	public const uint8 TCNT1L3;
	public const uint8 TCNT1L4;
	public const uint8 TCNT1L5;
	public const uint8 TCNT1L6;
	public const uint8 TCNT1L7;

	public uint8 TCNT1H;
	public const uint8 TCNT1H0;
	public const uint8 TCNT1H1;
	public const uint8 TCNT1H2;
	public const uint8 TCNT1H3;
	public const uint8 TCNT1H4;
	public const uint8 TCNT1H5;
	public const uint8 TCNT1H6;
	public const uint8 TCNT1H7;

	public uint8 ICR1;

	public uint8 ICR1L;
	public const uint8 ICR1L0;
	public const uint8 ICR1L1;
	public const uint8 ICR1L2;
	public const uint8 ICR1L3;
	public const uint8 ICR1L4;
	public const uint8 ICR1L5;
	public const uint8 ICR1L6;
	public const uint8 ICR1L7;

	public uint8 ICR1H;
	public const uint8 ICR1H0;
	public const uint8 ICR1H1;
	public const uint8 ICR1H2;
	public const uint8 ICR1H3;
	public const uint8 ICR1H4;
	public const uint8 ICR1H5;
	public const uint8 ICR1H6;
	public const uint8 ICR1H7;

	public uint8 OCR1A;

	public uint8 OCR1AL;
	public const uint8 OCR1AL0;
	public const uint8 OCR1AL1;
	public const uint8 OCR1AL2;
	public const uint8 OCR1AL3;
	public const uint8 OCR1AL4;
	public const uint8 OCR1AL5;
	public const uint8 OCR1AL6;
	public const uint8 OCR1AL7;

	public uint8 OCR1AH;
	public const uint8 OCR1AH0;
	public const uint8 OCR1AH1;
	public const uint8 OCR1AH2;
	public const uint8 OCR1AH3;
	public const uint8 OCR1AH4;
	public const uint8 OCR1AH5;
	public const uint8 OCR1AH6;
	public const uint8 OCR1AH7;

	public uint8 OCR1B;

	public uint8 OCR1BL;
	public const uint8 OCR1BL0;
	public const uint8 OCR1BL1;
	public const uint8 OCR1BL2;
	public const uint8 OCR1BL3;
	public const uint8 OCR1BL4;
	public const uint8 OCR1BL5;
	public const uint8 OCR1BL6;
	public const uint8 OCR1BL7;

	public uint8 OCR1BH;
	public const uint8 OCR1BH0;
	public const uint8 OCR1BH1;
	public const uint8 OCR1BH2;
	public const uint8 OCR1BH3;
	public const uint8 OCR1BH4;
	public const uint8 OCR1BH5;
	public const uint8 OCR1BH6;
	public const uint8 OCR1BH7;

	public uint8 OCR1C;

	public uint8 OCR1CL;
	public const uint8 OCR1CL0;
	public const uint8 OCR1CL1;
	public const uint8 OCR1CL2;
	public const uint8 OCR1CL3;
	public const uint8 OCR1CL4;
	public const uint8 OCR1CL5;
	public const uint8 OCR1CL6;
	public const uint8 OCR1CL7;

	public uint8 OCR1CH;
	public const uint8 OCR1CH0;
	public const uint8 OCR1CH1;
	public const uint8 OCR1CH2;
	public const uint8 OCR1CH3;
	public const uint8 OCR1CH4;
	public const uint8 OCR1CH5;
	public const uint8 OCR1CH6;
	public const uint8 OCR1CH7;

	public uint8 TCCR3A;
	public const uint8 WGM30;
	public const uint8 WGM31;
	public const uint8 COM3C0;
	public const uint8 COM3C1;
	public const uint8 COM3B0;
	public const uint8 COM3B1;
	public const uint8 COM3A0;
	public const uint8 COM3A1;

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

	public uint8 TCNT3;

	public uint8 TCNT3L;
	public const uint8 TCNT3L0;
	public const uint8 TCNT3L1;
	public const uint8 TCNT3L2;
	public const uint8 TCNT3L3;
	public const uint8 TCNT3L4;
	public const uint8 TCNT3L5;
	public const uint8 TCNT3L6;
	public const uint8 TCNT3L7;

	public uint8 TCNT3H;
	public const uint8 TCNT3H0;
	public const uint8 TCNT3H1;
	public const uint8 TCNT3H2;
	public const uint8 TCNT3H3;
	public const uint8 TCNT3H4;
	public const uint8 TCNT3H5;
	public const uint8 TCNT3H6;
	public const uint8 TCNT3H7;

	public uint8 ICR3;

	public uint8 ICR3L;
	public const uint8 ICR3L0;
	public const uint8 ICR3L1;
	public const uint8 ICR3L2;
	public const uint8 ICR3L3;
	public const uint8 ICR3L4;
	public const uint8 ICR3L5;
	public const uint8 ICR3L6;
	public const uint8 ICR3L7;

	public uint8 ICR3H;
	public const uint8 ICR3H0;
	public const uint8 ICR3H1;
	public const uint8 ICR3H2;
	public const uint8 ICR3H3;
	public const uint8 ICR3H4;
	public const uint8 ICR3H5;
	public const uint8 ICR3H6;
	public const uint8 ICR3H7;

	public uint8 OCR3A;

	public uint8 OCR3AL;
	public const uint8 OCR3AL0;
	public const uint8 OCR3AL1;
	public const uint8 OCR3AL2;
	public const uint8 OCR3AL3;
	public const uint8 OCR3AL4;
	public const uint8 OCR3AL5;
	public const uint8 OCR3AL6;
	public const uint8 OCR3AL7;

	public uint8 OCR3AH;
	public const uint8 OCR3AH0;
	public const uint8 OCR3AH1;
	public const uint8 OCR3AH2;
	public const uint8 OCR3AH3;
	public const uint8 OCR3AH4;
	public const uint8 OCR3AH5;
	public const uint8 OCR3AH6;
	public const uint8 OCR3AH7;

	public uint8 OCR3B;

	public uint8 OCR3BL;
	public const uint8 OCR3BL0;
	public const uint8 OCR3BL1;
	public const uint8 OCR3BL2;
	public const uint8 OCR3BL3;
	public const uint8 OCR3BL4;
	public const uint8 OCR3BL5;
	public const uint8 OCR3BL6;
	public const uint8 OCR3BL7;

	public uint8 OCR3BH;
	public const uint8 OCR3BH0;
	public const uint8 OCR3BH1;
	public const uint8 OCR3BH2;
	public const uint8 OCR3BH3;
	public const uint8 OCR3BH4;
	public const uint8 OCR3BH5;
	public const uint8 OCR3BH6;
	public const uint8 OCR3BH7;

	public uint8 OCR3C;

	public uint8 OCR3CL;
	public const uint8 OCR3CL0;
	public const uint8 OCR3CL1;
	public const uint8 OCR3CL2;
	public const uint8 OCR3CL3;
	public const uint8 OCR3CL4;
	public const uint8 OCR3CL5;
	public const uint8 OCR3CL6;
	public const uint8 OCR3CL7;

	public uint8 OCR3CH;
	public const uint8 OCR3CH0;
	public const uint8 OCR3CH1;
	public const uint8 OCR3CH2;
	public const uint8 OCR3CH3;
	public const uint8 OCR3CH4;
	public const uint8 OCR3CH5;
	public const uint8 OCR3CH6;
	public const uint8 OCR3CH7;

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
	public const uint8 TCNT2_0;
	public const uint8 TCNT2_1;
	public const uint8 TCNT2_2;
	public const uint8 TCNT2_3;
	public const uint8 TCNT2_4;
	public const uint8 TCNT2_5;
	public const uint8 TCNT2_6;
	public const uint8 TCNT2_7;

	public uint8 OCR2A;
	public const uint8 OCR2_0;
	public const uint8 OCR2_1;
	public const uint8 OCR2_2;
	public const uint8 OCR2_3;
	public const uint8 OCR2_4;
	public const uint8 OCR2_5;
	public const uint8 OCR2_6;
	public const uint8 OCR2_7;

	public uint8 OCR2B;

	public uint8 TWBR;
	public const uint8 TWBR0;
	public const uint8 TWBR1;
	public const uint8 TWBR2;
	public const uint8 TWBR3;
	public const uint8 TWBR4;
	public const uint8 TWBR5;
	public const uint8 TWBR6;
	public const uint8 TWBR7;

	public uint8 TWSR;
	public const uint8 TWPS0;
	public const uint8 TWPS1;
	public const uint8 TWS3;
	public const uint8 TWS4;
	public const uint8 TWS5;
	public const uint8 TWS6;
	public const uint8 TWS7;

	public uint8 TWAR;
	public const uint8 TWGCE;
	public const uint8 TWA0;
	public const uint8 TWA1;
	public const uint8 TWA2;
	public const uint8 TWA3;
	public const uint8 TWA4;
	public const uint8 TWA5;
	public const uint8 TWA6;

	public uint8 TWDR;
	public const uint8 TWD0;
	public const uint8 TWD1;
	public const uint8 TWD2;
	public const uint8 TWD3;
	public const uint8 TWD4;
	public const uint8 TWD5;
	public const uint8 TWD6;
	public const uint8 TWD7;

	public uint8 TWCR;
	public const uint8 TWIE;
	public const uint8 TWEN;
	public const uint8 TWWC;
	public const uint8 TWSTO;
	public const uint8 TWSTA;
	public const uint8 TWEA;
	public const uint8 TWINT;

	public uint8 TWAMR;
	public const uint8 TWAM0;
	public const uint8 TWAM1;
	public const uint8 TWAM2;
	public const uint8 TWAM3;
	public const uint8 TWAM4;
	public const uint8 TWAM5;
	public const uint8 TWAM6;

	public uint8 TCNT4;

	public uint8 TCNT4L;
	public const uint8 TC40;
	public const uint8 TC41;
	public const uint8 TC42;
	public const uint8 TC43;
	public const uint8 TC44;
	public const uint8 TC45;
	public const uint8 TC46;
	public const uint8 TC47;

	public uint8 TCNT4H;
	public uint8 TC4H;
	public const uint8 TC48;
	public const uint8 TC49;
	public const uint8 TC410;

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

	public uint8 UCSR1A;
	public const uint8 MPCM1;
	public const uint8 U2X1;
	public const uint8 UPE1;
	public const uint8 DOR1;
	public const uint8 FE1;
	public const uint8 UDRE1;
	public const uint8 TXC1;
	public const uint8 RXC1;

	public uint8 UCSR1B;
	public const uint8 TXB81;
	public const uint8 RXB81;
	public const uint8 UCSZ12;
	public const uint8 TXEN1;
	public const uint8 RXEN1;
	public const uint8 UDRIE1;
	public const uint8 TXCIE1;
	public const uint8 RXCIE1;

	public uint8 UCSR1C;
	public const uint8 UCPOL1;
	public const uint8 UCSZ10;
	public const uint8 UCSZ11;
	public const uint8 USBS1;
	public const uint8 UPM10;
	public const uint8 UPM11;
	public const uint8 UMSEL10;
	public const uint8 UMSEL11;

	public uint8 UBRR1;

	public uint8 UBRR1L;

	public uint8 UBRR1H;

	public uint8 UDR1;
	public const uint8 UDR1_0;
	public const uint8 UDR1_1;
	public const uint8 UDR1_2;
	public const uint8 UDR1_3;
	public const uint8 UDR1_4;
	public const uint8 UDR1_5;
	public const uint8 UDR1_6;
	public const uint8 UDR1_7;

	public uint8 OCR4A;
	public const uint8 OCR4A0;
	public const uint8 OCR4A1;
	public const uint8 OCR4A2;
	public const uint8 OCR4A3;
	public const uint8 OCR4A4;
	public const uint8 OCR4A5;
	public const uint8 OCR4A6;
	public const uint8 OCR4A7;

	public uint8 OCR4B;
	public const uint8 OCR4B0;
	public const uint8 OCR4B1;
	public const uint8 OCR4B2;
	public const uint8 OCR4B3;
	public const uint8 OCR4B4;
	public const uint8 OCR4B5;
	public const uint8 OCR4B6;
	public const uint8 OCR4B7;

	public uint8 OCR4C;
	public const uint8 OCR4C0;
	public const uint8 OCR4C1;
	public const uint8 OCR4C2;
	public const uint8 OCR4C3;
	public const uint8 OCR4C4;
	public const uint8 OCR4C5;
	public const uint8 OCR4C6;
	public const uint8 OCR4C7;

	public uint8 OCR4D;
	public const uint8 OCR4D0;
	public const uint8 OCR4D1;
	public const uint8 OCR4D2;
	public const uint8 OCR4D3;
	public const uint8 OCR4D4;
	public const uint8 OCR4D5;
	public const uint8 OCR4D6;
	public const uint8 OCR4D7;

	public uint8 DT4;
	public const uint8 DT4L0;
	public const uint8 DT4L1;
	public const uint8 DT4L2;
	public const uint8 DT4L3;
	public const uint8 DT4L4;
	public const uint8 DT4L5;
	public const uint8 DT4L6;
	public const uint8 DT4L7;

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

	public uint8 UEINTX;
	public const uint8 TXINI;
	public const uint8 STALLEDI;
	public const uint8 RXOUTI;
	public const uint8 RXSTPI;
	public const uint8 NAKOUTI;
	public const uint8 RWAL;
	public const uint8 NAKINI;
	public const uint8 FIFOCON;

	public uint8 UENUM;
	public const uint8 UENUM_0;
	public const uint8 UENUM_1;
	public const uint8 UENUM_2;

	public uint8 UERST;
	public const uint8 EPRST0;
	public const uint8 EPRST1;
	public const uint8 EPRST2;
	public const uint8 EPRST3;
	public const uint8 EPRST4;
	public const uint8 EPRST5;
	public const uint8 EPRST6;

	public uint8 UECONX;
	public const uint8 EPEN;
	public const uint8 RSTDT;
	public const uint8 STALLRQC;
	public const uint8 STALLRQ;

	public uint8 UECFG0X;
	public const uint8 EPDIR;
	public const uint8 EPTYPE0;
	public const uint8 EPTYPE1;

	public uint8 UECFG1X;
	public const uint8 ALLOC;
	public const uint8 EPBK0;
	public const uint8 EPBK1;
	public const uint8 EPSIZE0;
	public const uint8 EPSIZE1;
	public const uint8 EPSIZE2;

	public uint8 UESTA0X;
	public const uint8 NBUSYBK0;
	public const uint8 NBUSYBK1;
	public const uint8 DTSEQ0;
	public const uint8 DTSEQ1;
	public const uint8 UNDERFI;
	public const uint8 OVERFI;
	public const uint8 CFGOK;

	public uint8 UESTA1X;
	public const uint8 CURRBK0;
	public const uint8 CURRBK1;
	public const uint8 CTRLDIR;

	public uint8 UEIENX;
	public const uint8 TXINE;
	public const uint8 STALLEDE;
	public const uint8 RXOUTE;
	public const uint8 RXSTPE;
	public const uint8 NAKOUTE;
	public const uint8 NAKINE;
	public const uint8 FLERRE;

	public uint8 UEDATX;
	public const uint8 DAT0;
	public const uint8 DAT1;
	public const uint8 DAT2;
	public const uint8 DAT3;
	public const uint8 DAT4;
	public const uint8 DAT5;
	public const uint8 DAT6;
	public const uint8 DAT7;

	public uint8 UEBCX;

	public uint8 UEBCLX;
	public const uint8 BYCT0;
	public const uint8 BYCT1;
	public const uint8 BYCT2;
	public const uint8 BYCT3;
	public const uint8 BYCT4;
	public const uint8 BYCT5;
	public const uint8 BYCT6;
	public const uint8 BYCT7;

	public uint8 UEBCHX;

	public uint8 UEINT;
	public const uint8 EPINT0;
	public const uint8 EPINT1;
	public const uint8 EPINT2;
	public const uint8 EPINT3;
	public const uint8 EPINT4;
	public const uint8 EPINT5;
	public const uint8 EPINT6;

	public uint8 UPERRX;

	public uint8 UPBCLX;

	public uint8 UPBCHX;

	public uint8 UPINT;

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
