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
 * Anzahl der Pulse die durch Microstepping hin zu kommt.
 *
 * \todo Sollte im EEProm gespeichert werden                                                                     
 ************************************************************************/
	unsigned int microstepPulse;
	
	modus_enum modus;
	
	void SetSpeed(float ups);
	void SetSpeed(unsigned long pps);
	void SetRichtung(bool umkr);
		
	
	
};