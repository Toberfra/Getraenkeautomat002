#pragma once

#include <avr/interrupt.h>

/************************************************************************
 * \file   
 * \brief Ansprechen der Hardware
 ************************************************************************/

/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Test
 * 
 ************************************************************************/
extern "C" void TIMER2_COMPA_vect(void) __attribute__ ((signal, __INTR_ATTRS));

/************************************************************************
 * Ansprechen der Hardware  
 *
 *
 *
 ************************************************************************/
class InOut{
friend void TIMER2_COMPA_vect(void);
	
public:
	static void Init(void);
	static void Power(bool on);   
	static void Richtung(bool umkr);
	static void Speed(unsigned long pps);                                                                                                                                

protected:
	static void initTimer2(void);
	static void interTimer2(float Sekunden);

private:
	static void timer0Off(void);
	static void timer0On(void);
	static void timer0Prescaler(unsigned char prescaler);
};

/************************************************************************
 * \var __INTR_ATTRS
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief __INTR_ATTRS 
 * 
 ************************************************************************/