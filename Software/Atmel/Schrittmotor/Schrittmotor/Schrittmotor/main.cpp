/************************************************************************
 * \file
 * \brief Programmstart
 *
 *
 *
 ************************************************************************/
#include "Schrittmotor.h"
#include "inout.h"

/************************************************************************
 * Programmstart   
 *
 * \return errorcode
 *
 ************************************************************************/
int main(void)
{
	InOut::Init();
	Schrittmotor schrittmotor;
	schrittmotor.Power(true);
	schrittmotor.Speed(5.0);
    /* Replace with your application code */
	sei();
    while (1) 
    {
    }
}



