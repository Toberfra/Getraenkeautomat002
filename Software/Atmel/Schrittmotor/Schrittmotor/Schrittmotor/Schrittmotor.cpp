/************************************************************************
 * \file
 * \brief Schrittmotor Ansteuerung
************************************************************************/

#include"Schrittmotor.h"
#include "inout.h"

Schrittmotor *Schrittmotor::ich = 0;

Schrittmotor::Schrittmotor(){
	ich = this;
	motorPulseProUmdrehung = 200;
	microstepPulse = 32;
	modus = aus;
	maxBeschleunigung = 5.0f;
	maxBremsen = 5.0f;
	istUps = 0.0f;
	sollUps = 0.0f;
	
	
		
}



Schrittmotor::~Schrittmotor(){
	SetSpeedFloat(0UL);
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
		if(modus == aus){
			modus = powerOn;
			InOut::Power(true);
		}
		ok = true;	
	}else{
		if(modus == powerOn){
			modus = aus;
			InOut::Power(false);
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
	sollUps = ups;
	return true;
}



/************************************************************************
* Angabe der Geschwindigkeit in Umdrehungen pro Sekunde
*
* \param ups Umdrehungen pro Sekunde
*
* Bei Negativer ups wird die Drehrichung invertiert  
************************************************************************/

void Schrittmotor::SetSpeedFloat(float ups){
	SetSpeedUL((unsigned long)(ups * (float)GetPulseProUmdrehung()));
	
}

/************************************************************************
 * Angabe der Geschwindigkeit in Takte pro Sekunde
 *
 * \param pps Pulse pro Sekunde
************************************************************************/
void Schrittmotor::SetSpeedUL(unsigned long pps){
	InOut::Speed(pps);	
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
 * Lesen der Multiplikation der Motor Pulse und des micro stepping.   
 *
 * \return Gesamt Pulse pro Umdrehung 
 *
 ************************************************************************/
unsigned long Schrittmotor::GetPulseProUmdrehung(){
	return (unsigned long)microstepPulse * (unsigned long)motorPulseProUmdrehung;
}

/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief 10 msec Tick
 * \param sekunden Abstand der Aufrufe in sekunden
 ************************************************************************/
void Schrittmotor::Tick(float sekunden){
	float maxBeschleunigungLocal;
	float maxBremsenLocal;
	float delta;
	float neuUps;
	
	maxBeschleunigungLocal = ich->maxBeschleunigung * sekunden;
	maxBremsenLocal = ich->maxBremsen * sekunden;
	
	neuUps = ich->sollUps;
	delta = neuUps - ich->istUps;	
	
	if(delta > maxBeschleunigungLocal)
		neuUps = ich->istUps + maxBeschleunigungLocal;
	if(delta < maxBremsenLocal)
		neuUps = ich->istUps - maxBremsenLocal;
		
	ich->istUps = neuUps;
	ich->SetSpeedFloat(ich->istUps);	
}
