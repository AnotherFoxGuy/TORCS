/***************************************************************************

    file                 : grboard.h
    created              : Thu Aug 17 23:55:47 CEST 2000
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

#ifndef _GRBOARD_H_
#define _GRBOARD_H_

#include <raceman.h>

class cGrBoard
{
 protected:
    int			id;		/* Board Id */

    int	boardFlag;
    
    int leaderFlag;
    int debugFlag;
    int leaderNb;
    int counterFlag;
    int GFlag;
    int arcadeFlag;

 private:
    void grDispDebug(float fps, tCarElt *car);
    void grDispGGraph(tCarElt *car);
    void grDispCarBoard1(tCarElt *car, tSituation *s);
    void grDispMisc(tCarElt *car);
    void grDrawGauge(tdble X1, tdble Y1, tdble H, float *clr1, float *clr2, tdble val, char *title);
    void grDispCarBoard2(tCarElt *car, tSituation *s);
    void grDispCarBoard(tCarElt *car, tSituation *s);
    void grDispCounterBoard(tCarElt *car);
    void grDispLeaderBoard(tCarElt *car, tSituation *s);
    void grDispCounterBoard2(tCarElt *car);
    void grDispArcade(tCarElt *car, tSituation *s);
    
 public:
    cGrBoard (int myid) {
	id = myid;
    }
    
    void initBoard(void);
    void shutdown(void);
    void selectBoard(int brd);
    void dispGaph(tCarElt *car);
    void initBoardCar(tCarElt *car);

    void refreshBoard(tSituation *s, float Fps, int forceArcade, tCarElt *curr);
    void loadDefaults(void);
};

extern void grInitBoardCar(tCarElt *car);


#endif /* _GRBOARD_H_ */ 



