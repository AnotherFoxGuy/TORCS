/***************************************************************************

    file                 : wheel.cpp
    created              : Sun Mar 19 00:09:06 CET 2000
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

#include <stdio.h>
#include "sim.h"

static char *WheelSect[4] = {SECT_FRNTRGTWHEEL, SECT_FRNTLFTWHEEL, SECT_REARRGTWHEEL, SECT_REARLFTWHEEL};
static char *SuspSect[4] = {SECT_FRNTRGTSUSP, SECT_FRNTLFTSUSP, SECT_REARRGTSUSP, SECT_REARLFTSUSP};
static char *BrkSect[4] = {SECT_FRNTRGTBRAKE, SECT_FRNTLFTBRAKE, SECT_REARRGTBRAKE, SECT_REARLFTBRAKE};

void
SimWheelConfig(tCar *car, int index)
{
    void   *hdle = car->params;
    tCarElt *carElt = car->carElt;
    tWheel *wheel = &(car->wheel[index]);
    tdble rimdiam, tirewidth, tireratio, pressure;
    tdble x0, Ca, RFactor, EFactor, patchLen;

    pressure              = GfParmGetNum(hdle, WheelSect[index], PRM_PRESSURE, (char*)NULL, 275600);
    rimdiam               = GfParmGetNum(hdle, WheelSect[index], PRM_RIMDIAM, (char*)NULL, 0.33);
    tirewidth             = GfParmGetNum(hdle, WheelSect[index], PRM_TIREWIDTH, (char*)NULL, 0.145);
    tireratio             = GfParmGetNum(hdle, WheelSect[index], PRM_TIRERATIO, (char*)NULL, 0.75);
    wheel->mu             = GfParmGetNum(hdle, WheelSect[index], PRM_MU, (char*)NULL, 1.0);
    wheel->I              = GfParmGetNum(hdle, WheelSect[index], PRM_INERTIA, (char*)NULL, 1.5);
    wheel->I += wheel->brake.I; /* add brake inertia */
    wheel->staticPos.y    = GfParmGetNum(hdle, WheelSect[index], PRM_YPOS, (char*)NULL, 0);
    x0			  = GfParmGetNum(hdle, WheelSect[index], PRM_RIDEHEIGHT, (char*)NULL, 0.20);
    wheel->staticPos.az   = GfParmGetNum(hdle, WheelSect[index], PRM_TOE, (char*)NULL, 0.0);
    wheel->staticPos.ax   = GfParmGetNum(hdle, WheelSect[index], PRM_CAMBER, (char*)NULL, 0.0);
    Ca                    = GfParmGetNum(hdle, WheelSect[index], PRM_CA, (char*)NULL, 30.0);
    RFactor               = GfParmGetNum(hdle, WheelSect[index], PRM_RFACTOR, (char*)NULL, 0.8);
    EFactor               = GfParmGetNum(hdle, WheelSect[index], PRM_EFACTOR, (char*)NULL, 0.7);
    wheel->lfMax          = GfParmGetNum(hdle, WheelSect[index], PRM_LOADFMAX, (char*)NULL, 1.6);
    wheel->lfMin          = GfParmGetNum(hdle, WheelSect[index], PRM_LOADFMIN, (char*)NULL, 0.8);
    wheel->opLoad         = GfParmGetNum(hdle, WheelSect[index], PRM_OPLOAD, (char*)NULL, wheel->weight0 * 1.2);
    wheel->mass           = GfParmGetNum(hdle, WheelSect[index], PRM_MASS, (char*)NULL, 20.0);

    if (index % 2) {
	wheel->relPos.ax = -wheel->staticPos.ax;
    } else {
	wheel->relPos.ax = wheel->staticPos.ax;
    }
    
    wheel->lfMin = MIN(0.8, wheel->lfMin);
    wheel->lfMax = MAX(1.6, wheel->lfMax);

    RFactor = MIN(1.0, RFactor);
    RFactor = MAX(0.1, RFactor);
    EFactor = MIN(1.0, EFactor);

    patchLen = wheel->weight0 / (tirewidth * pressure);
    
    wheel->radius = rimdiam / 2.0 + tirewidth * tireratio;
    wheel->tireSpringRate = wheel->weight0 / (wheel->radius * (1.0 - cos(asin(patchLen / (2.0 * wheel->radius)))));
    wheel->relPos.x = wheel->staticPos.x = car->axle[index/2].xpos;
    wheel->relPos.y = wheel->staticPos.y;
    wheel->relPos.z = wheel->radius - wheel->susp.spring.x0;
    wheel->relPos.ay = wheel->relPos.az = 0;
    wheel->steer = 0;

    /* components */
    SimSuspConfig(hdle, SuspSect[index], &(wheel->susp), wheel->weight0, x0);
    SimBrakeConfig(hdle, BrkSect[index], &(wheel->brake));
    
    carElt->_rimRadius(index) = rimdiam / 2.0;
    carElt->_tireHeight(index) = tirewidth * tireratio;
    carElt->_tireWidth(index) = tirewidth;
    carElt->_brakeDiskRadius(index) = wheel->brake.radius;
    carElt->_wheelRadius(index) = wheel->radius;

    wheel->mfC = 2.0 - asin(RFactor) * 2.0 / PI;
    wheel->mfB = Ca / wheel->mfC;
    wheel->mfE = EFactor;
    
    wheel->lfK = log((1.0 - wheel->lfMin) / (wheel->lfMax - wheel->lfMin));

    wheel->feedBack.I += wheel->I;
    wheel->feedBack.spinVel = 0;
    wheel->feedBack.Tq = 0;
    wheel->feedBack.brkTq = 0;
}

