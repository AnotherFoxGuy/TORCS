/***************************************************************************

    file        : racegl.h
    created     : Sat Nov 16 19:02:56 CET 2002
    copyright   : (C) 2002 by Eric Espi�                        
    email       : eric.espie@torcs.org   
    version     : $Id$                                  

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
 
/** @file    
    		
    @author	<a href=mailto:torcs@free.fr>Eric Espie</a>
    @version	$Id$
*/

#ifndef _RACEGL_H_
#define _RACEGL_H_

extern void *ReScreenInit(void);
extern void  ReScreenShutdown(void);
extern void *ReHookInit(void);
extern void ReHookShutdown(void);
extern void ReSetRaceMsg(char *msg);
extern void ReSetRaceBigMsg(char *msg);

extern void *ReResScreenInit(void);
extern void ReResScreenSetTitle(char *title);
extern void ReResScreenAddText(char *text);
extern void ReResScreenSetText(char *text, int line);
extern void ReResScreenRemoveText(int line);
extern void ReResShowCont(void);

#endif /* _RACEGL_H_ */ 



