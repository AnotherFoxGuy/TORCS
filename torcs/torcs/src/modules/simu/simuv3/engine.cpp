/***************************************************************************

    file                 : engine.cpp
    created              : Sun Mar 19 00:06:55 CET 2000
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

#include "sim.h"

tdble CalculateTorque (tEngine* engine, tdble rads)
{
	tEngineCurve *curve = &(engine->curve);
	tdble Tq = curve->data[0].Tq;
	tdble Tmax = curve->data[0].Tq;
	tdble Tmin = curve->data[0].Tq * 0.5;
	tdble rpm_max = curve->data[0].rads;
	tdble rpm_min = -1.0;
	tdble alpha = 0.0;
	for (int i = 0; i < curve->nbPts; i++) {
		if (rads > curve->data[i].rads) { 
			Tmin = curve->data[i].Tq;
			rpm_min = curve->data[i].rads;
			if (i<engine->curve.nbPts) {
				Tmax = curve->data[i+1].Tq;
				rpm_max = curve->data[i+1].rads;
			}
		}
	}
	alpha = (rads - rpm_min) / (rpm_max - rpm_min);
	Tq = (1.0-alpha) * Tmin + alpha * Tmax;
	return Tq;
}

void
SimEngineConfig(tCar *car)
{
    void	*hdle = car->params;
    int		i;
    tdble	maxTq;
    tdble	rpmMaxTq = 0;
    char	idx[64];
    tEngineCurveElem *data;
    struct tEdesc {
	    tdble rpm;
	    tdble tq;
    } *edesc;


    car->engine.revsLimiter = GfParmGetNum(hdle, SECT_ENGINE, PRM_REVSLIM, (char*)NULL, 800);
    car->carElt->_enginerpmRedLine = car->engine.revsLimiter;
    car->engine.revsMax     = GfParmGetNum(hdle, SECT_ENGINE, PRM_REVSMAX, (char*)NULL, 1000);
    car->carElt->_enginerpmMax = car->engine.revsMax;
    car->engine.tickover    = GfParmGetNum(hdle, SECT_ENGINE, PRM_TICKOVER, (char*)NULL, 150);
    car->engine.I           = GfParmGetNum(hdle, SECT_ENGINE, PRM_INERTIA, (char*)NULL, 0.2423);
    car->engine.fuelcons    = GfParmGetNum(hdle, SECT_ENGINE, PRM_FUELCONS, (char*)NULL, 0.0622);
    car->engine.brakeCoeff  = GfParmGetNum(hdle, SECT_ENGINE, PRM_ENGBRKCOEFF, (char*)NULL, 0.33);
	car->engine.jointI = car->engine.I;
	car->engine.pressure = 0.0;
	car->engine.exhaust_pressure = 0.0;
	car->engine.exhaust_refract = 0.1;
	car->engine.responseTq = 0.0;

    sprintf(idx, "%s/%s", SECT_ENGINE, ARR_DATAPTS);
    car->engine.curve.nbPts = GfParmGetEltNb(hdle, idx);
    edesc = (struct tEdesc*)malloc((car->engine.curve.nbPts + 1) * sizeof(struct tEdesc));
    
    for (i = 0; i < car->engine.curve.nbPts; i++) {
		sprintf(idx, "%s/%s/%d", SECT_ENGINE, ARR_DATAPTS, i+1);
		edesc[i].rpm = GfParmGetNum(hdle, idx, PRM_RPM, (char*)NULL, car->engine.revsMax);
		edesc[i].tq  = GfParmGetNum(hdle, idx, PRM_TQ, (char*)NULL, 0);
    }
    edesc[i].rpm = edesc[i - 1].rpm;
    edesc[i].tq  = edesc[i].tq;
    
    maxTq = 0;
	car->engine.curve.maxPw = 0;
    car->engine.curve.data = (tEngineCurveElem *)malloc(car->engine.curve.nbPts * sizeof(tEngineCurveElem));

    for(i = 0; i < car->engine.curve.nbPts; i++) {
		data = &(car->engine.curve.data[i]);

		data->rads = edesc[i].rpm; 
		if ((data->rads>=car->engine.tickover)
			&& (edesc[i].tq > maxTq)
			&& (data->rads < car->engine.revsLimiter)) {
			maxTq = edesc[i].tq;
			rpmMaxTq = data->rads;
		}
		if ((data->rads>=car->engine.tickover)
			&& (data->rads * edesc[i].tq > car->engine.curve.maxPw)
			&& (data->rads < car->engine.revsLimiter)) {
			car->engine.curve.TqAtMaxPw = edesc[i].tq;
			car->engine.curve.maxPw = data->rads * edesc[i].tq;
			car->engine.curve.rpmMaxPw = data->rads;
		}
		data->Tq = edesc[i].tq;
    }
    car->engine.curve.maxTq = maxTq;
    car->carElt->_engineMaxTq = maxTq;
    car->carElt->_enginerpmMaxTq = rpmMaxTq;
    car->carElt->_engineMaxPw = car->engine.curve.maxPw;
    car->carElt->_enginerpmMaxPw = car->engine.curve.rpmMaxPw;
	//printf ("%fNm@%frpm, %fKW@%f rpm\n",
	//  car->carElt->_engineMaxTq,
	//	car->carElt->_enginerpmMaxTq * (30.0 / M_PI),
	//	car->carElt->_engineMaxPw * 0.001,
	//	car->carElt->_enginerpmMaxPw * (30.0 / M_PI)
	//	); 
	float X=urandom();
    car->engine.rads = X*car->engine.tickover+(1-X)*car->engine.revsMax;

#if 0
	// TEST TORQUE FUNCTION
	for (float rads=1.0; rads<car->engine.revsMax; rads+=1.0) {
		float Tq = CalculateTorque(&(car->engine), rads);
		printf ("%f %f #TORQUE\n", 30.0*rads/M_PI, Tq);
	}
#endif
    free(edesc);
}

/* Update torque output with engine rpm and accelerator command */
void
SimEngineUpdateTq(tCar *car)
{
    tEngine	*engine = &(car->engine);
    tEngineCurve *curve = &(engine->curve);
    tTransmission	*trans = &(car->transmission);
    tClutch		*clutch = &(trans->clutch);

#if 1
	// set clutch on when engine revs too low
	if (engine->rads < engine->tickover) {
		clutch->state = CLUTCH_APPLIED;
		//tdble d = exp(0.01*(engine->rads-engine->tickover))*engine->rads/engine->tickover;
		tdble d = .5 + .6 * (tanh(4.0*engine->rads/engine->tickover-2));
		if (car->ctrl->brakeCmd>0) d=0.0;
		if (d>1.0) d = 1.0;
		if (d<0.0) d = 0.0;
		if (d<clutch->transferValue) {
			clutch->transferValue = d;
		}
		tdble ac =  3.0*(1-engine->rads/engine->tickover);
		if (ac>1.0) ac = 1.0;
		if (ac>car->ctrl->accelCmd) {
			car->ctrl->accelCmd = ac;
		}
		if (engine->rads<0) engine->rads = 0.01;
	}
#endif

    if ((car->fuel <= 0.0) || (car->carElt->_state & (RM_CAR_STATE_BROKEN | RM_CAR_STATE_ELIMINATED))) {
		car->ctrl->accelCmd = 0.0;
    }

	if (engine->rads > engine->revsMax) {
		engine->rads = engine->revsMax;
	}
	if (engine->rads > engine->revsLimiter) {
		engine->Tq = -1.0-10.0*(engine->rads - engine->revsLimiter);
    } else if (engine->rads < 0) {
		engine->Tq = 0.0;
	} else {
		tdble Tq_max = CalculateTorque(engine, engine->rads);
#if 0
		tdble EngBrkK = engine->brakeCoeff * (engine->rads) / (engine->revsMax);
		engine->Tq = Tq_max * (car->ctrl->accelCmd * (1.0 + EngBrkK) - EngBrkK);

		tdble cons = engine->Tq + Tq_max*EngBrkK;
#else
		tdble EngBrkK = curve->TqAtMaxPw * engine->brakeCoeff * (engine->rads) / (engine->revsMax);

		tdble alpha = car->ctrl->accelCmd;
		tdble Tq_cur = (Tq_max + EngBrkK)* alpha;
		engine->Tq =  Tq_cur - EngBrkK;
		tdble cons = Tq_cur;
#endif

		//printf ("%f %f %f #CONS\n", engine->Tq, Tq*EngBrkK, cons);
		if (cons > 0) {
			car->fuel -= cons * engine->rads * engine->fuelcons * 0.0000001 * SimDeltaTime;
		}
		if (car->fuel <= 0.0) {
			car->fuel = 0.0;
		}
		return;

    } 
}

