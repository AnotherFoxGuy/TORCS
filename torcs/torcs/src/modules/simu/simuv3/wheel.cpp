/***************************************************************************

    file                 : wheel.cpp
    created              : Sun Mar 19 00:09:06 CET 2000
    copyright            : (C) 2000-2004 by Eric Espie, Christos Dimitrakakis
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


#define MIN_NORMAL_Z 0.0
void
SimWheelUpdateRide(tCar *car, int index)
{
    tWheel *wheel = &(car->wheel[index]);
    tdble Zroad;
    tdble prex;

    /* compute suspension travel */
    RtTrackGlobal2Local(car->trkPos.seg, wheel->pos.x, wheel->pos.y, &(wheel->trkPos), TR_LPOS_SEGMENT);
    wheel->zRoad = Zroad = RtTrackHeightL(&(wheel->trkPos));
    prex = wheel->susp.x;
    
    t3Dd angles;
    t3Dd normal;
    t3Dd rel_normal;
    
    tdble waz = wheel->steer + wheel->staticPos.az;
    tdble dZ;
    // Find normal of track.
    RtTrackSurfaceNormalL(&(wheel->trkPos), &normal);
    
    dZ = wheel->pos.z - Zroad;
    // Transform from world to suspension FOR
    if (index % 2) {
	wheel->relPos.ax = -wheel->staticPos.ax;
    } else {
	wheel->relPos.ax = wheel->staticPos.ax;
    }
    angles.x = car->DynGCg.pos.ax + wheel->relPos.ax;
    angles.y = car->DynGCg.pos.ay;
    angles.z = car->DynGCg.pos.az;
    NaiveRotate (normal, angles, &rel_normal);
    //NaiveRotate (d, angles, &d);
    if (rel_normal.z > MIN_NORMAL_Z) {
	tdble dist = dZ*normal.z/rel_normal.z;
	// add a factor as we want to take the *real* wheelpos
	// also used to bounce.
	wheel->susp.fx = wheel->radius - wheel->radius/rel_normal.z;
	wheel->susp.fy = 0.0;
	wheel->susp.x = wheel->rideHeight =
	   wheel->radius + ((dZ)*normal.z - wheel->radius)/rel_normal.z;
    } else {
	//wheel->susp.x = wheel->rideHeight = (wheel->pos.z - Zroad);
	//	wheel->susp.x = wheel->rideHeight = wheel->susp.spring.packers; 
	wheel->susp.fx = 0.0;
    }

    //wheel->relPos.z = - wheel->susp.x / wheel->susp.spring.bellcrank + wheel->radius; /* center relative to GC */
    /* verify the suspension travel */
    SimSuspCheckIn(&(wheel->susp));
    if (index % 2) {
	wheel->relPos.ax -= wheel->susp.dynamic_angles.x;
    } else {
	wheel->relPos.ax += wheel->susp.dynamic_angles.x;
    }

    wheel->susp.v = (prex - wheel->susp.x) / SimDeltaTime;
    /* update wheel brake */
    SimBrakeUpdate(car, wheel, &(wheel->brake));
    
}

