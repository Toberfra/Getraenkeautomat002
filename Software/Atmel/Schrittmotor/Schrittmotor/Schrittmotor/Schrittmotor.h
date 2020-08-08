#pragma once

/************************************************************************
 * \file
 * \brief Schrittmotor Ansteuerung
************************************************************************/ 
#include "Schrittmotor_Interface.h"

/************************************************************************
 * \page SchrittmotorModi Schrittmotor Modi
 * \date 03.08.2020   
 * \author Frank Tobergte
 * \see Schrittmotor::modus_enum
 * \brief 
 *  \dot
 *  digraph example {
 *      node [shape=record, fontname=Helvetica, fontsize=10];
 *      edge [fontname=Helvetica, fontsize=10];
 *      
 *      subgraph clusterAus{
 *		aus[style=filled, fillcolor=red, fontcolor=yellow]; 
 *		powerOn[style=filled, fillcolor=yellow];
 *		}
 *		
 *		subgraph clusterDrehzahl{
 *		dauerhaftAn[style=filled, fillcolor=green];
 *		}
 *
 *		subgraph clusterUmdrehungen{
 *		rampeHoch;
 *		oben;
 *		rampeRunter;
 *		nachlauf;
 *		}
 *		
 *		aus -> powerOn[label="InOut::Power(true)", URL="\ref InOut::Power"];
 *		powerOn -> aus[label="InOut::Power(false)", URL="\ref InOut::Power"];
 *		
 *		powerOn -> dauerhaftAn[label="InOut::Speed(!=0)", URL="\ref InOut::Speed"];
 *		dauerhaftAn -> powerOn[label="InOut::Speed(0)", URL="\ref InOut::Speed"];
 *		
 *		powerOn -> rampeHoch;
 *		rampeHoch -> oben;
 *		oben -> rampeRunter;
 *		rampeRunter -> nachlauf;
 *		nachlauf -> powerOn;
 *  }
 *  \enddot
 ************************************************************************/




/************************************************************************
 * \class Schrittmotor
 * Ansprechen des Schrittmotors 
 *
 * Angaben in Umdrehungen und Umdrehungen pro Sekunde
************************************************************************/

class Schrittmotor : SchrittmotorInterface{
public:
	Schrittmotor();
	~Schrittmotor();
	bool Power(bool on);
	bool Speed(float ups);
	bool UmdrehungenOhneZeit(float umdr);
	bool UmdrehungenMitZeit(float umdr, float zeit);
	static void Tick(float sekunden);
	void TickDauerhaftAn(float sekunden);
	void TickRampeHoch(float sekkunden);
	void TickOben(float sekkunden);
	void TickRampeRunter(float sekkunden);
	void TickNachlauf(float sekkunden);

	
/************************************************************************
 *  Unterschiedliche Betriebsarten  
 *
 *
 *
 ************************************************************************/
	enum modus_enum{
		aus,			///< Strom durch den Motor Abgeschaltet
		powerOn,		///< Strom durch den Motor Eingeschaltet aber keine Drehung
		dauerhaftAn,	///< Motor dreht dauerhaft mit der gewaehlten Drehzal
		rampeHoch,		///< Motor wird ueber eine Rampe auf Drehzahl gebracht
		oben,			///< Motor wird mit konstannter Drehzahl betrieben
		rampeRunter,	///< Motor wird ueber eine Rampe auf nachlauf Drehzahl heruntergefahren
		nachlauf		///< Motor dreht mit langsammer Drehzahl bis die genaue Anzahl der Pulse erreicht ist.
		};
	
protected:
	unsigned int GetMotorPulseProUmdrehung(void);
	void SetMotorPulseProUmdrehung(unsigned int mppu);

	unsigned int GetMicroSteppingPulse(void);
	void SetMicroSteppingPulse(unsigned int msp);
	
	unsigned long GetPulseProUmdrehung(void);
	
	void BerechneRampen(float anzahl, float zeit);
	
private:	
/************************************************************************
 * Anzahl der Pulse pro Umdrehung die der Schrittmotor ohne micro steeping hat 
 *
 * \todo Sollte im EEProm gespeichert werden                                                                     
 ************************************************************************/
	unsigned int motorPulseProUmdrehung;
	
/************************************************************************
 * Anzahl der Pulse die durch Microstepping hinzu kommen.
 *
 * Faktor um den die Hardware Aufloesung des Schrittmotors erhoeht wird.
 * \todo Sollte im EEProm gespeichert werden  
 ************************************************************************/
	unsigned int microstepPulse;
	
/************************************************************************
 * Gewuenschte Betriebsart.   
 ************************************************************************/
	modus_enum modus;
	
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief gewuenschte Gewschwindigkeit in Umdrehungen pro Sekunde
 * 
 ************************************************************************/	
	float sollUps;
	
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Ist Geschwindigkeit in Umdrehungen pro Sekunde
 * 
 ************************************************************************/	
	float istUps;
	
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zugiff moeglichkeit fuer static auf eine Instanz
 * 
 ************************************************************************/
	static Schrittmotor* ich;
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Maximal zulaessige Beschleunigung fuer den Motor
 * 
 * gemessen in Aenderung der Umdrehungen pro Sekunde pro Sekunde
 * \todo Sollte im EEProm gespeichert werden
 ************************************************************************/	
	float maxBeschleunigung;
	
/************************************************************************
 * \date 01.08.2020   
 * \author Frank Tobergte
 *
 * \brief Maximal zulaessige Bremsung fuer den Motor
 *
 * gemessen in Aenderung der Umdrehungen pro Sekunde pro Sekunde
 * \todo Sollte im EEProm gespeichert werden
 ************************************************************************/	
	float maxBremsen;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der Sekunden die gebremst werden soll.
 * 
 ************************************************************************/	
	float abbremsphaseInSekunden;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der Sekunden die Beschleunigt werden soll
 * 
 ************************************************************************/
	float beschleunigungsphaseInSekunden;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zeit in Sekunden die zwischen Beschleunigung und Abbremsen mit 
 * voller Geschwindigkeit gefahren wird
 * 
 ************************************************************************/
	float zeitFS;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zeit in Sekunden die beschleunigt wird.
 * 
 ************************************************************************/
	float zeitBeschl;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zeit in Sekunden die abgebremmst wird.
 * 
 ************************************************************************/
	float zeitAbb;

/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der Undrehungen die beschleunigt wird.
 * 
 ************************************************************************/
	float umdrBeschl;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der Umdrehungen die gebremmst wird.
 * 
 ************************************************************************/
	float umdrAbb;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der Umdrehungen zwischen beschleunigen und abbremsen
 * 
 ************************************************************************/
	float umdrFS;
	
	float rampeSpeedUPS;
	
	float zeitSeitAnlauf;
	
	float minimalSpeed;
	
	float maximalSpeed;
	
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der Pulse die insgesamt gefahren werden
 * 
 ************************************************************************/
	unsigned long schritteZuGehen;
		
	void SetSpeedFloatAutoRichtung(float ups);
	void SetSpeedFloatOhneRichtung(float ups);
	void SetSpeedUL(unsigned long pps);
	void SetRichtung(bool umkr);
		
	
	
};