void
SimWheelUpdateRide(tCar *car, int index)
{
    tWheel *wheel = &(car->wheel[index]);
    tdble Zroad;
    tdble prex;
	t3Dd normal;

    /* compute suspension travel */
    RtTrackGlobal2Local(car->trkPos.seg, wheel->pos.x, wheel->pos.y, &(wheel->trkPos), TR_LPOS_SEGMENT);
    wheel->zRoad = Zroad = RtTrackHeightL(&(wheel->trkPos));
    prex = wheel->susp.x;
	
	if (1) {	// This is not correct for 3D
		wheel->susp.x = wheel->rideHeight = wheel->pos.z - Zroad;
	} else { // experimental 3d support.. not fully tested.
		RtTrackSurfaceNormalL(&(wheel->trkPos), &normal); 
		wheel->susp.x = wheel->pos.z - Zroad*normal.z;
	}
    /* verify the suspension travel */
    SimSuspCheckIn(&(wheel->susp));
    wheel->susp.v = (prex - wheel->susp.x) / SimDeltaTime;
    /* update wheel brake */
    SimBrakeUpdate(car, wheel, &(wheel->brake));
}

void
SimWheelUpdateForce(tCar *car, int index)
{
    tWheel 	*wheel = &(car->wheel[index]);
    tdble 	axleFz = wheel->axleFz;
    tdble 	vt, v, v2, wrl; /* wheel related velocity */
    tdble 	Fn, Ft;
    tdble 	waz;
    tdble 	CosA, SinA;
    tdble	s, sa, sx, sy; /* slip vector */
    tdble	stmp, F, Bx;
    tdble	mu;

    t3Dd rel_normal;

    waz = wheel->steer + wheel->staticPos.az;
    /* Get normal of road relative to the wheel's axis 
     This should help take into account the camber.*/
    if (1) {
	t3Dd angles;
	t3Dd normal;

	RtTrackSurfaceNormalL(&(wheel->trkPos), &normal);

	angles.x = car->DynGC.pos.ax + wheel->relPos.ax;
	angles.y = car->DynGC.pos.ay;
	angles.z = car->DynGC.pos.az + waz;
	NaiveRotate (normal, angles, &rel_normal);
    }

    wheel->state = 0;

    /* VERTICAL STUFF CONSIDERING SMALL PITCH AND ROLL ANGLES */
    /* Now uses the normal, so it should work */
    /* update suspension force */
    SimSuspUpdate(&(wheel->susp));
    /* check suspension state */
    wheel->state |= wheel->susp.state;
    if ((wheel->state & SIM_SUSP_EXT) == 0) {
	tdble f_z  = axleFz + wheel->susp.force;
	
	if ((f_z < 0)) {
	    f_z = 0;
	}
	
	/* project the reaction force. Only wheel->forces.z is
	   actually interesting for friction. The rest just gets
	   normally at the end */
	Ft = rel_normal.x * f_z;
	Fn = rel_normal.y * f_z;
	wheel->forces.x = 0.0;
	wheel->forces.y = 0.0;
	wheel->forces.z = rel_normal.z * f_z;

    } else {
	Ft = 0.0;
	Fn = 0.0;
	wheel->forces.x = 0.0;
	wheel->forces.y = 0.0;
	wheel->forces.z = 0.0;
    }

    /* update wheel coord */
    wheel->relPos.z = - wheel->susp.x / wheel->susp.spring.bellcrank + wheel->radius; /* center relative to GC */

    /* HORIZONTAL FORCES */

    CosA = cos(waz);
    SinA = sin(waz);

    /* tangent velocity */
    vt = wheel->bodyVel.x * CosA + wheel->bodyVel.y * SinA;
    v2 = wheel->bodyVel.x * wheel->bodyVel.x + wheel->bodyVel.y * wheel->bodyVel.y;
    v = sqrt(v2);

    /* slip angle */
    if (v < 0.000001) {
	sa = 0;
    } else {
	sa = atan2(wheel->bodyVel.y, wheel->bodyVel.x) - waz;
    }
    NORM_PI_PI(sa);

    wrl = wheel->spinVel * wheel->radius;
    if ((wheel->state & SIM_SUSP_EXT) != 0) {
	sx = sy = 0;
    } else if (v < 0.000001) {
	sx = wrl;
	sy = 0;
    } else {
	sx = (vt - wrl) / v; /* target */
	sy = sin(sa);
    }


    s = sqrt(sx*sx+sy*sy);
    car->carElt->_skid[index] = MAX(0.2, MIN(s, 1.2)) - 0.2;
    car->carElt->_reaction[index] = wheel->forces.z;
    stmp = MIN(s, 1.5);

    /* MAGIC FORMULA */
    Bx = wheel->mfB * stmp;
    F = sin(wheel->mfC * atan(Bx * (1 - wheel->mfE) + wheel->mfE * atan(Bx))) * (1.0 + stmp * simSkidFactor[car->carElt->_skillLevel]);

    /* load sensitivity */
    mu = wheel->mu * (wheel->lfMin + (wheel->lfMax - wheel->lfMin) * exp(wheel->lfK * wheel->forces.z / wheel->opLoad));
    
    F *= wheel->forces.z * mu * wheel->trkPos.seg->surface->kFriction * (1.0 + 0.05 * sin(-wheel->staticPos.ax * 18.0));	/* coeff */

    wheel->rollRes = wheel->forces.z * wheel->trkPos.seg->surface->kRollRes;
    
    if (s > 0.000001) {
	/* wheel axis based */
	Ft -= F * sx / s;
	Fn -= F * sy / s;
    }

    RELAXATION2(Fn, wheel->preFn, 50.0);
    RELAXATION2(Ft, wheel->preFt, 50.0);
    
    wheel->relPos.az = waz;

    if (rel_normal.z > 0.0) {
	wheel->forces.x += Ft * CosA - Fn * SinA;
	wheel->forces.y += Ft * SinA + Fn * CosA;
    } else { // we are upside down?
	/* Quick hack, which might not work */
	Ft = rel_normal.x * F * wheel->bodyVel.x;
	Fn = rel_normal.y * F * wheel->bodyVel.y;
	wheel->forces.x =  Ft * CosA - Ft * SinA;
	wheel->forces.y =  Ft * CosA + Fn * SinA;
    }
    wheel->spinTq = Ft * wheel->radius;
    wheel->sa = sa;
    wheel->sx = sx;

    wheel->feedBack.spinVel = wheel->spinVel;
    wheel->feedBack.Tq = wheel->spinTq;
    wheel->feedBack.brkTq = wheel->brake.Tq;
}


