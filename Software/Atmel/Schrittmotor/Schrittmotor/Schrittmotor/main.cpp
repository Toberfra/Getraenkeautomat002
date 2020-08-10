/************************************************************************
 * \file
 * \brief Programmstart
 *
 *
 *
 ************************************************************************/
#include "Schrittmotor.h"
#include "inout.h"
#include "Befehle.h"

/************************************************************************
 * Programmstart   
 *
 * \return errorcode
 *
 ************************************************************************/
int main(void)
{
	InOut::Init();
	Usart0 tty(9600);
	tty.sende("Pumpe1:\r\n");
	Schrittmotor schrittmotor;

	Befehle befehle(&schrittmotor);
	//schrittmotor.Power(true);
	//schrittmotor.Speed(-4.0);
    /* Replace with your application code */
	sei();
	
    while (1) 
    {
		befehle.step();
    }
}



