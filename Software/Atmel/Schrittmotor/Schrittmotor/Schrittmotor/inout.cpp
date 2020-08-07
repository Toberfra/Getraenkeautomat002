#include "inout.h"
#include "Schrittmotor.h"
#include <avr/io.h>
#include <math.h>


/************************************************************************
 * \file   
 * \brief Ansprechen der Hardware
 ************************************************************************/

/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Interrupt Einsprung
 * 
 ************************************************************************/
void TIMER2_COMPA_vect(void){
	InOut::interTimer2(0.010048f);
}

/************************************************************************
 * Initialisiert die Hardware
  ************************************************************************/
void InOut::Init(){
	DDRB |= (1<<DDB5) | (1<<DDB1);
	DDRD |= (1 << 2) | (1 << 3) |(1 << DDD6);
	PORTB |= 1<<PORTB5;
	PORTD &= ~ (1 << PORTD6);
	PORTD |= (1<<2);
	initTimer2();
}
	
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Timer2 10msec Takt Initialisierung
 * 
 ************************************************************************/
void InOut::initTimer2(void){
	
	TCCR2A = (0<<COM2A1) | (0<<COM2A0) | // No port operation
	(1<<WGM21) | (0<<WGM20);			 // CTC
	
	TCCR2B = (0<<WGM22) |				 // CTC
	(1<<CS22) | (1<<CS21) | (1<<CS20);	 // Prescaler 1024
	
	OCR2A = 156; // ca 100Hz
	TIMSK2 = 0b010;		//OCIE2A: Timer/Counter2 Output Compare Match A Interrupt Enable

}
/************************************************************************
 * Schaltet den Motortreiber   
 *
 * \param on true = Strom an
 *
 ************************************************************************/
void InOut::Power(bool on){
	if(on)
		PORTD &=~ (1<<2);
	else
		PORTD |= (1<<2);
	
}
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Angabe der Drehrichtung
 * \param umkr true = andere Drehrichtung
 ************************************************************************/
void InOut::Richtung(bool umkr){
	if(!umkr)
		PORTD &=~ (1<<3);
	else
		PORTD |= (1<<3);	
}

/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Motor Geschwindigkeit setzen
 * \param pps Anzahl der Motor Pulse pro Sekunde
 ************************************************************************/

void InOut::Speed(unsigned long pps){
	if(pps){
		unsigned int grob = 1;
		float takte = round(16e6 / 2 / pps);
		if(takte > 0xffff)
		takte = 0xffff;
		unsigned int fein = takte;
		if (fein > 255)
		{
			grob++;
			fein >>= 3;
		}
		
		if (fein > 255)
		{
			grob++;
			fein >>= 3;
		}
		
		if (fein > 255)
		{
			grob++;
			fein >>= 2;
		}
		
		if (fein > 255)
		{
			grob++;
			fein >>= 2;
		}
			
		
		if(fein <= 255){
			OCR0A = fein;
			timer0Prescaler(grob);
		}else{
			OCR0A = 255;
			timer0Prescaler(5);
		}

			
	}else{
		timer0Off();
	}
	
}
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schaltet die Pulse von Timer 0 ab.
 * 
 ************************************************************************/
void InOut::timer0Off(){
	TCCR0A = (0<<COM0A1) | (0<<COM0A0) | // Normal port operation, OC0A disconnected
	(0<<WGM01) | (0<<WGM00);			 // Normal
	
	TCCR0B = (0<<WGM02) |				 // Normal
	(0<<CS02) | (0<<CS01) | (0<<CS00);	 // Takt aus
	
	PORTD &= ~(1<<PORTD6);
}
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schaltet den Timer 0 ein.
 * \remark wir auch von timer0Prescaler() gemacht
 ************************************************************************/
void InOut::timer0On(void){
	TCCR0A = (0<<COM0A1) | (1<<COM0A0) | // Toggle OC0A on Compare Match
	(1<<WGM01) | (0<<WGM00);			 // CTC
}

/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Setzt den Prscaler von Timer 0 auf den gewuenschten Faktor
 * \param prescaler der Faktor dicht des Register Wert
 ************************************************************************/
void InOut::timer0Prescaler(unsigned char prescaler){
	prescaler &= 0x7;
	TCCR0A = (0<<COM0A1) | (1<<COM0A0) | // Toggle OC0A on Compare Match
	(1<<WGM01) | (0<<WGM00);			 // CTC
	
	TCCR0B = (0<<WGM02) |				 // CTC
	(prescaler<<CS00);	 // Prescaler
}



/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Verarbeitung 10 msec Interrupt Timer2 
 * \param Sekunden Abstand der Aufrufe
 ************************************************************************/
void InOut::interTimer2(float Sekunden){
	Schrittmotor::Tick(Sekunden);
}
