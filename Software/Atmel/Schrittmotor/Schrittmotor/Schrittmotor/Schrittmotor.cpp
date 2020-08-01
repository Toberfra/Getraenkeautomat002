/************************************************************************
 * \file
 * \brief Schrittmotor Ansteuerung
************************************************************************/

#include"Schrittmotor.h"

Schrittmotor::Schrittmotor(){
	motorPulseProUmdrehung = 200;
	microstepPulse = 32;
	modus = aus;	
}



Schrittmotor::~Schrittmotor(){
	SetSpeed(0UL);
}

/************************************************************************
 *	Schaltet den Strom des Schrittmotors ein bzw. aus.
 *
 *	Dadruch erfolgt noch keine Drehung des Motors.
 *
 * \param on true es fliesst Strom durch den Motor
 * \return true wenn der Befehl ausgefuehrt werden konnte.
************************************************************************/

bool Schrittmotor::Power(bool on){
	bool ok = false;
	if(on){
		if(modus == aus)
			modus = powerOn;
		ok = true;	
	}else{
		if(modus == powerOn){
			modus = aus;
			ok = true;
		}
	}
	
	return ok;
}


/************************************************************************
 *  Schaltet den Motor dauerhaft mit der gewaehlten Drehzahl ein
 *
 * \param ups Umdrehungen pro Sekunde
 * \return true wenn der Befehl ausgefuehrt werden konnte.
************************************************************************/
	
bool Schrittmotor::Speed(float ups){
	return true;
}



/************************************************************************
* Angabe der Geschwindigkeit in Umdrehungen pro Sekunde
*
* \param ups Umdrehungen pro Sekunde
*
* Bei Negativer ups wird die Drehrichung invertiert  
************************************************************************/

void Schrittmotor::SetSpeed(float ups){
	
}

/************************************************************************
 * Angabe der Geschwindigkeit in Takte pro Sekunde
 *
 * \param pps Pulse pro Sekunde
************************************************************************/
void Schrittmotor::SetSpeed(unsigned long pps){
	
}

/************************************************************************
 * Angabe der Drehrichtung
 *	\param umkr true = Umgekehrte Drehrichtung
************************************************************************/
void Schrittmotor::SetRichtung(bool umkr){
	
}

/************************************************************************
 *  Anzahl der Pulse pro Umdrehung die der Schrittmotor ohne micro steeping hat
 *
 * \return Hardware Schritte des Mototrs                                                                   
 ************************************************************************/
unsigned int Schrittmotor::GetMotorPulseProUmdrehung(){
	return motorPulseProUmdrehung;	
}

/************************************************************************
 * Anzahl der Pulse pro Umdrehung die der Schrittmotor ohne micro steeping hat
 *
 * \param mppu Hardware Schritte des Mototrs                                                                    
 ************************************************************************/	
void Schrittmotor::SetMotorPulseProUmdrehung(unsigned int mppu){
	motorPulseProUmdrehung = mppu;
}

/************************************************************************
 * Lesen der Micro Steps Konfiguration   
 *
 * \return micro steps
 *
 ************************************************************************/
unsigned int Schrittmotor::GetMicroSteppingPulse(){
	return microstepPulse;	
}

/************************************************************************
 * Schreiben der Micro Steps Konfiguration   
 *
 * \param msp micro Steps 
 * 
 ************************************************************************/
void Schrittmotor::SetMicroSteppingPulse(unsigned int msp){
	microstepPulse = msp;
}

/************************************************************************
 * Lesen der Multiplikation der Motor Pulse und des mirco tsteppings.   
 *
 * \return Gesamt Pulse pro Umdrehung 
 *
 ************************************************************************/
unsigned long Schrittmotor::GetPulseProUmdrehung(){
	return (unsigned long)microstepPulse * (unsigned long)motorPulseProUmdrehung;
}