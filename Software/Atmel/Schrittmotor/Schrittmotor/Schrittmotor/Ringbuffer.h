/************************************************************************
 * \file
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief allgemeiner Ringbuffer
 * 
 ************************************************************************/
#pragma once

/************************************************************************
 * \class Ringbuffer
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief klassischer Ringbuffer
 * 
 ************************************************************************/
class Ringbuffer 
{
public:
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Groesse der Ringbuffer
 * \todo individuele Groesse ermoeglichen
 ************************************************************************/
	static const int n = 400;
	Ringbuffer(void);
	void push(char daten);
	char pop(void);
	bool isFull(void);
	bool isEmpty(void);
protected:
private:
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Der Ringbuffer Speicher
 * 
 ************************************************************************/
	char speicher[n];
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Index der Stelle, an der das naechster Zeichen geschrieben wird
 * 
 ************************************************************************/	
	int schreibePos;
/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Index der Stelle, an der das naechster Zeichen gelesen wird
 * 
 ************************************************************************/		
int lesePos;
};


