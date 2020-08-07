/************************************************************************
 * \file
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief allgemeiner Ringbuffer
 * 
 ************************************************************************/
#include "Ringbuffer.h"

/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief 
 * 
 ************************************************************************/
Ringbuffer::Ringbuffer(void){
	schreibePos = 0;
	lesePos = 0;
}

/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Abfrage ob noch Zeichen im Buffer sind
 * \return true = keine Zeichen mehr im Buffer
 ************************************************************************/
bool Ringbuffer::isEmpty(void){
	if(schreibePos == lesePos)
		return true;
	return false;	
}

/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Abfrage ob Buffer Voll
 * \return true = kein Platz fuer weitere Zeichen
 ************************************************************************/
bool Ringbuffer::isFull(void){
	int tempSchreibePos = schreibePos;
	tempSchreibePos++;
	tempSchreibePos %= n;
	if(tempSchreibePos == lesePos)
		return true;
	return false;	
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief  Ein Zeichen in den Buffer legen
 * \param daten Das Zeichen, welches in den Buffer gelegt wird
 ************************************************************************/
void Ringbuffer::push(char daten){
	if(!isFull()){
		speicher[schreibePos] = daten;
		schreibePos++;
		schreibePos %= n;
	}
}
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Ein Zeichen aus den Buffer holen
 * \return 0 wenn kein Zeichen mehr vorhanden
 ************************************************************************/
char Ringbuffer::pop(void){
	char ausgabe = 0;
	if(!isEmpty()){
		ausgabe = speicher[lesePos];
		lesePos++;
		lesePos %= n;
	}
	return ausgabe;
	
}
