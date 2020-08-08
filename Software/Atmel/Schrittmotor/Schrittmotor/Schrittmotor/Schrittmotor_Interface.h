#pragma once
/************************************************************************
 * \file
 * \brief Vorgaben zur Schrittmotor Ansteuerung
 *
 *
 *
 ************************************************************************/

/*! \class SchrittmotorInterface
 * Ansprechen des Schrittmotors als Vorgaben
 *
 * Angaben in Umdrehungen und Umdrehungen pro Sekunde
 */

class  SchrittmotorInterface{
public:
/*!
 *	Schaltet den Strom des Schrittmotors ein bzw. aus.
 *
 *	Dadruch erfolgt noch keine Drehung des Motors.
 *
 * \param on true es fliesst Strom durch den Motor
 * \return true wenn der Befehl ausgefuehrt werden konnte.
 */
	virtual bool Power(bool on) = 0;
	
/*!
 *  Schaltet den Motor dauerhaft mit der gewaehlten Drehzahl ein
 *
 * \param ups Umdrehungen pro Sekunde
 * \return true wenn der Befehl ausgefuehrt werden konnte.
 */	

	virtual bool Speed(float ups) = 0;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schaltet den Motor fuer eine angegeben Anzahl an Umdrehungen ein
 * \param umdr Anzahl der Umdrehungen
 * \return = true wenn der Befehl ausgefuehr wurde
 ************************************************************************/	
	virtual bool Umdrehungen(float umdr) = 0;
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schaltet den Motor fuer eine angegeben Anzahl an Umdrehungen 
 * in einer angegebenen Zeit ein.
 * \param umdr Anzahl der Umdrehungen
 * \param zeit die fuer die Umdrehungen vorgesehen ist
 * \return = true wenn der Befehl ausgefuehr wurde
 ************************************************************************/	
virtual bool Umdrehungen(float umdr, float zeit) = 0;
};
	
	