void
SimWheelUpdateRotation(tCar *car)
{
    int			i;
    tWheel 		*wheel;

    for (i = 0; i < 4; i++) {
	wheel = &(car->wheel[i]);
	wheel->spinVel = wheel->in.spinVel;
	
	RELAXATION2(wheel->spinVel, wheel->prespinVel, 50.0);
	
	wheel->relPos.ay += wheel->spinVel * SimDeltaTime;
	car->carElt->_wheelSpinVel(i) = wheel->spinVel;
    }
}


void
SimUpdateFreeWheels(tCar *car, int axlenb)
{
    int			i;
    tWheel 		*wheel;
    tdble		BrTq;		/* brake torque */
    tdble		ndot;		/* rotation acceleration */
    tdble		I;
    
    for (i = axlenb * 2; i < axlenb * 2 + 2; i++) {
	wheel = &(car->wheel[i]);

	I = wheel->I + car->axle[axlenb].I / 2.0;
	    
	ndot = SimDeltaTime * wheel->spinTq / I;
	wheel->spinVel -= ndot;

	BrTq = - SIGN(wheel->spinVel) * wheel->brake.Tq;
	ndot = SimDeltaTime * BrTq / I;

	if (fabs(ndot) > fabs(wheel->spinVel)) {
	    ndot = -wheel->spinVel;
	}
	
	wheel->spinVel += ndot;
	wheel->in.spinVel = wheel->spinVel;
    }
}
