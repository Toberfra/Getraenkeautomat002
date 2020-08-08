/************************************************************************
 * \file
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Serielle Befehle
 * 
 ************************************************************************/

#include "Usart0.h"
#include "Schrittmotor_Interface.h"
/************************************************************************
 * \class Befehle
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief 
 * 
 ************************************************************************/
class Befehle
{
public:
	Befehle();
	Befehle(SchrittmotorInterface*);
	~Befehle();
	
	void init(SchrittmotorInterface*);
	
	void step(void);
	
/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Aufzaehlung der Zustaende der FSM
 * 
 ************************************************************************/
	enum stepStepsEnum{
		INIT,	
		WARTE,
		LESE,
		AUSWERTEN
		
	};
	
	
protected:
	
private:
/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zugriff auf eine Instanz der Seriellen Schnittstelle
 * 
 ************************************************************************/
	Usart0 uart;
	void lesen(void);
/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schritte der FSM
 * 
 ************************************************************************/	
	stepStepsEnum steps;
/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der Zeichen, die in einer Zeile stehen duerfen.
 * 
 ************************************************************************/	
	static const int leseBufferLaenge = 64;
/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Der Lese Buffer
 * 
 ************************************************************************/
	char leseBuffer[leseBufferLaenge];
/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Position n der in den Lese Buffer geschrieben wird
 * 
 ************************************************************************/
	int schreibPosLeseBuffer;
	
	bool auswerten(char*);
/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Maximale Anzahl der durch Leerzeichen getrennten Objekte in einer Zeile
 * 
 ************************************************************************/	
	static const int anfaengeAnzahl = 10;	
/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zeiger auf die einzelnen Objekte in der Zeile
 * 
 ************************************************************************/
	char *anfaenge[anfaengeAnzahl];
/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Anzahl der gefundenen Objekte in einer Zeile
 * 
 ************************************************************************/
	int anfaengeZaehler;
	void anfaengeFinden(void);
	
	bool befehlUps(void);
	//bool befehlPps(void);
	bool befehlUmdr(void);
	//bool befehlStopp(void);
	bool befehlPower(void);

/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zeiger auf die Motor Interface Instanze, in der aber eine eine vererbte Klasse liegt.
 * 
 ************************************************************************/ 
	SchrittmotorInterface *motor;
	
	void schreibePrompt(bool);
};