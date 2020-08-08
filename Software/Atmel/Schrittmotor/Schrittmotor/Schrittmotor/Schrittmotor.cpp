/************************************************************************
* \file
* \brief Schrittmotor Ansteuerung
************************************************************************/

#include"Schrittmotor.h"
#include "inout.h"
#include "Usart0.h"
#include <math.h>

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
	beschleunigungsphaseInSekunden = 1.0;
	abbremsphaseInSekunden = 0.5;
	
	minimalSpeed = 0.01;
	maximalSpeed = 15;



}



Schrittmotor::~Schrittmotor(){
	SetSpeedFloatAutoRichtung(0UL);
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
	bool Schrittmotor::UmdrehungenOhneZeit(float umdr){
		return UmdrehungenMitZeit(umdr , 10);
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
	bool Schrittmotor::UmdrehungenMitZeit(float umdr, float zeit){
		bool ok = false;
		switch(modus){
			case powerOn:
				BerechneRampen(umdr, zeit);
				zeitSeitAnlauf = 0;
				rampeSpeedUPS = 0;
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

void Schrittmotor::SetSpeedFloatAutoRichtung(float ups){
	if(ups >= 0){
		SetRichtung(false);
		SetSpeedUL((unsigned long)(ups * (float)GetPulseProUmdrehung()));
		}else{
		SetRichtung(true);
		SetSpeedUL((unsigned long)(-ups * (float)GetPulseProUmdrehung()));
	}

}

/************************************************************************
* Angabe der Geschwindigkeit in Umdrehungen pro Sekunde
*
* \param ups Umdrehungen pro Sekunde
*
************************************************************************/

void Schrittmotor::SetSpeedFloatOhneRichtung(float ups){
	if(ups >= 0){
		SetSpeedUL((unsigned long)(ups * (float)GetPulseProUmdrehung()));
	}else{
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
	ich->zeitSeitAnlauf += sekunden;
	switch(ich->modus){
		default:
		case aus:
			break;

		case dauerhaftAn:
			ich->TickDauerhaftAn(sekunden);
			break;

		case rampeHoch:
			ich->TickRampeHoch(sekunden);
			break;

		case oben:
			ich->TickOben(sekunden);
			break;

		case rampeRunter:
			ich->TickRampeRunter(sekunden);
			break;

		case nachlauf:
			ich->TickNachlauf(sekunden);
			break;

	}
}

/************************************************************************
 * \date 08.08.2020
 * \author Frank Tobergte
 *
 * \brief Ablaufsteuerung fuer dauerhaft eingeschaltet
 * \param sekunden Abstand der Aufrufe in sekunden
 ************************************************************************/
void Schrittmotor::TickDauerhaftAn(float sekunden){
	float maxBeschleunigungLocal;
	float maxBremsenLocal;
	float delta;
	float neuUps;
	float sollUpsLocal;
	float istUpsLocal;
	bool umkr;

	istUpsLocal = istUps;
	sollUpsLocal = sollUps;

	maxBeschleunigungLocal = maxBeschleunigung * sekunden;
	maxBremsenLocal = maxBremsen * sekunden;

	if(istUpsLocal < 0)
	umkr = true;
	else
	umkr = false;

	neuUps = sollUpsLocal;
	delta = neuUps - istUpsLocal;
	if(umkr){
		if(delta <- maxBeschleunigungLocal)
		neuUps = istUpsLocal - maxBeschleunigungLocal;
		if(delta > maxBremsenLocal)
		neuUps = istUpsLocal + maxBremsenLocal;

		}else{
		if(delta > maxBeschleunigungLocal)
		neuUps = istUpsLocal + maxBeschleunigungLocal;
		if(delta < -maxBremsenLocal)
		neuUps = istUpsLocal - maxBremsenLocal;
	}
	istUpsLocal = neuUps;
	SetSpeedFloatAutoRichtung(istUpsLocal);
	istUps = istUpsLocal;
	switch(modus){
		case dauerhaftAn:
		if((istUpsLocal == 0) && (sollUpsLocal == 0)){
			modus = powerOn;
			Usart0::sende(" --> Steht\r\n>: ");
		}
		break;

		default:
		break;
	}
}

void Schrittmotor::TickRampeHoch(float sekunden){
	if(zeitSeitAnlauf < zeitBeschl){
		rampeSpeedUPS += sollUps * sekunden / zeitBeschl;
		if(rampeSpeedUPS < minimalSpeed)
			SetSpeedFloatOhneRichtung(minimalSpeed);
		else
			SetSpeedFloatOhneRichtung(rampeSpeedUPS);
	}else{
		SetSpeedFloatOhneRichtung(sollUps);
		modus = oben;
	}
}

void Schrittmotor::TickOben(float sekunden){
	if(zeitSeitAnlauf >= zeitBeschl + zeitFS)
		modus = rampeRunter;
}

void Schrittmotor::TickRampeRunter(float sekunden){
	if(zeitSeitAnlauf < zeitBeschl + zeitFS + zeitAbb){
		rampeSpeedUPS -= sollUps * sekunden / zeitAbb;
		if(rampeSpeedUPS < minimalSpeed)
			SetSpeedFloatOhneRichtung(minimalSpeed);
		else
			SetSpeedFloatOhneRichtung(rampeSpeedUPS);
		}else{
			SetSpeedFloatOhneRichtung(minimalSpeed);
			modus = nachlauf;
	}

}

void Schrittmotor::TickNachlauf(float sekunden){
	SetSpeedFloatOhneRichtung(0);
	modus = powerOn;
	Usart0::sende(" --> Steht\r\n>: ");
}

/************************************************************************
 * \date 08.08.2020
 * \author Frank Tobergte
 *
 * \brief Berechnet die Rampen zum Beschleinigen und Abbremsen
 * \param anzahl der Umdrehungen die insgesamt gemacht werden sollen
 * \param zeit die fuer die Umdrehungen mit Rampen gebraucht werden soll
 ************************************************************************/
void Schrittmotor::BerechneRampen(float anzahl, float zeit) {
	float zeitReduziert;
	if(anzahl < 0){
		InOut::Richtung(true);
		anzahl = -anzahl;
	}
	else
		InOut::Richtung(false);

	if(zeit < beschleunigungsphaseInSekunden + abbremsphaseInSekunden){
		zeitBeschl = zeit * (2.0 / 3.0);
		zeitAbb = zeit - zeitBeschl;
		//zeitReduziert = zeitBeschl / 2 + zeitAbb / 2;
		umdrBeschl = anzahl /zeit * zeitBeschl;
		umdrAbb = anzahl /zeit * zeitAbb;
		umdrFS = 0;
		zeitFS = 0;

	}else{
		zeitBeschl = beschleunigungsphaseInSekunden;
		zeitAbb = abbremsphaseInSekunden;
		zeitFS = zeit - zeitBeschl - zeitAbb;
		zeitReduziert = zeitFS + zeitBeschl / 2 + zeitAbb / 2;
		umdrFS = anzahl  * zeitFS / zeitReduziert;
		umdrBeschl = anzahl /zeitReduziert * zeitBeschl / 2;
		umdrAbb = anzahl /zeitReduziert * zeitAbb / 2;
	}






	schritteZuGehen = round(anzahl *  Schrittmotor::GetPulseProUmdrehung()) ;
	if(zeitFS > 0.0)
		sollUps = umdrFS / zeitFS;
	else
		sollUps = umdrBeschl / zeitBeschl * 2;

	if(sollUps > maximalSpeed){
		sollUps = maximalSpeed;
		umdrBeschl = sollUps * zeitBeschl / 2;
		umdrAbb = sollUps * zeitAbb / 2;
		umdrFS = anzahl - umdrBeschl - umdrAbb;
		zeitFS = umdrFS / sollUps;
	}



}