void
SimWheelUpdateForce(tCar *car, int index)
{
    tWheel 	*wheel = &(car->wheel[index]);
    tdble 	axleFz = wheel->axleFz;
    //    tdble 	vt, v, v2;
    tdble       wrl; /* wheel related velocity */
    tdble 	Fn, Ft, Ft2;
    tdble 	waz;
    tdble 	CosA, SinA;
    tdble	s = 0.0;
    tdble       sa, sx, sy; /* slip vector */
    tdble	stmp, F, Bx;
    tdble	mu;
    tdble       reaction_force;
    tdble f_z = 0.0;
    t3Dd angles;
    t3Dd normal;
    t3Dd rel_normal;
    bool right_way_up = true;
    static int wcnt = 0;

    waz = wheel->steer + wheel->staticPos.az;
    /* Get normal of road relative to the wheel's axis 
     This should help take into account the camber.*/

    
    RtTrackSurfaceNormalL(&(wheel->trkPos), &normal);
    
    angles.x = car->DynGCg.pos.ax + wheel->relPos.ax;
    angles.y = car->DynGCg.pos.ay;
    angles.z = car->DynGCg.pos.az + waz;
    NaiveRotate (normal, angles, &rel_normal);


    wheel->state = 0;

    Ft = 0.0;
    Fn = 0.0;
    wheel->forces.x = 0.0;
    wheel->forces.y = 0.0;
    wheel->forces.z = 0.0;

	
    /* VERTICAL STUFF CONSIDERING SMALL PITCH AND ROLL ANGLES */
    /* Now uses the normal, so it should work */
    /* update suspension force */
    SimSuspUpdate(&(wheel->susp));
    /* check suspension state */
    wheel->state |= wheel->susp.state;
    reaction_force = 0.0;

    wheel->forces.z = 0;
    Ft = Fn = 0;
    reaction_force = 0.0;
    if ((wheel->state & SIM_SUSP_EXT) == 0) {
	f_z  = axleFz + wheel->susp.force;

	if ((f_z < 0)) {
	    f_z = 0;
	}
	
	/* project the reaction force. Only wheel->forces.z is
	   actually interesting for friction. The rest is just
	   reaction. Now we have included the reaction from the sides
	   which is fake.
	   The suspension pushes the wheel down with f_z, but the reaction
	   of the surface is just f_z*rel_normal.z;!
	*/
	if ((right_way_up) && (rel_normal.z > MIN_NORMAL_Z)) {
	    // reaction force on track z axis should be equal to f_z's
	    // projection to track's normal
	    // reaction_force = f_z * rel_normal.z;
	    // but we're ignoring a lot of things, such
	    // as the reaction forces from the immovable axis of
	    // the suspension. We make an assumption that:
	    reaction_force = f_z /  rel_normal.z;
	    // the other reactions are then:
	    Ft = reaction_force * rel_normal.x;
	    Fn = reaction_force * rel_normal.y;
	} else {
	    f_z = 0;
	    wheel->susp.force = 0;
	    wheel->forces.z = 0;
	    Ft = Fn = 0;
	    reaction_force = 0.0;
	}

    }

    
    wheel->relPos.z = - wheel->susp.x / wheel->susp.spring.bellcrank + wheel->radius; /* center relative to GC */

    /* HORIZONTAL FORCES */

    CosA = cos(waz);
    SinA = sin(waz);

    /* tangent velocity */
    // This is speed of the wheel relative to the track, so we have
    // to take the projection to the track.
    tdble rel_normal_xz = sqrt (rel_normal.z*rel_normal.z
				+ rel_normal.x*rel_normal.x);
    tdble rel_normal_yz = sqrt (rel_normal.z*rel_normal.z
				+ rel_normal.y*rel_normal.y);
    tdble rel_normal_xy = sqrt (rel_normal.x*rel_normal.x
				+ rel_normal.y*rel_normal.y);
    wheel->bodyVel.z = 0.0;
    wrl = wheel->spinVel * wheel->radius;
    {
	t3Dd angles = {wheel->relPos.ax, 0.0, waz};
	NaiveRotate (wheel->bodyVel, angles, &wheel->bodyVel);
    }
    tdble wvx = wheel->bodyVel.x * rel_normal_yz;
    tdble wvy = wheel->bodyVel.y * rel_normal_xz;
    tdble absolute_speed = sqrt(wvx*wvx + wvy*wvy);
    wvx -= wrl;
    wheel->bodyVel.x = wvx;
    wheel->bodyVel.y = wvy;


    tdble relative_speed = sqrt(wvx*wvx + wvy*wvy);
    if ((wheel->state & SIM_SUSP_EXT) != 0) {
	sx = sy = sa = 0;
    } else if (absolute_speed < 0.000001) {
	sx = wrl;
	sy = 0;
	sa = 0;
    } else {
	// the division with absolute_speed is a bit of a hack. The
	// real solution is to use a first or second-order integration
	// model to update both the forces on the car and the
	// appropriate spin velocity.
	sx = wvx/absolute_speed;
	sy = wvy/absolute_speed;
	sa = atan2(wvx,wvy);
	s = sqrt(sx*sx+sy*sy);
    }


    if (right_way_up) {
	car->carElt->_skid[index] = MIN(1.0, s*reaction_force*0.0002);
//0.0002*(MAX(0.2, MIN(s, 1.2)) - 0.2)*reaction_force;
	car->carElt->_reaction[index] = reaction_force;
    } else {
	car->carElt->_skid[index] = 0.0;
	car->carElt->_reaction[index] = 0.0;
    }
    
    stmp = MIN(s, 1.5);

    /* MAGIC FORMULA */
    Bx = wheel->mfB * stmp;
    F = sin(wheel->mfC * atan(Bx * (1 - wheel->mfE) + wheel->mfE * atan(Bx))) * (1.0 + stmp * simSkidFactor[car->carElt->_skillLevel]);

    /* load sensitivity */
    mu = wheel->mu * (wheel->lfMin + (wheel->lfMax - wheel->lfMin) * exp(wheel->lfK * reaction_force / wheel->opLoad));
    
    F *= reaction_force * mu * wheel->trkPos.seg->surface->kFriction;
    // * (1.0 + 0.05 * sin(-wheel->staticPos.ax * 18.0));	/* coeff */

    wheel->rollRes = reaction_force * wheel->trkPos.seg->surface->kRollRes;
    car->carElt->priv.wheel[index].rollRes = wheel->rollRes;

    // Calculate friction forces
    Ft2 = 0.0;
    tdble Fn2 = 0.0;
    if (s > 0.000001) {
	/* wheel axis based - no control after an angle*/
	if (rel_normal.z > MIN_NORMAL_Z) {
	    // When the tyre is tilted there is less surface
	    // touching the road. Modelling effect simply with rel_normal_xz
	    Ft2 = - rel_normal_xz*F*sx/s;
	    Fn2 = - rel_normal_xz*F*sy/s;
	} else {
	    Ft2 = 0.0;
	    Fn2 = 0.0;
	}
	wheel->forces.x = Ft2 * rel_normal_yz;
	wheel->forces.y = Fn2 * rel_normal_xz; 
	wheel->forces.z = Ft2 * rel_normal.x + Fn2 * rel_normal.y;

    }

    RELAXATION2(Fn, wheel->preFn, 50.0);
    RELAXATION2(Ft, wheel->preFt, 50.0);
    
    wheel->relPos.az = waz;
    if (rel_normal.z > MIN_NORMAL_Z) {
	right_way_up = true;
    } else {
	right_way_up = false;
    }


    if (right_way_up==false) {
	Fn = 0;
	Ft = 0;
	wheel->forces.x = 0.0;
	wheel->forces.y = 0.0;
	wheel->forces.z = 0.0;
	Ft2 = 0.0;
	wheel->spinTq = 0.0;
    } else {
	t3Dd f;
	// send friction and reaction forces to the car
	f.x = wheel->forces.x;
	f.y = wheel->forces.y;
	f.z = 0.0;
	angles.x = wheel->relPos.ax + asin(rel_normal.x);
	angles.y = asin(rel_normal.y);
	angles.z = waz;
	NaiveInverseRotate (f, angles, &wheel->forces);
	// transmit reaction forces to the car
	
	wheel->forces.x +=(Ft* CosA - Fn * SinA);
	wheel->forces.y +=(Ft* SinA + Fn * CosA);
	wheel->forces.z = f_z;

#if 0
	wheel->forces.x =0.0;
	wheel->forces.y =0.0;
	wheel->forces.z =0.0;//f_z;
#endif
	wheel->spinTq = Ft2 * wheel->radius;
	wheel->sa = sa;
	wheel->sx = sx;
    }
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
