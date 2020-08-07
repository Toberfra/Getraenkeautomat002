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
	Usart0 tty(115000L);
	Schrittmotor schrittmotor;

	Befehle befehle((SchrittmotorInterface*)&schrittmotor);
	//schrittmotor.Power(true);
	//schrittmotor.Speed(-4.0);
    /* Replace with your application code */
	sei();
	tty.sende("Pumpe1:\r\n");
    while (1) 
    {
		befehle.step();
    }
}



