/***************************************************************************
                     screenshot.cpp -- make screen shots                                 
                             -------------------                                         
    created              : Wed Aug 18 12:50:34 CEST 1999
    copyright            : (C) 1999 by Eric Espie                         
    email                : torcs@free.fr   
    version              : $Id$                                  
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
    		Screen Shots
    @ingroup	racemantools
    @author	<a href=mailto:eric.espie@torcs.org>Eric Espie</a>
    @version	$Id$
    @ingroup racemantools
*/

#include <stdlib.h>
#include <stdio.h>
#ifdef WIN32
#include <windows.h>
#endif
#include <GL/glut.h>
#include <tgf.h>

/** Save a screen shot in png format
    @ingroup	racemantools
 */
void
RmScreenShot(void * /* notused */)
{
#ifndef WIN32
    unsigned char	*img;
    char		buf[256];

    img = (unsigned char*)malloc(GfScrWidth * GfScrHeight * 3);
    if (img == NULL) {
	return;
    }
    
    glPixelStorei(GL_PACK_ROW_LENGTH, 0);
    glPixelStorei(GL_PACK_ALIGNMENT, 1);
    glReadBuffer(GL_FRONT);
    glReadPixels(0, 0, GfScrWidth, GfScrHeight, GL_RGB, GL_UNSIGNED_BYTE, (GLvoid*)img);

    sprintf(buf, "torcs-%s.png", GfGetTimeStr());
    GfImgWritePng(img, buf, GfScrWidth, GfScrHeight);

    free(img);
#endif
}
