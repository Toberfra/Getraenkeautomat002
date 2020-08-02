/************************************************************************
 * \file
 * \brief Schrittmotor Ansteuerung
************************************************************************/ 
#include "Schrittmotor_Interface.h"


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
	static void Tick(float sekunden);
	
/************************************************************************
 *  Unterschiedliche Betriebsarten  
 *
 *
 *
 ************************************************************************/
	enum modus_enum{
		aus,		///< Strom durch den Motor Abgeschaltet
		powerOn,	///< Strom durch den Motor Eingeschaltet aber keine Drehung
		dauerhaftAn ///< Motor dreht dauerhaft mit der gewaehlten Drehzal
		};
	
protected:
	unsigned int GetMotorPulseProUmdrehung(void);
	void SetMotorPulseProUmdrehung(unsigned int mppu);

	unsigned int GetMicroSteppingPulse(void);
	void SetMicroSteppingPulse(unsigned int msp);
	
	unsigned long GetPulseProUmdrehung(void);
	
	
	
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
		
	void SetSpeedFloat(float ups);
	void SetSpeedUL(unsigned long pps);
	void SetRichtung(bool umkr);
		
	
	
};