/*
 * Function
 *	SimEngineUpdateRpm
 *
 * Description
 *	update engine RPM with wheels RPM
 *
 * Parameters
 *	car and axle RPM
 *
 * Return
 *	axle rpm for wheel update
 *	0 if no wheel update
 */
tdble
SimEngineUpdateRpm(tCar *car, tdble axleRpm)
{
    tTransmission	*trans = &(car->transmission);
    tClutch		*clutch = &(trans->clutch);
    tEngine		*engine = &(car->engine);
    float		freerads;
    float		transfer;
    
#if 0
    if (car->fuel <= 0.0) {
		clutch->state = CLUTCH_APPLIED;
		clutch->transferValue = 0.0;
    }
#endif

    freerads = engine->rads;
	freerads +=engine->Tq / (  engine->I) * SimDeltaTime;
	tdble dp = engine->pressure;
	engine->pressure = engine->pressure*.9 + .1*engine->Tq;
	dp = (0.001*fabs(engine->pressure - dp));
	dp = fabs(dp);
	tdble rth = urandom();
	if (dp>rth) {
		engine->exhaust_pressure += rth;
	}
	engine->exhaust_pressure*=.9;

	
	car->carElt->priv.smoke += 5.0*engine->exhaust_pressure;
	car->carElt->priv.smoke *= 0.99;
#if 0
	if (engine->exhaust_pressure>(engine->exhaust_refract)) {
		//car->carElt->priv.smoke += engine->exhaust_pressure;//engine->exhaust_refract;
		engine->exhaust_pressure -= engine->exhaust_refract;
		engine->exhaust_refract = 0.05;
	} 
	if (engine->exhaust_refract<0.01) {
		engine->exhaust_refract = 0.01;
		car->carElt->priv.smoke = 0.0;
	} else {
		engine->exhaust_refract*=0.99;
		car->carElt->priv.smoke *= 0.99;
	}
#endif

    transfer = 0.0;
    float ttq = 0.0;
	float responseI = trans->differential[0].feedBack.I + trans->differential[1].feedBack.I;
	engine->responseTq = 0.0;
	tdble dI = fabs(trans->curI - engine->jointI);
	tdble sdI = dI;

	if (sdI>1.0) sdI = 1.0;

	engine->jointI =	engine->jointI * .9 +  .1 * trans->curI;

    if ((clutch->transferValue > 0.01) && (trans->gearbox.gear)) {

		transfer = clutch->transferValue * clutch->transferValue * clutch->transferValue * clutch->transferValue;

		ttq = dI* tanh(0.01*(axleRpm * trans->curOverallRatio * transfer + freerads * (1.0-transfer) -engine->rads))*100.0;
		engine->rads = (1.0-sdI) * (axleRpm * trans->curOverallRatio * transfer + freerads * (1.0-transfer)) + sdI *(engine->rads + ((ttq)*SimDeltaTime)/(engine->I));
		if (engine->rads < 0.0) {
			engine->rads = 0; engine->Tq = 0.0;
		}
    } else {
		engine->rads = freerads;
    }

    if ((trans->curOverallRatio!=0.0) && (responseI > 0)) {
		return axleRpm - sdI * ttq * trans->curOverallRatio   * SimDeltaTime / ( responseI);
    } else {
		return 0.0;
    }
}

void
SimEngineShutdown(tCar *car)
{
    free(car->engine.curve.data);
}
