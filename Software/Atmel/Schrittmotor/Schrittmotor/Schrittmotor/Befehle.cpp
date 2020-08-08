/************************************************************************
 * \file
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Serielle Befehle
 * 
 ************************************************************************/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#include "Befehle.h"
#include "Usart0.h"





Befehle::Befehle(){
	steps = INIT ;
	schreibPosLeseBuffer = 0;
	leseBuffer[0] = 0;
	
}
/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Konstruktor mit uebergabe des Motors.
 * \param motor der angesteuert wird.
 ************************************************************************/
Befehle::Befehle(Schrittmotor* motor){
	Befehle();
	init(motor);
}

Befehle::~Befehle(){
	
};

/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Initzialisierumg
 * \param motor der angesteuert wird.
 ************************************************************************/
void Befehle::init(Schrittmotor* motor){
	this->motor = motor;
	schreibePrompt(true);
}

/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Auswertung der empfangenen Zeichen
 * 
 ************************************************************************/
void Befehle::step(void){
	lesen();	
}
/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief Zeichen sammeln bis eine Zeile komplett ist
 * 
 ************************************************************************/
void Befehle::lesen(void){
	
	switch (steps)
	{
		default:
		case INIT:
			steps = WARTE;
			schreibPosLeseBuffer = 0;		
			break;
	
		case WARTE:
			while(uart.isWasZuLesen())
			{
				char zeichen;
				zeichen = uart.lesen();
				if((zeichen != '\r') && (zeichen != '\n')){
					leseBuffer[schreibPosLeseBuffer++] = zeichen;
					steps = LESE;
					break;
				}
			}
			break;	
		
		case LESE:
			while(uart.isWasZuLesen())
			{
				char zeichen;
				zeichen = uart.lesen();
				if((zeichen == '\r') || (zeichen == '\n')){
					steps = AUSWERTEN;
					leseBuffer[schreibPosLeseBuffer] = 0 ;
					break;
				}
				leseBuffer[schreibPosLeseBuffer++] = zeichen;
			}
			break;
			
		case AUSWERTEN:
			auswerten(leseBuffer);
			steps = INIT;
			break;
	}
}

/************************************************************************
 * \date 05.08.2020   
 * \author Frank Tobergte
 *
 * \brief In der Zeile nach Befehlen suchen
 * \param text der ausgewertet wird
 * \return true = Befehl konnte verarbeitet werden
 ************************************************************************/
bool Befehle::auswerten(char* text){

	bool ok = false;
	anfaengeFinden();
	
	if(strcmp(anfaenge[0],"ups") == 0)
		ok = befehlUps();
/*
	else if(strcmp(anfaenge[0],"pps") == 0)
		ok = befehlPps();
*/		
	else if(strcmp(anfaenge[0],"umdr") == 0)
	ok = befehlUmdr();
/*	
	else if(strcmp(anfaenge[0],"stopp") == 0)
	ok = befehlStopp();

	else if(strcmp(anfaenge[0],"stop") == 0)
	ok = befehlStopp();
*/	
	else if(strcmp(anfaenge[0],"power") == 0)
	ok = befehlPower();
	

	schreibePrompt(ok);
	
	return true;	
}


/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Durchsucht den leseBuffer nach einzelnen Objekten
 * 
 ************************************************************************/
void Befehle::anfaengeFinden(void){
	int i;
	bool pause = false;
	bool trennzeichen = true;
	char *aktZeichen;

	anfaengeZaehler = 0;
	for(i = 0 ; i < anfaengeAnzahl ; i++)
		anfaenge[i] = 0;
		
		
	aktZeichen = leseBuffer;
	for(i = 0 ; i < leseBufferLaenge ; i++ , aktZeichen++){
		if(*aktZeichen == 0)
			break;		
		if(*aktZeichen == '\"'){
			pause = !pause;
			*aktZeichen = 0;
		}
		else if(pause){
			if(trennzeichen){
				anfaenge[anfaengeZaehler++] = aktZeichen;
				trennzeichen = false;
			}
		}else{
				
			if(*aktZeichen == ' '){
				trennzeichen = true;
				*aktZeichen = 0;
			}else{
				if(trennzeichen){
					anfaenge[anfaengeZaehler++] = aktZeichen;
					trennzeichen = false;
				}	
			}
			
			
		}
		
	}
};

/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Wertet den Befehl "ups" aus
 * \return true = Befehl konnte verarbeitet werden.
 ************************************************************************/
bool Befehle::befehlUps(){
	float ups;
	bool ok = false;
	if( anfaengeZaehler == 2){
		ups = atof(anfaenge[1]);
		ok = motor->Speed(ups);
	}

	return ok;
};
/*
bool Befehle::befehlPps(){
	bool ok = false;
	float pps;
	if( anfaengeZaehler == 2){
		pps = atof(anfaenge[1]);
		Timer0::pulseProSekunde(pps);
		ok = true;
	}
	return ok;
};
*/
/************************************************************************
 * \date 08.08.2020   
 * \author Frank Tobergte
 *
 * \brief Wertet den Befehl "umdr" aus
 * \return true = Befehl konnte verarbeitet werden.
 ************************************************************************/
bool Befehle::befehlUmdr(){
	bool ok = false;
	float n;
	float t;
	if( anfaengeZaehler == 2){
		n = atof(anfaenge[1]);
		ok = motor->UmdrehungenOhneZeit(n);
	}
	else if( anfaengeZaehler == 3){
		n = atof(anfaenge[1]);
		t = atof(anfaenge[2]);
		ok = motor->UmdrehungenMitZeit(n,t);
	}
	return ok;
};
/*
bool Befehle::befehlStopp(){
	bool ok = true;
	
	
	return ok;
}
*/
/************************************************************************
 * \date 06.08.2020   
 * \author Frank Tobergte
 *
 * \brief Wertet den Befehl "power" aus
 * \return true = Befehl konnte verarbeitet werden.
 ************************************************************************/
bool Befehle::befehlPower(){
	bool ok = false;
	if( anfaengeZaehler == 2){
		if(strcmp(anfaenge[1], "on") == 0){
			ok = motor->Power(true);
		}else if(strcmp(anfaenge[1], "off") == 0){
			ok = motor->Power(false);

		}
	}
	return ok;
};


/************************************************************************
 * \date 07.08.2020   
 * \author Frank Tobergte
 *
 * \brief Schreibt das Prompt abhaengig von der Ausfuehrung.
 * \param ok = true; Ausfuehrung war ok
 ************************************************************************/
void Befehle::schreibePrompt(bool ok){
	if(ok)
		uart.sende(" --> OK\r\n>: ");
	else
		uart.sende(" --> ERROR\r\n>: ");
		
}



