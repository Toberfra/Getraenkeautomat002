/************************************************************************
 * \file
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Serielle Komonlkation
 * 
 ************************************************************************/

#include <avr/io.h>
#include "Usart0.h"


Ringbuffer Usart0::empfangsBuffer;
Ringbuffer Usart0::sendeBuffer;


Usart0::Usart0(){
	
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Konstruktur mit angabe der Baudrate
 * \param baud Baud
 ************************************************************************/
Usart0::Usart0(long baud){
	Usart0::init(baud);
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Angabe der Bits pro Sekunde
 * \param baud Baud
 ************************************************************************/
void Usart0::init(long baud){
	bool fast = false;
	int ubr0Fast = 16e6 / 8 / baud;
	int ubr0Slow = 16e6 / 16 / baud;
	
	if(ubr0Slow & 1)
		fast = true;
	if(fast)
		UCSR0A = 1 << U2X0;
	else
		UCSR0A = 0 << U2X0;
		
	UCSR0B =  (1 << RXEN0) //: Receiver Enable 
			| (1 << TXEN0) //: Transmitter Enable
			| (0 << UCSZ02) // 5 bis 8 bits
			| (1 << RXCIE0);
	UCSR0C =  (1 << UPM01) | (0 << UPM00) // Parity Even
			| ((8-5) << UCSZ00);
			
	if(fast)
		UBRR0 = ubr0Fast;
	else
		UBRR0 = ubr0Slow;
		
			 
}

/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Ein einzelnes Zeichen zum Seriell Senden in den Buffer schreiben
 * \param zeichen das zu sendene Zeichen
 * \return true alles ok
 ************************************************************************/
bool Usart0::sende(char zeichen){
	if(sendeBuffer.isFull())
		return false;
	sendeBuffer.push(zeichen);
	UCSR0B |= 1 << UDRIE0;
	return true;
		
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Einen String zum Seriell Senden in den Buffer schreiben
 * \param daten der zu sendene String
 * \return true alles ok
 ************************************************************************/
bool Usart0::sende(const char *daten){
	while(*daten){
		sende(*daten);
		daten++;
	}

	return true;
}


/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Abfrage ob was zu lesen im Empfangsbuffer steht
 * \return true was zu lesen vorhanden
 ************************************************************************/
bool Usart0::isWasZuLesen(){
	return ! empfangsBuffer.isEmpty();
}


/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief ein Zeichen aus dem Empfangsbuffer holen
 * \return Das Zeichen
 ************************************************************************/
char Usart0::lesen(){
	return empfangsBuffer.pop();
	UCSR0B |= 1 << RXCIE0;
}

/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Interrupt das Daten in die Usart geschrieben werden können
 * 
 ************************************************************************/
void Usart0::interUdre(){
	if(Usart0::sendeBuffer.isEmpty()){
		UCSR0B &= ~(1 << UDRIE0);
	}else{
		UDR0 = Usart0::sendeBuffer.pop();
	}

}

/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Interrupt das ein Daten aus der Usart abgeholt werden können
 * 
 ************************************************************************/
void Usart0::interRx(){
	
	//PINB = 1<<5;
	
	if(empfangsBuffer.isFull()){
		UCSR0B &= ~(1 << RXCIE0);
	}else{
		char zeichen;
		zeichen = UDR0;
		empfangsBuffer.push(zeichen);
		if(zeichen >= ' ')
			sende(zeichen);
	}
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Interrupt das alle Daten aus der Usart gesendet wurden
 * \remark wird zur Zeit nicht verwendet
 ************************************************************************/
void Usart0::interTx(){
	
}





/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Interrupt in Klasse
 * 
 ************************************************************************/
void USART_RX_vect(void){
	Usart0::interRx();
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Interrupt in Klasse
 * 
 ************************************************************************/
void USART_TX_vect(void){
	Usart0::interTx();
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Interrupt in Klasse
 * 
 ************************************************************************/ 
void USART_UDRE_vect(void){
	Usart0::interUdre();
}

