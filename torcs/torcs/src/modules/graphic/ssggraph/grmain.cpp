/***************************************************************************

    file                 : grmain.cpp
    created              : Thu Aug 17 23:23:49 CEST 2000
    copyright            : (C) 2000 by Eric Espie
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

#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#ifdef WIN32
#include <windows.h>
#endif
#include <GL/glut.h>
#include <plib/ssg.h>

#include <tgf.h>
#include <graphic.h>
#include <racemantools.h>

#include "grmain.h"
#include "grshadow.h"
#include "grskidmarks.h"
#include "grsmoke.h"
#include "grcar.h"
#include "grcam.h"
#include "grscene.h"
#include "grsound.h"
#include "grboard.h"
#include "grutil.h"

int grDebugFlag			= 1;
int grBoardFlag			= 1;
int grLeaderFlag		= 1;
int grLeaderNb			= 10;
int grCounterFlag		= 1;
int grGFlag			= 0;
int grDrawCurrent		= 0;

static double	OldTime;
static int	nFrame;
static float	Fps;
double		grCurTime;
double		grDeltaTime;

static int grWindowRatio = 0;
int grNbCars;

void *grHandle = NULL;
int grWinx, grWiny, grWinw, grWinh;

tgrCarInfo	*grCarInfo;

ssgContext	grContext;

int
initView(int x, int y, int width, int height, int flag, void *screen)
{
    char	buf[256];
    int		camNum;
    cGrCamera	*cam;

    
    switch (flag) {
    case GR_VIEW_STD:
	grScissorflag = 0;
	break;
    case GR_VIEW_PART:
	grScissorflag = 1;
	break;
    }
    grWinx = x;
    grWiny = y;
    grWinw = width;
    grWinh = height;
    grSetView(x, y, width, height);
    grInitCams();
    grInitBoard();
    OldTime = GfTimeClock();
    nFrame = 0;
    Fps = 0;
    grWindowRatio = 0;

    grHandle = GfParmReadFile("config/graph.xml", GFPARM_RMODE_STD | GFPARM_RMODE_CREAT);
    grDebugFlag = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_DEBUG,
				      (char*)NULL, grDebugFlag);
    grBoardFlag = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_BOARD,
				      (char*)NULL, grBoardFlag);
    grLeaderFlag = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_LEADER,
				       (char*)NULL, grLeaderFlag);
    grLeaderNb = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_NBLEADER,
				     (char*)NULL, grLeaderNb);
    grCounterFlag = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_COUNTER,
					(char*)NULL, grCounterFlag);
    grGFlag = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_GGRAPH,
				  (char*)NULL, grGFlag);
    camNum = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_CAM,
			       (char*)NULL, 0);
    grCurCamHead = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_CAM_HEAD,
			       (char*)NULL, 9);
    cam = TAILQ_FIRST(&grCams[grCurCamHead]);
    grCurCam = NULL;
    while (cam) {
	if (cam->getId() == camNum) {
	    grCurCam = cam;
	    break;
	}
	cam = cam->next();
    }
    if (grCurCam == NULL) {
	/* back to default camera */
	grCurCamHead = 0;
	grCurCam = TAILQ_FIRST(&grCams[grCurCamHead]);
	GfParmSetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_CAM, (char*)NULL, (tdble)grCurCam->getId());
	GfParmSetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_CAM_HEAD, (char*)NULL, (tdble)grCurCamHead);    
    }
    sprintf(buf, "%s-%d-%d", GR_ATT_FOVY, grCurCamHead, camNum);
    grCurCam->loadDefaults(buf);
    grDrawCurrent = grCurCam->getDrawCurrent();

    GfuiAddSKey(screen, GLUT_KEY_UP,   "Zoom In",          (void*)GR_ZOOM_IN,	grSetZoom);
    GfuiAddSKey(screen, GLUT_KEY_DOWN, "Zoom Out",         (void*)GR_ZOOM_OUT,	grSetZoom);
    GfuiAddSKey(screen, GLUT_KEY_HOME, "Zoom Maximum",     (void*)GR_ZOOM_MAX,	grSetZoom);
    GfuiAddSKey(screen, GLUT_KEY_END,  "Zoom Minimum",     (void*)GR_ZOOM_MIN,	grSetZoom);
    GfuiAddKey(screen, '*',            "Zoom Default",     (void*)GR_ZOOM_DFLT,	grSetZoom);

    GfuiAddSKey(screen, GLUT_KEY_F2,   "Driver Views",      (void*)0, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F3,   "Car Views",         (void*)1, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F4,   "Side Car Views",    (void*)2, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F5,   "Up Car View",       (void*)3, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F6,   "Persp Car View",    (void*)4, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F7,   "All Circuit Views", (void*)5, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F8,   "Track View",        (void*)6, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F9,   "Track View Zoomed", (void*)7, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F10,  "Follow Car Zoomed", (void*)8, grSelectCamera);
    GfuiAddSKey(screen, GLUT_KEY_F11,  "TV Director View",  (void*)9, grSelectCamera);

    GfuiAddKey(screen, 'b',            "Driver Board",     (void*)0, grSelectBoard);
    GfuiAddKey(screen, 'c',            "Driver Counters",  (void*)1, grSelectBoard);
    GfuiAddKey(screen, 'l',            "Leaders Board",    (void*)2, grSelectBoard);
    GfuiAddKey(screen, 'f',            "FPS Counter",      (void*)3, grSelectBoard);
    GfuiAddKey(screen, 'g',            "Debug Info",       (void*)4, grSelectBoard);

    return 0;
}


