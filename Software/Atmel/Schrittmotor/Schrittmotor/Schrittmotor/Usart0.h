/************************************************************************
 * \file
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Serielle Komonikation
 * 
 ************************************************************************/
#pragma once



#include "avr/interrupt.h"
#include "Ringbuffer.h"


/************************************************************************
 * \var __INTR_ATTRS
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief __INTR_ATTRS 
 * 
 ************************************************************************/
extern "C" void USART_RX_vect(void) __attribute__ ((signal, __INTR_ATTRS));
extern "C" void USART_TX_vect(void) __attribute__ ((signal, __INTR_ATTRS));
extern "C" void USART_UDRE_vect(void) __attribute__ ((signal, __INTR_ATTRS));

/************************************************************************
 * \class Usart0
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Serielle Schnittstelle
 * 
 ************************************************************************/
class Usart0
{
	friend void USART_RX_vect(void);
	friend void USART_TX_vect(void);
	friend void USART_UDRE_vect(void);
	
	
	
public:
	Usart0();
	Usart0(long baud);
	static void init(long baud);
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Seriell empfangene Zeichen
 * 
 ************************************************************************/	
	static Ringbuffer empfangsBuffer;
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Seriell zu schreibene Zeichen
 * 
 ************************************************************************/	
	static Ringbuffer sendeBuffer;

	static bool sende(char);
	static bool sende(const char*);
	static bool isWasZuLesen(void);
	static char lesen(void);
	
protected:
private:
	static void interRx(void);
	static void interTx(void);
	static void interUdre(void);
	


};


