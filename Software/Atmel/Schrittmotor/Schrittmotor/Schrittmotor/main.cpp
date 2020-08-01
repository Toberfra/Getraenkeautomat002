/*
 * Schrittmotor.cpp
 *
 * Created: 30.07.2020 20:18:23
 * Author : User
 */ 

#include <avr/io.h>
#include "Schrittmotor.h"

int main(void)
{
	Schrittmotor schrittmotor;
	schrittmotor.Power(true);
	schrittmotor.Speed(1.0);
    /* Replace with your application code */
    while (1) 
    {
    }
}

