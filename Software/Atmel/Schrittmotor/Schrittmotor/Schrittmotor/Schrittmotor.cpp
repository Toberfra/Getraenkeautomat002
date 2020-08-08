/************************************************************************
* \file
* \brief Schrittmotor Ansteuerung
************************************************************************/

#include"Schrittmotor.h"
#include "inout.h"
#include "Usart0.h"

Schrittmotor *Schrittmotor::ich = 0;

Schrittmotor::Schrittmotor(){
	ich = this;
	motorPulseProUmdrehung = 200;
	microstepPulse = 32;
	modus = aus;
	maxBeschleunigung = 15.0f;
	maxBremsen = 30.0f;
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

	switch(modus){
		case aus:
		if(on){
			modus = powerOn;
			InOut::Power(true);
		}
		ok = true;
		break;

		case powerOn:
		if(!on){
			modus = aus;
			InOut::Power(false);
		}
		ok = true;
		break;

		default:
		ok = false;
		break;
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
	bool ok = false;
	switch(modus){
		case powerOn:
		case dauerhaftAn:
		sollUps = ups;
		ok = true;
		modus = dauerhaftAn;
		break;
		
		default:
		break;
	}
	return ok;
}
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schaltet den Motor fuer eine angegeben Anzahl an Umdrehungen ein
 * \param umdr Anzahl der Umdrehungen
 * \return = true wenn der Befehl ausgefuehrt wurde
 ************************************************************************/
	bool Schrittmotor::Umdrehungen(float umdr){
		return Umdrehungen(umdr , 10);
	}
	
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schaltet den Motor fuer eine angegeben Anzahl an Umdrehungen 
 * in einer angegebenen Zeit ein.
 * \param umdr Anzahl der Umdrehungen
 * \param zeit die fuer die Umdrehungen vorgesehen ist
 * \return = true wenn der Befehl ausgefuehrt wurde
 ************************************************************************/
	bool Schrittmotor::Umdrehungen(float umdr, float zeit){
		bool ok = false;
		switch(modus){
			case powerOn:
			//sollUps = ups;
			ok = true;
			modus = rampeHoch;
			break;
				
			default:
			break;
		}
		return ok;
	}

/************************************************************************
* Angabe der Geschwindigkeit in Umdrehungen pro Sekunde
*
* \param ups Umdrehungen pro Sekunde
*
* Bei Negativer ups wird die Drehrichung invertiert
************************************************************************/

void Schrittmotor::SetSpeedFloat(float ups){
	if(ups >= 0){
		SetRichtung(false);
		SetSpeedUL((unsigned long)(ups * (float)GetPulseProUmdrehung()));
		}else{
		SetRichtung(true);
		SetSpeedUL((unsigned long)(-ups * (float)GetPulseProUmdrehung()));
	}

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
	InOut::Richtung(umkr);
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
	float sollUps;
	float istUps;
	bool umkr;

	istUps = ich->istUps;
	sollUps = ich->sollUps;

	maxBeschleunigungLocal = ich->maxBeschleunigung * sekunden;
	maxBremsenLocal = ich->maxBremsen * sekunden;

	if(istUps < 0)
	umkr = true;
	else
	umkr = false;

	neuUps = sollUps;
	delta = neuUps - istUps;
	if(umkr){
		if(delta <- maxBeschleunigungLocal)
		neuUps = istUps - maxBeschleunigungLocal;
		if(delta > maxBremsenLocal)
		neuUps = istUps + maxBremsenLocal;

		}else{
		if(delta > maxBeschleunigungLocal)
		neuUps = istUps + maxBeschleunigungLocal;
		if(delta < -maxBremsenLocal)
		neuUps = istUps - maxBremsenLocal;
	}
	istUps = neuUps;
	ich->SetSpeedFloat(istUps);
	ich->istUps = istUps;
	switch(ich->modus){
		case dauerhaftAn:
		if((istUps == 0) && (sollUps == 0)){
			ich->modus = powerOn;
			Usart0::sende(" --> Steht\r\n>: ");
		}
		break;
		default:
		break;
	}
}