int
initCars(tSituation *s)
{
    char	idx[16];
    int		index;
    int		i;
    tCarElt 	*elt;
    void	*hdle;

    TRACE_GL("initCars: start");

    grHandle = GfParmReadFile("config/graph.xml", GFPARM_RMODE_STD | GFPARM_RMODE_CREAT);

    grCarInfo = (tgrCarInfo*)calloc(s->_ncars, sizeof(tgrCarInfo));
    
    grNbCars = s->_ncars;
    
    for (i = 0; i < s->_ncars; i++) {
	elt = s->cars[i];
	index = elt->index;
	hdle = elt->_paramsHandle;
	sprintf(idx, "Robots/index/%d", elt->_driverIndex);
	grCarInfo[index].iconColor[0] = GfParmGetNum(hdle, idx, "red",   (char*)NULL, 0);
	grCarInfo[index].iconColor[1] = GfParmGetNum(hdle, idx, "green", (char*)NULL, 0);
	grCarInfo[index].iconColor[2] = GfParmGetNum(hdle, idx, "blue",  (char*)NULL, 0);
	grCarInfo[index].iconColor[3] = 1.0;
	grInitCar(elt);
    }
    TRACE_GL("initCars: end");

    grInitSound();
    grInitSmoke(s->_ncars);
    return 0;
    
}

void
shutdownCars(void)
{
    if (grNbCars) {
	grShutdownSkidmarks();
	/* TODO delete ssg objects */
	grShutdownSound();
	free(grCarInfo);
    }
    GfParmReleaseHandle(grHandle);
    GfParmReleaseHandle(grHandle);
}

int
refresh(tSituation *s)
{
    int			i;

    nFrame++;
    grCurTime = GfTimeClock();
    grDeltaTime = grCurTime - OldTime;
    if ((grCurTime - OldTime) > 1.0) {
	/* The Frames Per Second (FPS) display is refresh every second */
	Fps = (tdble)nFrame / (grCurTime - OldTime);
	nFrame = 0;
	OldTime = grCurTime;
    }

    TRACE_GL("refresh: start");

    grRefreshSound(s);

    grSetView(scrx, scry, scrw, scrh);

    glDisable(GL_COLOR_MATERIAL);

    grCurCam->update(s->cars[s->current], s);
    if (grCurCam->getDrawBackground()) {
	glDisable(GL_DEPTH_TEST);
	glClear(GL_COLOR_BUFFER_BIT);
	grDrawBackground(grCurCam);
	glEnable(GL_DEPTH_TEST);
	glClear(GL_DEPTH_BUFFER_BIT);
    } else {
	glEnable(GL_DEPTH_TEST);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    }
    grCurCam->action();
    for (i = 0; i < s->_ncars; i++) {
	grDrawCar(s->cars[i], s->cars[s->current], grCurCam->getDrawCurrent());
    }

/*     for (i = 0; i < s->_ncars; i++) { */
/* 	grDrawShadow(s->cars[i]); */
/*     } */
    
    grUpdateSmoke(grDeltaTime, grCurTime);

    grDrawScene();

    glViewport(grWinx, grWiny, grWinw, grWinh);
    grBoardCam->action();

    glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_TEST);
    glDisable(GL_LIGHTING);
    
    TRACE_GL("refresh: glDisable(GL_DEPTH_TEST)");
    if (grDebugFlag)   grDispDebug(Fps, s->cars[s->current], s);
    if (grGFlag)       grDispGGraph(s->cars[s->current]);
    if (grBoardFlag)   grDispCarBoard(s->cars[s->current], s);
    if (grLeaderFlag)  grDispLeaderBoard(s->cars[s->current], s);
    if (grCounterFlag) grDispCounterBoard2(s->cars[s->current]);
    TRACE_GL("refresh: display boards");

    //glutSwapBuffers();
    return 0;
}

int
initTrack(tTrack *track)
{
    ssgInit();

    grContext.makeCurrent();
    grInitScene(track);
    return 0;
}


void
shutdownTrack(void)
{
    grShutdownScene();
    grShutdownBoard();
}

