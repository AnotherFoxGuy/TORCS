/***************************************************************************

    file                 : driver.cpp
    created              : Thu Dec 20 01:21:49 CET 2002
    copyright            : (C) 2002-2004 Bernhard Wymann
                           (C) 2004 Christos Dimitrakakis
    email                : berniw@bluewin.ch
                           dimitrak@idiap.ch
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

/**
   \file driver.cpp
   
   \brief High-level driver implementation.

   This file is the same as Bernhard's driver.cpp for the BT robot,
   with added bits for learning.
*/
#include "driver.h"
#include "ann_policy.h"
#include "MathFunctions.h"
#include "geometry.h"

#ifdef USE_OLETHROS_NAMESPACE
namespace olethros {
#endif

const float Driver::MAX_UNSTUCK_ANGLE = 15.0/180.0*PI;		///< [radians] If the angle of the car on the track is smaller, we assume we are not stuck.
const float Driver::UNSTUCK_TIME_LIMIT = 2.0;				///< [s] We try to get unstuck after this time.
const float Driver::MAX_UNSTUCK_SPEED = 5.0;				///< [m/s] Below this speed we consider being stuck.
const float Driver::MIN_UNSTUCK_DIST = 3.0;					///< [m] If we are closer to the middle we assume to be not stuck.
const float Driver::G = 9.81;								///< [m/(s*s)] Welcome on Earth.
const float Driver::FULL_ACCEL_MARGIN = 3.0;				///< [m/s] Margin reduce oscillation of brake/acceleration.
const float Driver::SHIFT = 0.99;							///< [-] (% of rpmredline) When do we like to shift gears.
const float Driver::SHIFT_MARGIN = 4.0;						///< [m/s] Avoid oscillating gear changes.
const float Driver::ABS_SLIP = 2.0;							///< [m/s] range [0..10]
const float Driver::ABS_RANGE = 5.0;						///< [m/s] range [0..10]
const float Driver::ABS_MINSPEED = 3.0;						///< [m/s] Below this speed the ABS is disabled (numeric, division by small numbers).
const float Driver::TCL_SLIP = 2.0;							///< [m/s] range [0..10]
const float Driver::TCL_RANGE = 10.0;						///< [m/s] range [0..10]
const float Driver::LOOKAHEAD_CONST = 17.0;					///< [m]
const float Driver::LOOKAHEAD_FACTOR = 0.33;				///< [-]
const float Driver::WIDTHDIV = 3.0;							///< [-] Defines the percentage of the track to use (2/WIDTHDIV).
const float Driver::SIDECOLL_MARGIN = 3.0;					///< [m] Distance between car centers to avoid side collisions.
const float Driver::BORDER_OVERTAKE_MARGIN = 0.5;			///< [m]
const float Driver::OVERTAKE_OFFSET_SPEED = 1.0;			///< [m/s] Offset change speed.
const float Driver::PIT_LOOKAHEAD = 6.0;					///< [m] Lookahead to stop in the pit.
const float Driver::PIT_BRAKE_AHEAD = 200.0;				///< [m] Workaround for "broken" pitentries.
const float Driver::PIT_MU = 0.4;							///< [-] Friction of pit concrete.
const float Driver::MAX_SPEED = 84.0;						///< [m/s] Speed to compute the percentage of brake to apply.
const float Driver::MAX_FUEL_PER_METER = 0.0008;			///< [liter/m] fuel consumtion.
const float Driver::CLUTCH_SPEED = 5.0;						///< [m/s]
const float Driver::CENTERDIV = 0.1;						///< [-] (factor) [0.01..0.6].
const float Driver::DISTCUTOFF = 200.0;						///< [m] How far to look, terminate while loops.
const float Driver::MAX_INC_FACTOR = 5.0;					///< [m] Increment faster if speed is slow [1.0..10.0].
const float Driver::CATCH_FACTOR = 10.0;					///< [-] select MIN(catchdist, dist*CATCH_FACTOR) to overtake.
const float Driver::CLUTCH_FULL_MAX_TIME = 1.0;				///< [s] Time to apply full clutch.
const float Driver::USE_LEARNED_OFFSET_RANGE = 0.2;			///< [m] if offset < this use the learned stuff
const float Driver::ACCELERATOR_LETGO_TIME = 0.2;           ///< [s] Time to let go of accelerator before braking.
const float Driver::MIN_BRAKE_FOLLOW_DISTANCE = 0.5;        ///< [m] Predicted minimum distance from next opponent to apply full brake
const float Driver::MAX_BRAKE_FOLLOW_DISTANCE = 1.0;        ///< [m] Predicted minimum distance from next opponent to start applying brake.
const float Driver::FILTER_STEER_FEEDBACK = 0.8;        ///< [-] Feedback from steering to steer filter.
const float Driver::FILTER_PREDICT_FEEDBACK = 0.0;        ///< [-] Feedback from prediction error to steer filter.
const float Driver::FILTER_TARGET_FEEDBACK = 0.2;        ///< [-] Feedback from target error to steer filter.
const bool Driver::USE_NEW_ALPHA=false;  ///< Use actual trajectory..
#if 0
Cardata *Driver::cardata = NULL;
#endif
double Driver::currentsimtime;


Driver::Driver(int index)
{
	INDEX = index;
	seg_alpha = NULL;
	seg_alpha_new = NULL;
	u_toleft = 0.0;
	u_toright = 0.0;
	prev_toleft = 0.0;
	prev_toright = 0.0;
	prev_steer = 0.0;
}


Driver::~Driver()
{
	
	//ShowPaths();


	// Do not save learnt stuff from race itself.
	// We save only for practice and qualifying.
/*
	if (race_type!=RM_TYPE_RACE) {
		char* fname = make_message("drivers/olethros/%d/%s.brain", INDEX, track->name);
		learn->saveParameters (fname);
		free (fname);
	}
*/
#if 0
	printf ("# BEGIN ~Driver() dump\n");
	for (int i=0; i<track->nseg; i++, seg=seg->next) {
		printf ("%d %.1f %.1f %1.f %2.f\n", seg->id,
				radius[seg->id],
				ideal_radius[seg->id],
				learn->getRadius(seg),
				learn->predictedAccel(seg));
	}
	printf ("# END ~Driver() dump\n");
#endif

	delete opponents;
	delete pit;
	delete [] radius;
	delete [] ideal_radius;
	delete [] seg_alpha;
	delete [] seg_alpha_new;
	delete learn;
	delete strategy;
#if 0
	if (cardata != NULL) {
		delete cardata;
		cardata = NULL;
	}
#endif
}


/// Called for every track change or new race.
void Driver::initTrack(tTrack* t, void *carHandle, void **carParmHandle, tSituation *s)
{
	track = t;

	const int BUFSIZE = 256;
	char buffer[BUFSIZE];
	// Load a custom setup if one is available.
	// Get a pointer to the first char of the track filename.
	char* trackname = strrchr(track->filename, '/') + 1;

	switch (s->_raceType) {
		case RM_TYPE_PRACTICE:
			snprintf(buffer, BUFSIZE, "drivers/olethros/%d/practice/%s", INDEX, trackname);
			break;
		case RM_TYPE_QUALIF:
			snprintf(buffer, BUFSIZE, "drivers/olethros/%d/qualifying/%s", INDEX, trackname);
			break;
		case RM_TYPE_RACE:
			snprintf(buffer, BUFSIZE, "drivers/olethros/%d/race/%s", INDEX, trackname);
			break;
		default:
			break;
	}

	//printf ("Trying %s\n", buffer);
	*carParmHandle = GfParmReadFile(buffer, GFPARM_RMODE_STD);

	if (*carParmHandle == NULL) {
		snprintf(buffer, BUFSIZE, "drivers/olethros/%d/default.xml", INDEX);
		//printf ("LOADING: %s\n", buffer);
		*carParmHandle = GfParmReadFile(buffer, GFPARM_RMODE_STD);
    } else {
		//printf ("LOADING: %s\n", buffer);
	}

	// Create a pit stop strategy object.
	if (s->_raceType == RM_TYPE_RACE) {
		strategy = new ManagedStrategy();
	} else {
		strategy = new SimpleStrategy();
	}

	// Init fuel.
	strategy->setFuelAtRaceStart(t, carParmHandle, s);

	// Load and set parameters.
	MU_FACTOR = GfParmGetNum(*carParmHandle, OLETHROS_SECT_PRIV, OLETHROS_ATT_MUFACTOR, (char*)NULL, 0.69);

}


/// Start a new race.
void Driver::newRace(tCarElt* car, tSituation *s)
{
	float deltaTime = RCM_MAX_DT_ROBOTS;
	MAX_UNSTUCK_COUNT = int(UNSTUCK_TIME_LIMIT/deltaTime);
	OVERTAKE_OFFSET_INC = OVERTAKE_OFFSET_SPEED*deltaTime;
	stuck = 0;
	alone = 1;
	clutchtime = 0.0;
	oldlookahead = 0.0;
	u_toleft = 0.0;
	u_toright = 0.0;
	prev_toleft = 0.0;
	prev_toright = 0.0;
	prev_steer = 0.0;
	this->car = car;
	CARMASS = GfParmGetNum(car->_carHandle, SECT_CAR, PRM_MASS, NULL, 1000.0);
	myoffset = 0.0;
	initCa();
	initCw();
	initTireMu();
	initTCLfilter();


	ideal_radius = new float[track->nseg];
	prepareTrack();

	// Create just one instance of cardata shared by all drivers.
#if 0
	if (cardata == NULL) {
		cardata = new Cardata(s);
	}
#else
	Cardata::Instance()->initialise(s);
#endif
	mycardata = Cardata::Instance()->findCar(car);
	currentsimtime = s->currentTime;

	// initialize the list of opponents.
	opponents = new Opponents(s, this, Cardata::Instance());
	opponent = opponents->getOpponentPtr();

	// Initialize radius of segments.
	radius = new float[track->nseg];
	computeRadius(radius);

	learn = new SegLearn(track);

	// create the pit object.
	pit = new Pit(s, this);

	// save race type - to be eaten^H^H^H^H used later perhaps
	race_type = s->_raceType;

	// If we are not practicing, we read old parameters,
	// otherwise we start from scratch.
	if (race_type!=RM_TYPE_PRACTICE) {
		char* fname = make_message("drivers/olethros/%d/%s.brain", INDEX, track->name);
		//char* fname = make_message("%s.brain", track->name);
		learn->loadParameters (fname);
		free (fname);
	}

}


/// Drive during race.
void Driver::drive(tSituation *s)
{
	memset(&car->ctrl, 0, sizeof(tCarCtrl));

	update(s);
	if (0)
	{
		tTrackSeg* segment = car->_trkPos.seg;
		if (radius[segment->id]!=FLT_MAX) {
			//printf ("%f ", radius[segment->id]);
			//printf ("%f\n", ideal_radius[segment->id]);
		}
	}
	//pit->setPitstop(true); // uncomment to test pitstops

	if (isStuck()) {
		car->_steerCmd = -mycardata->getCarAngle() / car->_steerLock;
		car->_gearCmd = -1;		// Reverse gear.
		car->_accelCmd = 1.0;	// 100% accelerator pedal.
		car->_brakeCmd = 0.0;	// No brakes.
		car->_clutchCmd = 0.0;	// Full clutch (gearbox connected with engine).
	} else {
		float steer = filterSColl(getSteer()-.1*learn->predictedError(car));
		//float gamma_steer = exp(-.1*fabs(getSpeed())*dt); 
		//prev_steer = prev_steer * (1-gamma_steer) + gamma_steer * steer;
		car->_steerCmd = steer;//prev_steer;
		car->_gearCmd = getGear();
		float fbrake = filterBrakeSpeed(getBrake());
		float faccel = getAccel();

		float accel = faccel - fbrake;
		//printf ("(%f %f) %f ", faccel, fbrake, accel);
		float trk_accel;
		if (pit->getInPit()) {
			trk_accel = accel;
		} else {
			trk_accel = filterTrk(s, accel);
		}
		if (0) {
			fbrake -= .1 * trk_accel;
			faccel += .1 * trk_accel;
		}
#if 1
		if (trk_accel > 0) {
			faccel = trk_accel;
			fbrake = 0;
		} else {
			fbrake = -trk_accel;
			faccel = 0;
		}
#endif
		fbrake = filterABS(filterBColl(filterBPit(fbrake)));
		faccel = filterTCL(filterAPit(faccel));
		if (fbrake > 0) {
			trk_accel = -fbrake;
		} else {
			trk_accel = faccel;
		}

		//trk_accel = faccel-fbrake;
		
		//printf ("%f\n", trk_accel);
		if (trk_accel >= 0) {
			car->_accelCmd = trk_accel;
			car->_brakeCmd = 0.0;
		} else {
			car->_accelCmd = 0.0;
			car->_brakeCmd = -trk_accel;
		}

		car->_clutchCmd = getClutch();

		//float mu = segptr->surface->kFriction;
		if (car->priv.collision) {

			//printf ("Collision, not adjusting (%d %f)\n",
			//car->_laps, s->currentTime);
			learn->AdjustFriction(car->_trkPos.seg, G, mass,CA, CW,getSpeed(), car->_brakeCmd, 0.0);
			car->priv.collision = 0;
		} else if (alone) {
			if (car->_accelCmd > 0) {
				float ratio =  0.0001*car->_engineMaxTq*car->_gearRatio[car->_gear + car->_gearOffset];
				//printf ("%f %f\n", car->_engineMaxTq, ratio);
				learn->AdjustFriction(car->_trkPos.seg, G, mass,CA, CW,getSpeed(), -car->_accelCmd * ratio, 0.1);
			} else {
				learn->AdjustFriction(car->_trkPos.seg, G, mass,CA, CW,getSpeed(), car->_brakeCmd, 1.0);
			}
		} else {
			learn->AdjustFriction(car->_trkPos.seg, G, mass,CA, CW,getSpeed(), car->_brakeCmd, 0.0);
		}
		//printf ("%f %f\n", car->_steerCmd, learn->predictedError(car));
	}
}


/// Set pitstop commands.
int Driver::pitCommand(tSituation *s)
{
	car->_pitRepair = strategy->pitRepair(car, s);
	car->_pitFuel = strategy->pitRefuel(car, s);
	// This should be the only place where the pit stop is set to false!
	pit->setPitstop(false);
	return ROB_PIT_IM; // return immediately.
}


/// End of the current race.
void Driver::endRace(tSituation *s)
{
	// Nothing at the moment.
}


/***************************************************************************
 *
 * utility functions
 *
***************************************************************************/

/// Pre-compute the radius of all curves
void Driver::computeRadius(float *radius)
{
	float lastturnarc = 0.0;
	int lastsegtype = TR_STR;

	tTrackSeg *currentseg, *startseg = track->seg;
	currentseg = startseg;

	do {
		if (currentseg->type == TR_STR) {
			lastsegtype = TR_STR;
			if (isnan(ideal_radius[currentseg->id]) || 
				ideal_radius[currentseg->id]>10000) {
				ideal_radius[currentseg->id] = 10000;
			}
			//printf ("%d : %1.f\n", currentseg->id, ideal_radius[currentseg->id]);
			radius[currentseg->id] = ideal_radius[currentseg->id];
		} else {
			if (currentseg->type != lastsegtype) {
				float arc = 0.0;
				tTrackSeg *s = currentseg;
				lastsegtype = currentseg->type;

				while (s->type == lastsegtype && arc < PI/2.0) {
					arc += s->arc;
					s = s->next;
				}
				lastturnarc = arc/(PI/2.0);
			}
			radius[currentseg->id] = (currentseg->radius + currentseg->width/2.0)/lastturnarc;
#if 0
			printf ("%d:%.1f %.1f\n", currentseg->id,
								radius[currentseg->id],
								ideal_radius[currentseg->id]);
#endif
			if (isnan(ideal_radius[currentseg->id]) || 
				ideal_radius[currentseg->id]>10000) {
				ideal_radius[currentseg->id] = 10000;
			}
			radius[currentseg->id] =
				MAX(radius[currentseg->id],ideal_radius[currentseg->id]);
		}
		currentseg = currentseg->next;
	} while (currentseg != startseg);

}


/// Compute the allowed speed on a segment.
float Driver::getAllowedSpeed(tTrackSeg *segment)
{
	float mu = segment->surface->kFriction*TIREMU*MU_FACTOR;
	float r = radius[segment->id];
	float dr = learn->getRadius(segment);
	if (((alone > 0) && (fabs(myoffset) < USE_LEARNED_OFFSET_RANGE))
		|| pit->getInPit())
		 {
		if (dr>-.5*r) {
				r += dr;
		}
		
	} else {
		//printf ("%f %f %f %f ", r, dr, myoffset, (1-tanh(0.1*(fabs(myoffset)))));
		//printf ("%d : ", segment->id);
		if (dr>=-.5*r) {
			r += dr * (1-tanh(fabs(myoffset)));
			//printf ("off: %.2f :", myoffset);//1-tanh(fabs(myoffset/USE_LEARNED_OFFSET_RANGE))));
		}
		float alpha = 2*fabs(myoffset) / segment->width;
		alpha = MIN (1, alpha);
		alpha = MAX (0, alpha);
		r = alpha * segment->radius + (1-alpha) * r;
		//r -= fabs(myoffset) * r / segment->width;
		//printf ("%.1f | R %.1f | r+dr %.2f | IR %.1f\n",
		//				r, radius[segment->id], radius[segment->id]+dr,
		//				ideal_radius[segment->id]);
		// * (1-tanh(0.1*(fabs(myoffset)- USE_LEARNED_OFFSET_RANGE)));
	}


	r *= exp(0.1*learn->predictedAccel (segment));
	float ay= 0.5*(segment->angle[TR_YL] + segment->angle[TR_YR]);
	float ny= 0.5*(segment->next->angle[TR_YL] + segment->next->angle[TR_YR]);
	float py= 0.5*(segment->prev->angle[TR_YL] + segment->prev->angle[TR_YR]);
	float l = segment->length;
	float derp = (sin(ay)-sin(py));
	float dern = (sin(ny)-sin(ay));
	float der = .5*(dern+derp)/l;
	float adj = 1 + tanh(0.1*car->_speed_x * der);

	float bank = 0.5 * (segment->angle[TR_XS] + segment->angle[TR_XE]);
#if 1
	if (segment->type==TR_STR) {
		adj *= cos(bank);
	} else if (segment->type==TR_LFT) {
		adj *= 1 + tanh(-bank);
	} else {
		adj *= 1 + tanh(bank);
	}
#endif
	mu *= adj;
	float n_speed =  sqrt((mu*G*r)/(1.0 - MIN(1.0, r*CA*mu/mass)));
	return n_speed;
}


// Compute the length to the end of the segment.
float Driver::getDistToSegEnd()
{
	if (car->_trkPos.seg->type == TR_STR) {
		return car->_trkPos.seg->length - car->_trkPos.toStart;
	} else {
		return (car->_trkPos.seg->arc - car->_trkPos.toStart)*car->_trkPos.seg->radius;
	}
}


/// Compute fitting acceleration.
float Driver::getAccel()
{
	if (car->_gear > 0) {
		float allowedspeed = getAllowedSpeed(car->_trkPos.seg);
		if (1)
		{
			tTrackSeg *segptr = car->_trkPos.seg;
			float mu = segptr->surface->kFriction;
			float maxlookaheaddist = currentspeedsqr/(2.0*mu*G);
			float lookaheaddist = getDistToSegEnd();
			
			segptr = segptr->next;
			while (lookaheaddist < maxlookaheaddist) {
				float pallowedspeed = getAllowedSpeed(segptr);
				float delta = (brakedist(pallowedspeed, mu) - lookaheaddist);
				//printf("%f\n", delta);
				float u = MAX(1,getSpeed());
				float t = ACCELERATOR_LETGO_TIME;
				if (-delta/u<t) {
					if (pallowedspeed < allowedspeed) {
						allowedspeed = pallowedspeed;
					}
				}
				lookaheaddist += segptr->length;
				segptr = segptr->next;
			}
		}


		float delta = allowedspeed - (car->_speed_x + FULL_ACCEL_MARGIN);
		float alpha = 0.5;
		float lambda = 2.0;
		//printf ("%.1f ", delta);
		if (delta>0) {
			if (delta<lambda) {
				float acc = alpha + (1-alpha)*delta/lambda;
				//printf ("ac:%f\n", acc);
				return acc;
			}
			//printf ("ac:1\n");
			return 1.0;//tanh(delta);
		} else {
			float acc = alpha*(1+delta/FULL_ACCEL_MARGIN);
			if (acc<0) acc = 0;
			//printf ("at:%f\n", acc);
			return acc;
		}
	} else {
		return 1.0;
	}
}


/// If we get lapped reduce accelerator.
float Driver::filterOverlap(float accel)
{
	int i;
	for (i = 0; i < opponents->getNOpponents(); i++) {
		if (opponent[i].getState() & OPP_LETPASS) {
			return MIN(accel, 0.5);
		}
	}
	return accel;
}


/// Compute initial brake value.
float Driver::getBrake()
{
	// Car drives backward?
	if (car->_speed_x < -MAX_UNSTUCK_SPEED) {
		// Yes, brake.
		return 1.0;
	} else {
		// We drive forward, normal braking.
		tTrackSeg *segptr = car->_trkPos.seg;
		float mu = segptr->surface->kFriction;
		float maxlookaheaddist = currentspeedsqr/(2.0*mu*G);
		float lookaheaddist = getDistToSegEnd();

		float allowedspeed = getAllowedSpeed(segptr);
		if (allowedspeed < car->_speed_x) {
			float delta = (0.5*(car->_speed_x - allowedspeed)/FULL_ACCEL_MARGIN);
			//printf ("em:%f\n", delta);
			return (tanh(delta));
			//return MIN(1.0, (car->_speed_x-allowedspeed)/(FULL_ACCEL_MARGIN));
		}

		segptr = segptr->next;
		while (lookaheaddist < maxlookaheaddist) {
			allowedspeed = getAllowedSpeed(segptr);
			if (allowedspeed < car->_speed_x) {
				float delta = (brakedist(allowedspeed, mu) - lookaheaddist);
				if (delta>0) {
					//printf ("pr:%f\n", delta);
					return tanh(0.1*delta);
				}
			}
			lookaheaddist += segptr->length;
			segptr = segptr->next;
		}
		return 0.0;
	}
}


/**
   \brief Compute gear.
   
   Gear is shifted upwards in two cases:

   1) When we almost reach the revs limiter.
   2) When the overall output torque by shifting upwards will be greater than the current overall output torque.

   Gear is shifted down when our revs by shifting down would be
   somewhat below the red line at the current speed.
   
*/
int Driver::getGear()
{
	if (car->_gear <= 0) {
		return 1;
	}
	float gr_up = car->_gearRatio[car->_gear + car->_gearOffset];
	float omega = car->_enginerpmRedLine/gr_up;
	float wr = car->_wheelRadius(2);
	//float rpm = car->_enginerpm;
	int next_gear = car->_gear + 1;
	if (next_gear>car->_gearNb) {
		next_gear = car->_gear;
	}
	
	float next_ratio = car->_gearRatio[next_gear + car->_gearOffset];
	float next_rpm = next_ratio * car->_speed_x / wr;
	float rpm = gr_up * car->_speed_x / wr;//car->_enginerpm;
	if (omega*wr*SHIFT < car->_speed_x) {
		return car->_gear + 1;
	} else if (EstimateTorque(next_rpm)*next_ratio > EstimateTorque(rpm)*gr_up) {
		return car->_gear + 1;
	} else {
		float gr_down = car->_gearRatio[car->_gear + car->_gearOffset - 1];
		float prev_rpm = gr_down * (car->_speed_x + SHIFT_MARGIN) / wr;

		if (EstimateTorque (prev_rpm) * gr_down
			> EstimateTorque (rpm) * gr_up) {
			return car->_gear - 1;
		}
		//omega = car->_enginerpmRedLine/gr_down;
		//omega = MIN(prev_rpm, car->_enginerpmRedLine)* SHIFT;
		//if (car->_gear > 1 && omega*wr*SHIFT > car->_speed_x + SHIFT_MARGIN) {
		//			return car->_gear - 1;
		//	}
	}
	return car->_gear;
}

/**
   \brief Estimate torque from max torque and max power ratings.

   Uses a piecewise linear model to estimate torque, given the value
   of torque at the max torque and power points and assuming that the
   torque drops to 0 at 0 revs and that it decays linearly after the
   maximum power at a rate 4 times than that of the decay between
   maximum torque and maximum power.
 */
float Driver::EstimateTorque (float rpm)
{
	float TqAtMaxPw = car->_engineMaxPw/car->_enginerpmMaxPw;
	//float rate = (car->_engineMaxTq-TqAtMaxPw)
	// (car->_enginerpmMaxPw-car->_enginerpmMaxTq);
	//float TqAtMaxRevs = TqAtMaxPw -
	//		fabs(rate*4) * (car->_enginerpmMax - car->_enginerpmMaxPw);
	// or otherwsise estimate Tq at max revs as torque for having half the power
	//printf ("tq-estimated Tq at maxrevs: %f@%f\n", TqAtMaxRevs, car->_enginerpmMax);
	float PwAtMaxRevs = .8*car->_engineMaxPw;
	float TqAtMaxRevs = PwAtMaxRevs/car->_enginerpmMax;
	//printf ("pw-estimated Tq at maxrevs: %f@%f\n", TqAtMaxRevs, car->_enginerpmMax);

	float t [] = {
		0.0,
		car->_engineMaxTq,
		TqAtMaxPw,
		TqAtMaxRevs,
		0.0
	};
	float a [] = {		
		0.0,
		car->_enginerpmMaxTq,
		car->_enginerpmMaxPw,
		car->_enginerpmMax,
		car->_enginerpmMax*2
	};
	int N = 5;
	for (int i=0; i<N - 1; i++) {
		if (rpm>=a[i] && rpm<=a[i+1]) {
			float d = a[i+1]-a[i];
			float dr = rpm - a[i];
			float D = dr/d;
			return t[i] * (1-D) + D * t[i+1];
		}
	}
	// if rpm < 0, or rpm >maxrpm
	return 0.0;
}

/// Compute steer value.
float Driver::getSteer()
{
	float targetAngle;
	float avoidance = 0.0;
	
	if (!pit->getInPit()) {
		if (car->_trkPos.toRight<car->_dimension_y) {
			avoidance = tanh(0.1*(car->_dimension_y - car->_trkPos.toRight));
		} else 	if (car->_trkPos.toLeft<car->_dimension_y) {
			avoidance = tanh(0.1*(car->_trkPos.toLeft - car->_dimension_y));
		}
	}
	v2d target = getTargetPoint();

	targetAngle = atan2(target.y - car->_pos_Y, target.x - car->_pos_X);
	//	if (pit->getInPit()) {
	//		targetAngle *=2;
	//	}
	targetAngle -= car->_yaw;
#if 0
	tTrackSeg *seg = car->_trkPos.seg;
	if (seg->type == TR_LFT) {
		targetAngle += 0.2;
	} else if (seg->type == TR_RGT) {
		targetAngle -= 0.2;
	}
#endif
	NORM_PI_PI(targetAngle);
	return avoidance + targetAngle / car->_steerLock;
}


/// Compute the clutch value.
float Driver::getClutch()
{
	if (car->_gear > 1) {
		clutchtime = 0.0;
		return 0.0;
	} else {
		float drpm = car->_enginerpm - car->_enginerpmRedLine/2.0;
		clutchtime = MIN(CLUTCH_FULL_MAX_TIME, clutchtime);
		float clutcht = (CLUTCH_FULL_MAX_TIME - clutchtime)/CLUTCH_FULL_MAX_TIME;
		if (car->_gear == 1 && car->_accelCmd > 0.0) {
			clutchtime += RCM_MAX_DT_ROBOTS;
		}

		if (drpm > 0) {
			float speedr;
			if (car->_gearCmd == 1) {
				// Compute corresponding speed to engine rpm.
				float omega = car->_enginerpmRedLine/car->_gearRatio[car->_gear + car->_gearOffset];
				float wr = car->_wheelRadius(2);
				speedr = (CLUTCH_SPEED + MAX(0.0, car->_speed_x))/fabs(wr*omega);
				float clutchr = MAX(0.0, (1.0 - speedr*2.0*drpm/car->_enginerpmRedLine));
				return MIN(clutcht, clutchr);
			} else {
				// For the reverse gear.
				clutchtime = 0.0;
				return 0.0;
			}
		} else {
			return clutcht;
		}
	}
}

/// Compute target point for steering.
v2d Driver::getTargetPoint()
{
	tTrackSeg *seg = car->_trkPos.seg;
	float lookahead;
	float length = getDistToSegEnd();
	float offset = getOffset();
	if (pit->getInPit()) {
		// To stop in the pit we need special lookahead values.
		if (currentspeedsqr > pit->getSpeedlimitSqr()) {
			lookahead = PIT_LOOKAHEAD + car->_speed_x*LOOKAHEAD_FACTOR;
		} else {
			lookahead = PIT_LOOKAHEAD;
		}
	} else {
		// Usual lookahead.
		lookahead = LOOKAHEAD_CONST + car->_speed_x*LOOKAHEAD_FACTOR;
		// Prevent "snap back" of lookahead on harsh braking.
		float cmplookahead = oldlookahead - car->_speed_x*RCM_MAX_DT_ROBOTS;
		if (lookahead < cmplookahead) {
			lookahead = cmplookahead;
		}
	}

	oldlookahead = lookahead;

	// Search for the segment containing the target point.
	while (length < lookahead) {
		seg = seg->next;
		length += seg->length;
	}

	length = lookahead - length + seg->length;
	float fromstart = seg->lgfromstart;
	fromstart += length;


	float alpha, nalpha;
	if (USE_NEW_ALPHA) {
		alpha = seg_alpha_new[seg->id];
		nalpha = seg_alpha_new[seg->next->id];
	} else {
		alpha = seg_alpha[seg->id];
		nalpha = seg_alpha[seg->next->id];
	}

	float beta = length/seg->length;

	if (pit->getInPit()) {
		alpha = 0.5;
		nalpha = 0.5;
		beta  = 0.0;
	}

	// Compute the target point.
	offset = myoffset = pit->getPitOffset(offset, fromstart);

	v2d s;

	if (0) {
		s.x = (alpha*seg->vertex[TR_SL].x
			   + (1-alpha)*seg->vertex[TR_SR].x);
		
		s.y = (alpha*seg->vertex[TR_SL].y
				+(1-alpha)*seg->vertex[TR_SR].y);
	} else {
		s.x =(1-beta)*(alpha*seg->vertex[TR_SL].x
					   +(1-alpha)*seg->vertex[TR_SR].x)
			+beta*(nalpha*seg->vertex[TR_EL].x
				   +(1-nalpha)*seg->vertex[TR_ER].x);
		
		s.y =(1-beta)*(alpha*seg->vertex[TR_SL].y
					   +(1-alpha)*seg->vertex[TR_SR].y)
			+ beta*(nalpha*seg->vertex[TR_EL].y
					+(1-nalpha)*seg->vertex[TR_ER].y);
	}

	if ( seg->type == TR_STR) {
		float adj_offset = offset;
		v2d d, n;
		n.x = (seg->vertex[TR_EL].x - seg->vertex[TR_ER].x)/seg->length;
		n.y = (seg->vertex[TR_EL].y - seg->vertex[TR_ER].y)/seg->length;
		n.normalize();
		tTrackSeg* pseg = seg->prev;
		tTrackSeg* nseg = seg->next;
		float  nalpha;
		float  calpha;
		if (USE_NEW_ALPHA) {
			nalpha = seg_alpha_new[nseg->id];
			calpha = seg_alpha_new[seg->id];
		} else {
			nalpha = seg_alpha[nseg->id];
			calpha = seg_alpha[seg->id];
		}
		if (0){// !pit->getInPit()) { // or use '!' ?
			d.x = (seg->vertex[TR_EL].x - pseg->vertex[TR_SL].x)/seg->length;
			d.y = (seg->vertex[TR_EL].y - pseg->vertex[TR_SL].y)/seg->length;
		} else {
			// re-adjust offset
			adj_offset =  tanh(fabs(offset)) * ((0.5*seg->width + offset)-calpha*seg->width);
			if (pit->getInPit()) {
				adj_offset = offset;
			}

#if 1
			//adj_offset += (1-tanh(fabs(offset))) * (calpha-0.5)*seg->width;
			float startx = calpha * seg->vertex[TR_SL].x
				+ (1-calpha) * seg->vertex[TR_SR].x;
			float starty = calpha * seg->vertex[TR_SL].y
				+ (1-calpha) * seg->vertex[TR_SR].y;
			float endx = nalpha * seg->vertex[TR_EL].x
				+ (1-nalpha) * seg->vertex[TR_ER].x;
			float endy = nalpha * seg->vertex[TR_EL].y
				+ (1-nalpha) * seg->vertex[TR_ER].y;


			d.x = (endx - startx)/seg->length;
			d.y = (endy - starty)/seg->length;
#else
			d.x = (-calpha*seg->vertex[TR_SL].x
				   + nalpha * seg->vertex[TR_EL].x
				   - (1-calpha) * seg->vertex[TR_SR].x
				   + (1-nalpha) * seg->vertex[TR_ER].x)/seg->length;
			d.y = (-calpha * seg->vertex[TR_SL].y
				   + nalpha * seg->vertex[TR_EL].y
				   - (1-calpha) * seg->vertex[TR_SR].y
			   + (1-nalpha) * seg->vertex[TR_ER].y)/seg->length;
#endif
		}
		return s + d*length + adj_offset*n;
	} else {
		float calpha;
		if (USE_NEW_ALPHA) {
			calpha = seg_alpha_new[seg->id];
		} else {
			calpha = seg_alpha[seg->id];
		}
		// negative offset = right
		float adj_offset =  tanh(fabs(offset)) * ((0.5*seg->width + offset)-calpha*seg->width);
		//adj_offset += (1-tanh(fabs(offset))) * (calpha-0.5)*seg->width;
		v2d c, n;
		c.x = seg->center.x;
		c.y = seg->center.y;
		float arc = length/seg->radius;
		float arcsign = (seg->type == TR_RGT) ? -1.0 : 1.0;
		arc = arc*arcsign;
		s = s.rotate(c, arc);

		n = c - s;
		n.normalize();
		return s + arcsign*adj_offset*n;
	}
}


/// Compute offset to normal target point for overtaking or let pass an opponent.
float Driver::getOffset()
{
	int i;
	float catchdist, mincatchdist = FLT_MAX, mindist = -1000.0;
	Opponent *o = NULL;

	// Increment speed dependent.
	float incfactor = MAX_INC_FACTOR - MIN(fabs(car->_speed_x)/MAX_INC_FACTOR, (MAX_INC_FACTOR-1.0));

	// Let overlap.
	for (i = 0; i < opponents->getNOpponents(); i++) {
		if (opponent[i].getState() & OPP_LETPASS) {
			// Behind, larger distances are smaller ("more negative").
			if (opponent[i].getDistance() > mindist) {
				mindist = opponent[i].getDistance();
				o = &opponent[i];
			}
		}
	}

	if (o != NULL) {
		tCarElt *ocar = o->getCarPtr();
		float side = car->_trkPos.toMiddle - ocar->_trkPos.toMiddle;
		float w = car->_trkPos.seg->width/WIDTHDIV-BORDER_OVERTAKE_MARGIN;
		if (side > 0.0) {
			if (myoffset < w) {
				myoffset += OVERTAKE_OFFSET_INC*incfactor;
			}
		} else {
			if (myoffset > -w) {
				myoffset -= OVERTAKE_OFFSET_INC*incfactor;
			}
		}
		return myoffset;
	}


	// Overtake.
	for (i = 0; i < opponents->getNOpponents(); i++) {
		if (opponent[i].getState() & OPP_FRONT) {
			catchdist = opponent[i].getCatchDist();//MIN(opponent[i].getCatchDist(), opponent[i].getDistance()*CATCH_FACTOR);
			if (getSpeed() > 0) {
				if (catchdist/getSpeed()<1.0) {
					if (catchdist < mincatchdist) {
						mincatchdist = catchdist;
						o = &opponent[i];
					}
				}
			}
		}
	}

	if (o != NULL) {
		// Compute the width around the middle which we can use for overtaking.
		float w = o->getCarPtr()->_trkPos.seg->width/WIDTHDIV-BORDER_OVERTAKE_MARGIN;
		// Compute the opponents distance to the middle.
		float otm = o->getCarPtr()->_trkPos.toMiddle;
		// Define the with of the middle range.
		float wm = o->getCarPtr()->_trkPos.seg->width*CENTERDIV;

		if (otm > wm && myoffset > -w) {
			myoffset -= OVERTAKE_OFFSET_INC*incfactor;
		} else if (otm < -wm && myoffset < w) {
			myoffset += OVERTAKE_OFFSET_INC*incfactor;
		} else {
			// If the opponent is near the middle we try to move the offset toward
			// the inside of the expected turn.
			// Try to find out the characteristic of the track up to catchdist.
			tTrackSeg *seg = car->_trkPos.seg;
			float length = getDistToSegEnd();
			float oldlen, seglen = length;
			float lenright = 0.0, lenleft = 0.0;
			mincatchdist = MIN(mincatchdist, DISTCUTOFF);

			do {
				switch (seg->type) {
				case TR_LFT:
					lenleft += seglen;
					break;
				case TR_RGT:
					lenright += seglen;
					break;
				default:
					// Do nothing.
					break;
				}
				seg = seg->next;
				seglen = seg->length;
				oldlen = length;
				length += seglen;
			} while (oldlen < mincatchdist);

			// If we are on a straight look for the next turn.
			if (lenleft == 0.0 && lenright == 0.0) {
				while (seg->type == TR_STR) {
					seg = seg->next;
				}
				// Assume: left or right if not straight.
				if (seg->type == TR_LFT) {
					lenleft = 1.0;
				} else {
					lenright = 1.0;
				}
			}

			// Because we are inside we can go to the border.
			float maxoff = (o->getCarPtr()->_trkPos.seg->width - car->_dimension_y)/2.0-BORDER_OVERTAKE_MARGIN;
			if (lenleft > lenright) {
				if (myoffset < maxoff) {
					myoffset += OVERTAKE_OFFSET_INC*incfactor;
				}
			} else {
				if (myoffset > -maxoff) {
					myoffset -= OVERTAKE_OFFSET_INC*incfactor;
				}
			}
		}
	} else {
		// There is no opponent to overtake, so the offset goes slowly back to zero.
		float a = 1.0;
		if (myoffset > a*OVERTAKE_OFFSET_INC) {
			myoffset -= a*OVERTAKE_OFFSET_INC;
			//myoffset= 0.0;
		} else if (myoffset < -a*OVERTAKE_OFFSET_INC) {
			myoffset += a*OVERTAKE_OFFSET_INC;
			//myoffset= 0.0;
		} else {
			myoffset = 0.0;
		}
	}

	return myoffset;
}


/// Update my private data every timestep.
void Driver::update(tSituation *s)
{
	// Update global car data (shared by all instances) just once per timestep.
	if (currentsimtime != s->currentTime) {
		dt = s->currentTime - currentsimtime;
		currentsimtime = s->currentTime;
		Cardata::Instance()->update();
	}

	// Update the local data rest.
	speedangle = mycardata->getTrackangle() - atan2(car->_speed_Y, car->_speed_X);
	NORM_PI_PI(speedangle);
	mass = CARMASS + car->_fuel;
	currentspeedsqr = car->_speed_x*car->_speed_x;
	opponents->update(s, this);
	strategy->update(car, s);
	if (!pit->getPitstop()) {
		pit->setPitstop(strategy->needPitstop(car, s, opponents));
	}
	pit->update();
	alone = isAlone();

	learn->update(s, track, car, alone, myoffset, car->_trkPos.seg->width/WIDTHDIV-BORDER_OVERTAKE_MARGIN, radius, seg_alpha[car->_trkPos.seg->id]);
}

/// Check if we are alone
int Driver::isAlone()
{
	int i;
	for (i = 0; i < opponents->getNOpponents(); i++) {
		if (opponent[i].getState() & (OPP_COLL | OPP_LETPASS)) {
			return 0;	// Not alone.
		}
	}
	return 1;	// Alone.
}


/// Check if I'm stuck.
bool Driver::isStuck()
{
	if (fabs(mycardata->getCarAngle()) > MAX_UNSTUCK_ANGLE &&
		car->_speed_x < MAX_UNSTUCK_SPEED &&
		fabs(car->_trkPos.toMiddle) > MIN_UNSTUCK_DIST) {
		if (stuck > MAX_UNSTUCK_COUNT && car->_trkPos.toMiddle*mycardata->getCarAngle() < 0.0) {
			return true;
		} else {
			stuck++;
			return false;
		}
	} else {
		stuck = 0;
		return false;
	}
}


/// Compute aerodynamic downforce coefficient CA.
void Driver::initCa()
{
	char *WheelSect[4] = {SECT_FRNTRGTWHEEL, SECT_FRNTLFTWHEEL, SECT_REARRGTWHEEL, SECT_REARLFTWHEEL};
	float rearwingarea = GfParmGetNum(car->_carHandle, SECT_REARWING, PRM_WINGAREA, (char*) NULL, 0.0);
	float rearwingangle = GfParmGetNum(car->_carHandle, SECT_REARWING, PRM_WINGANGLE, (char*) NULL, 0.0);
	float wingca = 1.23*rearwingarea*sin(rearwingangle);

	float cl = GfParmGetNum(car->_carHandle, SECT_AERODYNAMICS, PRM_FCL, (char*) NULL, 0.0) +
			   GfParmGetNum(car->_carHandle, SECT_AERODYNAMICS, PRM_RCL, (char*) NULL, 0.0);
	float h = 0.0;
	int i;
	for (i = 0; i < 4; i++)
		h += GfParmGetNum(car->_carHandle, WheelSect[i], PRM_RIDEHEIGHT, (char*) NULL, 0.20);
	h*= 1.5; h = h*h; h = h*h; h = 2.0 * exp(-3.0*h);
	CA = h*cl + 4.0*wingca;
}


/// Compute aerodynamic drag coefficient CW.
void Driver::initCw()
{
	float cx = GfParmGetNum(car->_carHandle, SECT_AERODYNAMICS, PRM_CX, (char*) NULL, 0.0);
	float frontarea = GfParmGetNum(car->_carHandle, SECT_AERODYNAMICS, PRM_FRNTAREA, (char*) NULL, 0.0);
	CW = 0.645*cx*frontarea;
}


/// Init the friction coefficient of the the tires.
void Driver::initTireMu()
{
	char *WheelSect[4] = {SECT_FRNTRGTWHEEL, SECT_FRNTLFTWHEEL, SECT_REARRGTWHEEL, SECT_REARLFTWHEEL};
	float tm = FLT_MAX;
	int i;

	for (i = 0; i < 4; i++) {
		tm = MIN(tm, GfParmGetNum(car->_carHandle, WheelSect[i], PRM_MU, (char*) NULL, 1.0));
	}
	TIREMU = tm;
}


/// Reduces the brake value such that it fits the speed (more downforce -> more braking).
float Driver::filterBrakeSpeed(float brake)
{
	float weight = (CARMASS + car->_fuel)*G;
	float maxForce = weight + CA*MAX_SPEED*MAX_SPEED;
	float force = weight + CA*currentspeedsqr;
	return brake*force/maxForce;
}

/// Reduced
float Driver::filterAPit(float accel)
{
	if (pit->getPitstop() && !pit->getInPit()) {
		float dl, dw;
		RtDistToPit(car, track, &dl, &dw);
		if (dl < PIT_BRAKE_AHEAD) {
			float mu = car->_trkPos.seg->surface->kFriction*TIREMU*PIT_MU;
			accel = tanh(0.1*(dl-brakedist(0.0, mu)));
			if (accel < 0) {
				accel = 0;
			}
		}
	}

	if (pit->getInPit()) {
		float s = pit->toSplineCoord(car->_distFromStartLine);
		if (pit->getPitstop() || s < pit->getNPitEnd()) { 
			float delta =  pit->getSpeedlimit() - getSpeed();
			if (delta>0) {
				accel = tanh(delta);
			}
		}
	}
	return accel;
}

// Brake filter for pit stop.
float Driver::filterBPit(float brake)
{
	if (pit->getPitstop() && !pit->getInPit()) {
		float dl, dw;
		RtDistToPit(car, track, &dl, &dw);
		if (dl < PIT_BRAKE_AHEAD) {
			float mu = car->_trkPos.seg->surface->kFriction*TIREMU*PIT_MU;
			float bd = brakedist(0.0, mu);
			if (bd > dl) {
				//printf ("Brakeahead\n");
				return tanh((bd-dl));
			}
		}
	}

	if (pit->getInPit()) {
		float s = pit->toSplineCoord(car->_distFromStartLine);
		// Pit entry.
		if (pit->getPitstop()) {
			float mu = car->_trkPos.seg->surface->kFriction*TIREMU*PIT_MU;
			if (s < pit->getNPitStart()) {
				// Brake to pit speed limit.
				float dist = pit->getNPitStart() - s;
				float b =  (brakedist(pit->getSpeedlimit(), mu) - dist);
				if (b > 0) {
					return tanh(b);
				}
			} else {
				// Hold speed limit.
				if (currentspeedsqr > pit->getSpeedlimitSqr()) {
					return pit->getSpeedLimitBrake(currentspeedsqr);
				}
			}
			// Brake into pit (speed limit 0.0 to stop)
			float dist = pit->getNPitLoc() - s;
			if (pit->isTimeout(dist)) {
				pit->setPitstop(false);
				return 0.0;
			} else {
				if (brakedist(0.0, mu) > dist) {
					float bd = brakedist(0.0,mu)-dist;
					return tanh(bd);
					//return 1.0;
				} else if (s > pit->getNPitLoc()) {
					// Stop in the pit.
			 		return 1.0;
				}
			}
		} else {
			// Pit exit.
			if (s < pit->getNPitEnd()) {
				// Pit speed limit.
				if (currentspeedsqr > pit->getSpeedlimitSqr()) {
					return pit->getSpeedLimitBrake(currentspeedsqr);
				}
			}
		}
	}

	return brake;
}


/**
   Brake filter for collision avoidance.
   
   Given \f$u_0\f$, \f$u_t\f$, the velocities of our car and the
   opponent's, and the distance \f$d\f$ between each we calculate
   \f$s\f$, the minimum distance necessary to brake down to the
   opponent's velocity. It will take us \f$t\f$ seconds
   to perform this braking:
   \f[
   t = \frac{2s}{u_0+u_t}.
   \f]
   We also calculate the time to hit the other car if we do not brake.
   \f[
   t' = \frac{d}{u_0-u_t}
   \f]
   
   We then determine if we will be crashing or not by simply calculating
   \f[
   d_t = d + u_t t - s,
   \f]
   which is simply our current separation, plus the distance that will
   be travelled by the opponent, minus the distance that will be
   travelled by us. This quantity shows the minimum distance that we
   will ever have from the opponent if we hit the brakes now. 
   
   We define two constants related to \f$d_t\f$, \c
   MAX_BRAKE_FOLLOW_DISTANCE and \c MIN_BRAKE_FOLLOW_DISTANCE which
   determine the range we should keep from cars ahead of us.
   
*/

float Driver::filterBColl(float brake)
{
	float mu = car->_trkPos.seg->surface->kFriction;
	int i;
	float maxbrake = brake;
	for (i = 0; i < opponents->getNOpponents(); i++) {
		if (opponent[i].getState() & OPP_COLL) {
			float ut = opponent[i].getSpeed();
			float u0 = getSpeed();
			if (ut<u0) {
				float d = opponent[i].getDistance();
				float s = brakedist(opponent[i].getSpeed(), mu);
				float t = 2*s/(u0+ut);
				//float t_impact = d/(u0-ut);
				float dt = d + ut*t - s;

				float y = -1;
				if (dt<MAX_BRAKE_FOLLOW_DISTANCE) {
					y = 1 - (dt-MIN_BRAKE_FOLLOW_DISTANCE)/(MAX_BRAKE_FOLLOW_DISTANCE-MIN_BRAKE_FOLLOW_DISTANCE);
					if (y>0) {
						maxbrake = SmoothMaxGamma (y, maxbrake, 0.5, 100.0);
					}
				}
			}
		}
	}
	return maxbrake;
}


/// Steer filter for collision avoidance.
float Driver::filterSColl(float steer)
{
	int i;
	float sidedist = 0.0, fsidedist = 0.0, minsidedist = FLT_MAX;
	Opponent *o = NULL;

	// Get the index of the nearest car (o).
	for (i = 0; i < opponents->getNOpponents(); i++) {
		if (opponent[i].getState() & OPP_SIDE) {
			sidedist = opponent[i].getSideDist();
			fsidedist = fabs(sidedist);
			if (fsidedist < minsidedist) {
				minsidedist = fsidedist;
				o = &opponent[i];
			}
		}
	}

	// If there is another car handle the situation.
	if (o != NULL) {
		float d = fsidedist - o->getWidth();
		// Near, so we need to look at it.
		if (d < SIDECOLL_MARGIN) {
			/* compute angle between cars */
			tCarElt *ocar = o->getCarPtr();
			float diffangle = ocar->_yaw - car->_yaw;
			NORM_PI_PI(diffangle);
			// We are near and heading toward the car.
			if (diffangle*o->getSideDist() < 0.0) {
				const float c = SIDECOLL_MARGIN/2.0;
				d = d - c;
				if (d < 0.0) {
					d = 0.0;
				}

				float psteer = diffangle/car->_steerLock;
				myoffset = car->_trkPos.toMiddle;

				float w = o->getCarPtr()->_trkPos.seg->width/WIDTHDIV-BORDER_OVERTAKE_MARGIN;
				if (fabs(myoffset) > w) {
					myoffset = (myoffset > 0.0) ? w : -w;
				}

				// Who is outside?
				if (car->_trkPos.seg->type == TR_STR) {
					if (fabs(car->_trkPos.toMiddle) > fabs(ocar->_trkPos.toMiddle)) {
						psteer = steer*(d/c) + 1.5*psteer*(1.0-d/c);
					} else {
						psteer = steer*(d/c) + 2.0*psteer*(1.0-d/c);
					}
				} else {
					float outside = car->_trkPos.toMiddle - ocar->_trkPos.toMiddle;
					float sign = (car->_trkPos.seg->type == TR_RGT) ? 1.0 : -1.0;
					if (outside*sign > 0.0) {
						psteer = steer*(d/c) + 1.5*psteer*(1.0-d/c);
					} else {
						psteer = steer*(d/c) + 2.0*psteer*(1.0-d/c);
					}
				}

				if (psteer*steer > 0.0 && fabs(steer) > fabs(psteer)) {
					return steer;
				} else {
					return psteer;
				}
			}
		}
	}
	return steer;
}


/// Antilocking filter for brakes.
float Driver::filterABS(float brake)
{
	if (car->_speed_x < ABS_MINSPEED) return brake;
	int i;
	float slip = 0.0;
	for (i = 0; i < 4; i++) {
		slip += car->_wheelSpinVel(i) * car->_wheelRadius(i);
	}
	slip = car->_speed_x - slip/4.0;
	if (slip > ABS_SLIP) {
		brake = brake - MIN(brake, (slip - ABS_SLIP)/ABS_RANGE);
	}
	return brake;
}


/// TCL filter for accelerator pedal.
float Driver::filterTCL(float accel)
{
	float slip = (this->*GET_DRIVEN_WHEEL_SPEED)() - car->_speed_x;
	TCL_status = 0.75 * TCL_status;
	if (TCL_status < 0.1) TCL_status = 0.0;
	if (slip > TCL_SLIP) {
		TCL_status +=  0.5 * (slip - TCL_SLIP)/TCL_RANGE;
	}
	accel = accel - MIN(accel, TCL_status);
	return accel;
}


/// Traction Control (TCL) setup.
void Driver::initTCLfilter()
{
	TCL_status = 0.0;
	char *traintype = GfParmGetStr(car->_carHandle, SECT_DRIVETRAIN, PRM_TYPE, VAL_TRANS_RWD);
	if (strcmp(traintype, VAL_TRANS_RWD) == 0) {
		GET_DRIVEN_WHEEL_SPEED = &Driver::filterTCL_RWD;
	} else if (strcmp(traintype, VAL_TRANS_FWD) == 0) {
		GET_DRIVEN_WHEEL_SPEED = &Driver::filterTCL_FWD;
	} else if (strcmp(traintype, VAL_TRANS_4WD) == 0) {
		GET_DRIVEN_WHEEL_SPEED = &Driver::filterTCL_4WD;
	}
}


/// TCL filter plugin for rear wheel driven cars.
float Driver::filterTCL_RWD()
{
	return (car->_wheelSpinVel(REAR_RGT) + car->_wheelSpinVel(REAR_LFT)) *
			car->_wheelRadius(REAR_LFT) / 2.0;
}


/// TCL filter plugin for front wheel driven cars.
float Driver::filterTCL_FWD()
{
	return (car->_wheelSpinVel(FRNT_RGT) + car->_wheelSpinVel(FRNT_LFT)) *
			car->_wheelRadius(FRNT_LFT) / 2.0;
}


/// TCL filter plugin for all wheel driven cars.
float Driver::filterTCL_4WD()
{
	return ((car->_wheelSpinVel(FRNT_RGT) + car->_wheelSpinVel(FRNT_LFT)) *
			car->_wheelRadius(FRNT_LFT) +
		   (car->_wheelSpinVel(REAR_RGT) + car->_wheelSpinVel(REAR_LFT)) *
			car->_wheelRadius(REAR_LFT)) / 4.0;
}


/// Hold car on the track.
float Driver::filterTrk(tSituation* s, float accel)
{
	tTrackSeg* seg = car->_trkPos.seg;
	int id = seg->id;
	float target_x;  // target toLeft
	if (USE_NEW_ALPHA) {
		target_x = seg_alpha_new[id];
	} else {
		target_x = seg_alpha[id];
	}
	float trackR = fabs(car->_trkPos.toRight);
	float trackL = fabs(car->_trkPos.toLeft);
	float actual_x = trackR/(trackL + trackR);

	seg_alpha_new[id] += 0.01*(actual_x-(seg_alpha_new[id]));
	//seg_alpha[id] -= 0.01*(actual_x-(seg_alpha_new[id]));

	if (USE_NEW_ALPHA) { // limit new alpha
		float margin  = 1.0;
		if (seg->type==TR_STR) {
			margin = 1.0;
		} else {
			margin = 2.0;
		}
		float lowlimit = margin*car->_dimension_y / track->width;
		float hilimit = 1-lowlimit;
		if (seg_alpha_new[id]<lowlimit) seg_alpha_new[id] = lowlimit;
		if (seg_alpha_new[id]>hilimit) seg_alpha_new[id] = hilimit;
	}
	float orig_steer = getSteer();

	// Steering filter definition: these values make a huge
	// difference.  Using for example 0.1, 0.0, 1.0 makes for slower
	// driving.. I am not sure why.  i.e. on e-track-3, mclarenf1, you
	// get times in 1:14-1:15 with the currently used values but
	// around 1:16 1:17 with the others.  the -0.1 term that subtracts
	// the predicted error is there to prevent the error from growing
	// too much.
	float dtm = -( 1.0 * orig_steer
				   - 0.1 * learn->predictedError(car)
				   + 0.1 * (target_x - actual_x));//(car->_trkPos.toMiddle);
	float tm = fabs(actual_x - target_x);
	//printf("%f %f %f %f %f\n", tm, actual_x - target_x, actual_x - seg_alpha_new[id], target_x, seg_alpha_new[id]);

	if (accel>0) {
		accel = filterTCL(accel);
	}
	if (car->_speed_x < MAX_UNSTUCK_SPEED ||		// Too slow.
		pit->getInPit())// ||							// Pit stop.
	//car->_trkPos.toMiddle*speedangle > 0.0)		// Speedvector points to the inside of the turn.
	{
		float w = car->_dimension_y/seg->width;
		if (car->_speed_x < MAX_UNSTUCK_SPEED) {
			learn->updateAccel (s, car, -1.0, tm-w,dtm);
		}
		return accel;
	}
	float accident = 0.0;
	float margin = fabs(car->_trkPos.toMiddle) - 0.5*seg->width;
	if (margin > 0.0) {
		if (margin > .5*car->_dimension_y) {
			accident = -1;
		}
		if (car->_trkPos.toRight<.5*car->_dimension_y) {
			dtm -= 1.0*tanh((car->_dimension_y - car->_trkPos.toRight));
		} else 	if (car->_trkPos.toLeft<car->_dimension_y) {
			dtm -= 1.0*tanh((car->_trkPos.toLeft - car->_dimension_y));
		}
		//printf ("%f %f %f\n", -orig_steer, dtm, margin);
			
	}
	float uleft = (car->_trkPos.toLeft - prev_toleft)/dt;
	float uright = (car->_trkPos.toRight - prev_toright)/dt;
	u_toleft = .9*u_toleft + 0.1*uleft;
	u_toright = .9*u_toright + 0.1*uright;
	prev_toleft = car->_trkPos.toLeft;
	prev_toright = car->_trkPos.toRight;
	float danger = 1000.0; // larger, less danger
	float steer_adjust = 0.0;
	if (seg->type == TR_RGT) {
	//printf ("%f %f\n", u_toleft, u_toright);
		if (u_toleft<0) {
			danger = -car->_trkPos.toLeft/u_toleft;
			steer_adjust = -1.0;
			//printf ("LCR: %fs %d\n", danger, seg->id);
		} else if (u_toright>0) {
			danger = -car->_trkPos.toRight/u_toright;
			steer_adjust = 0.1;
			//printf ("RCR: %fs %d\n", danger, seg->id);
		}
	} else if (seg->type == TR_LFT) {
		if (u_toright<0) {
			danger = -car->_trkPos.toRight/u_toright;
			steer_adjust = 1.0;
			//printf ("RCL: %fs %d\n", danger, seg->id);
		} else if (u_toleft<0) {
			danger = -2*car->_trkPos.toLeft/u_toleft;
			steer_adjust = -0.1;
			//printf ("LCR: %fs %d\n", danger, seg->id);
		}
	}
	float danger_accel = 0.0;
	if (danger>0) {
		if (danger<0.5) {
			danger_accel = -0.5 - 2*(0.5-danger);
			//printf ("%f %f\n", car->_steerCmd, steer_adjust);
			car->_steerCmd += 0.1*steer_adjust;
		} else if (danger<1.0) {
			danger_accel = 0.5*(danger-1);
			//printf ("%f %f \n", car->_steerCmd, steer_adjust);
			car->_steerCmd += 0.1*(danger-2) * steer_adjust;
		} 
	}
	if (seg->type == TR_STR) {
		float w = car->_dimension_y/seg->width ;
		if (tm > w) {
			accel += learn->updateAccel (s, car, accident, tm-w,dtm);
		} else {
			accel += learn->updateAccel (s, car, accident, tm-w,dtm);
		}
		return accel + danger_accel;
	} else {
		//float sign = (seg->type == TR_RGT) ? -1.0 : 1.0;
		//if (car->_trkPos.toMiddle*sign > 0.0) {
		if (0) {
			float w = seg->width/WIDTHDIV;
			return  learn->updateAccel (s, car, 1.0+accident, tm-w,dtm);
		} else {
			float w = 1.0/WIDTHDIV;
			if (tm > w) {
				accel += learn->updateAccel (s, car, accident, tm-w, dtm);
				//accel = 0.0;
			} else {
				accel += learn->updateAccel (s, car, accident, tm-w,dtm);
			}
			return accel + danger_accel;
		}
	}
}


/// Compute the needed distance to brake.
float Driver::brakedist(float allowedspeed, float mu)
{
	float c,d;
	if (pit->getInPit()) {
		c = mu*G;
		d = (CA*mu + CW)/mass;
		//float dm=learn->GetFrictionDm(car->_trkPos.seg);
		//float dm2=learn->GetFrictionDm2(car->_trkPos.seg);
	} else {
		c = mu*G + learn->GetFrictionDm(car->_trkPos.seg);
		d = (CA*mu + CW
			 + learn->GetFrictionDm2(car->_trkPos.seg))/mass;
		//+ learn->GetFrictionDm3(car->_trkPos.seg))/mass;
	}
	float v1sqr = currentspeedsqr;
	float v2sqr = allowedspeed*allowedspeed;
	return -log((c + v2sqr*d)/(c + v1sqr*d))/(2.0*d);
}



/**
   \brief prepare an initial path through the track.

   This function uses a simple linear filter to set up a rough path
   through the track. Initially the path is set up so that target
   lookahead points are adjusted towards the left or right of the
   track depending on whether we are on a curve, a straight, exiting a
   curve or entering a curve. This is saved onto the targets[] array,
   which contains the proportion by which the target point is adjusted
   towards the left. There are a number of variables that control how
   the targets generation works:

   \c aleft, \c aright control the targets for when we are in the peak
   of a curve. Normally this is set up so that aleft points to the
   left and aright points to the right, but the overall effect is
   influenced by the lookahead. However the line
   \code
   float dtm = -( 1.0 * getSteer() + 0.1 * (target_x - actual_x));
   \endcode
   attempts to compensate for this problem by adding the error of the
   trajectory to the error used for learning to steer.

   \c exitleft, \c exitright control the targets for when we are
   exiting a curve. Normally we want to exit a left curve on the right
   and a right curve on the left.

   \c entryleft, \c entryright control the targets for when we are
   entering a curve.

   \c adjust_entry, if true, adds the constraint that alpha is 0 or 1
   in the middle of the straight, depending on whether a left or right
   turn follows. Then the car follows a slightly better trajectory
   to the entry point, which should be closer to the center.

   The result is then passed through a backwards-forwards filter, with
   coefficients \c beta_curve, \c beta_straight, depending on
   whether the current segment is a curve or straight. The filter uses
   \f[
   a_i = a_i + a_{i+1} e^{-\beta l_i}
   \f]
   where l is the length of a segment.

   The final result is squashed down towards 0.5 by the variable \c
   squash. Note that the costraints added by \c adjust_entry are not
   affected by squashing.
*/
void Driver::prepareTrack()
{
	int N=track->nseg;
	// Settings for g-track-2, olethros 2
#if 1
	float aleft = 1.0;
	float aright= 0.0;
	float exitleft=0.2;
	float exitright=0.8;
	float entryleft=0.1;
	float entryright=0.9;
	bool adjust_entry = true;
#endif
	float squash = 0.0;
	float beta_curve = 0.01;
	float beta_straight = 0.01;
	if (0) {
		Vector A(2);
		Vector B(2);
		Vector C(2);
		A.x[0] = 0;
		A.x[1] = 0;
		B.x[0] = 1;
		B.x[1] = 1;
		C.x[0] = 0;
		C.x[1] = 1;
		ParametricLine R(&A,&B);
		for (float r=(sqrt(2*.5*.5))/(1.1); r<5; r*=1.1) {
			//printf ("r=%f =>",r);
			Vector* v = IntersectSphereLine (&R, &C, r);
			if (v->Size()==0) {
				//printf ("NULL");
			}
			for (int i=0; i<v->Size(); i++) {
				//printf (" %f", v->x[i]);
			}
			//printf("\n");
			delete v;
		}

	}

	seg_alpha = new float [N];
	seg_alpha_new = new float [N];
	float* targets = new float [N];
	float* radi = new float [N];
	for (int i=0; i<N; i++) {
		seg_alpha[i] = 0.0;
		seg_alpha_new[i] = 0.0;
		targets[i] = 0.0;
		radi[i] = 1.0; // set to 1, so that we get something useful
					   // even if we don't call AdjustRadi()
	}


	//	s.x = alpha * seg->vertex[TR_SL].x + (1-alpha) * seg->vertex[TR_SR].x;
	//	s.y = alpha * seg->vertex[TR_SL].y + (1-alpha) * seg->vertex[TR_SR].y;
#if 1
	tTrackSeg* seg = track->seg;
	for (int i=0; i<N; i++, seg=seg->next) {
		tTrackSeg* cs = seg;
		tTrackSeg* ce = seg;
		float lend = 0.0;
		float lstart = 0.0;
		float target_end = 0.5;
		float target_start = 0.5;

		while(cs->type==seg->type) {
			lstart += cs->length;
			cs = cs->prev;
		}
		while(ce->type==seg->type) {
			ce = ce->next;
			lend += ce->length;
		}

		float target_mean = 0.5;

		// for the case of consecutive same-direction curves
		// with different radi, get a set of weights
		if (seg->type != TR_STR) {
			AdjustRadi (cs, ce, radi);
			ideal_radius[i] = seg->radius;// * radi[i]/sum;
		} else {
			ideal_radius[i] = FLT_MAX;
		}

		if (seg->type==TR_LFT) {
			target_mean = aleft * radi[i] + (1-radi[i])*0.5;//entryleft;
			if (cs->type==TR_STR) {
				target_start = entryleft;
			} else if (cs->type==TR_RGT) {
				target_start = 0.5;
			}
			if (ce->type==TR_STR) {
				target_end = exitleft;
			} else if (ce->type==TR_RGT) {
				target_end = 0.5;
			}
		} else if (seg->type==TR_RGT) {
			target_mean = aright* radi[i] + (1-radi[i])*0.5;//entryright;
			if (cs->type==TR_STR) {
				target_start = entryright;
			} else if (cs->type==TR_LFT) {
				target_start = 0.5;
			}
			if (ce->type==TR_STR) {
				target_end = exitright;
			} else if (ce->type==TR_LFT) {
				target_end = 0.5;
			}
		} else {
			if (cs->type==TR_LFT) {
				target_start = exitleft;
			} else if (cs->type==TR_RGT) {
				target_start = exitright;
			}
			if (ce->type==TR_LFT) {
				target_mean = - 0.5 * squash/(1.0-squash);
				target_end = 0.25 + 0.5 * entryleft;
			} else if (ce->type==TR_RGT) {
				target_mean = 1.0 + 0.5 * squash / (1.0-squash);
				target_end = 0.25 + 0.5 * entryright;
			}
			if (adjust_entry==false) {
				target_mean = 0.5 *  (target_start+target_end);
			}
		}
		float lm = .5 * (lstart + lend);
		float beta;
		float target_p = target_mean;
		if (lstart<lend) {
			beta  = lstart/lm;
			target_p = target_start;
		} else {
			beta = lend/lm;
			target_p = target_end;
		}
		if (seg->type!=TR_STR) {
			//printf ("%f\n", radi[i]);
			beta = 1 * radi[i] + beta* (1-radi[i]);
			targets[i] = target_mean * beta + target_p * (1-beta);
			//targets[i] = target_mean * radi[i] + targets[i] * (1-radi[i]);
		} else {
			targets[i] = target_mean * beta + target_p * (1-beta);
		}
	}
#else
	tTrackSeg* seg = track->seg;
	{
		FILE* centers = fopen ("centers","w");
		for (int i=0; i<N; i++, seg=seg->next) {
			targets[i] = computeOptimalTarget (seg, centers);
			seg_alpha[i] = targets[i];
		}
		fclose(centers);
	}
#endif		

	//printf ("Smoothing targets\n");

	// first make sure we are in the proper range.
	float margin = 2.0;
	seg=track->seg;
	for (int i=0; i<N; i++) {
		int id = seg->id;
		if (seg->type==TR_STR) {
			margin = 0.5*(margin+1.0);
		} else {
			margin = 0.5*(margin+2.0);
		}
		float lowlimit = margin*car->_dimension_y / track->width;
		float hilimit = 1-lowlimit;
		if (seg_alpha[id]<lowlimit) seg_alpha[id] = lowlimit;
		if (seg_alpha[id]>hilimit) seg_alpha[id] = hilimit;
		seg = seg->next;
	}
	// Smooth targets
	float d = 0.01;
	for (int iter=0; iter<10000; iter++) {
		float err = 0.0;
		seg = track->seg;
		for (int i=0; i<N; i++, seg=seg->next) {
			float alpha = seg_alpha[i];
			float alpha_next = seg_alpha[seg->next->id];
			float alpha_prev = seg_alpha[seg->prev->id];
			float gamma;
			float target = targets[i];
			if (seg->type==TR_STR) {
				gamma = exp(-beta_straight*seg->length);
			} else {
				gamma = exp(-beta_curve*seg->length);
			}
			
			target = alpha_next * gamma + target * (1-gamma);
			alpha += d * (target - alpha);
			target = targets[i];
			target = alpha_prev * gamma + target * (1-gamma);
			alpha += 0.5 * d * (target - alpha);
			err += (seg_alpha[i] - alpha)*(seg_alpha[i]-alpha);
			seg_alpha[i] = alpha;
		}

		for (int i=N-1; i>=0; i--, seg=seg->prev) {
			float alpha = seg_alpha[i];
			float alpha_next = seg_alpha[seg->next->id];
			//float alpha_prev = seg_alpha[seg->prev->id];
			float gamma;
			float target = targets[i];
			if (seg->type==TR_STR) {
				gamma = exp(-beta_straight*seg->length);
			} else {
				gamma = exp(-beta_curve*seg->length);
			}
			target = alpha_next * gamma + target * (1-gamma);
			alpha += d * (target - alpha);
			err += (seg_alpha[i] - alpha)*(seg_alpha[i]-alpha);
			seg_alpha[i] = alpha;
		}
	}
#if 1

	margin = 2.0;
	seg=track->seg;
	for (int i=0; i<N; i++) {
		int id = seg->id;
		seg_alpha[id] = (1-squash) * seg_alpha[id] + 0.5 * squash;
		if (seg->type==TR_STR) {
			margin = 0.5*(margin+1.0);
		} else {
			margin = 0.5*(margin+2.0);
		}
		float lowlimit = margin*car->_dimension_y / track->width;
		float hilimit = 1-lowlimit;
		if (seg_alpha[id]<lowlimit) seg_alpha[id] = lowlimit;
		if (seg_alpha[id]>hilimit) seg_alpha[id] = hilimit;
		seg = seg->next;
		seg_alpha_new[id] = seg_alpha[id];
	}
#endif


	{
		//printf ("Estimating least square error radius for smoothed points.\n");
		tTrackSeg* seg = track->seg;
		int prev_type = -track->seg->type;
		float prev_rad = seg->radius;
		int cnt=0;
		int max_cnt = 5;
		float max_length = 50;
		tTrackSeg* next_eval = seg;
		for (int i=0; i<N; i++, seg=seg->next) {
			float drad = 0;
			//printf ("%f ", darc);
			//printf("%f\n", seg->arc);
			prev_rad = seg->radius;
			prev_type = seg->type;
			tTrackSeg* prev_seg = seg;
			// look back until we find a segment of different type or
			// radius or until the total length>max_length and we have looked
			// at more than max_cnt points
			float length = max_length;
			cnt = max_cnt;
			drad = 0.0;
			while((length>0 || cnt>0)
				  && (prev_seg->type==seg->type)
				  && (drad < 0.01 || cnt>0)) {
				prev_seg = prev_seg->prev;
				length -= prev_seg->length;
				drad = fabs(prev_seg->radius - seg->radius);
				cnt--;
			}
			//printf ("%f<=0 %d<=0 %d!=%d %f<0.01 ?\n",
			//length, cnt, prev_seg->type, seg->type, drad);
			// look forward with same conditions as above
			tTrackSeg* next_seg = seg;
			length = max_length;
			cnt = max_cnt;
			drad = 0.0;
			while((length>0 || cnt>0)
				  && (next_seg->type==seg->type)
				  && (drad < 0.01 || cnt >0)) {
				next_seg = next_seg->next;
				length -= next_seg->length;
				drad = fabs(next_seg->radius - seg->radius);
				cnt--;
			}
			
			//printf ("%d %d %d\n", prev_seg->id, seg->id, next_seg->id);
			SMART_ASSERT (prev_seg!=next_seg);
			if (next_eval == seg) {
				if (seg->type==TR_STR) {
					for (tTrackSeg* s = prev_seg->next; s != next_seg; s=s->next) {
						ideal_radius[s->id] = 10000;
					}
				} else {
					float r = EstimateRadius (seg, prev_seg, next_seg->next);
					//printf ("r[%d %d]=%f\n", prev_seg->id, next_seg->id, r);
					for (tTrackSeg* s = prev_seg->next; s != next_seg; s=s->next) {
						ideal_radius[s->id] = r;
					}
				}
				next_eval = next_seg;
			}
			//printf ("%f %f\n", r, ideal_radius[seg->id]);
		}
		//printf ("Done\n");
	}

	delete [] radi;
	delete [] targets;

}

/// Show the paths
void Driver::ShowPaths()
{
	tTrackSeg* seg = track->seg;
	int N = track->nseg;

	FILE* fplan = fopen("track_plan", "w");
	FILE* fpath = fopen("track_path", "w");
	FILE* fpathnew = fopen("track_path_new", "w");
	seg = track->seg;
	for (int i=0; i<N; i++, seg=seg->next) {
		int id = seg->id;
		float xle = seg->vertex[TR_EL].x;
		float yle = seg->vertex[TR_EL].y;
		float xre = seg->vertex[TR_ER].x;
		float yre = seg->vertex[TR_ER].y;
		float xls = seg->vertex[TR_SL].x;
		float yls = seg->vertex[TR_SL].y;
		float xrs = seg->vertex[TR_SR].x;
		float yrs = seg->vertex[TR_SR].y;
		float xlm = 0.5*(xls+xle);
		float ylm = 0.5*(yls+yle);
		float xrm = 0.5*(xrs+xre);
		float yrm = 0.5*(yrs+yre);
		fprintf (fplan, "%f %f %f %f %d\n", xls, yls, xrs, yrs, id);
		fprintf (fplan, "%f %f %f %f %d\n", xlm, ylm, xrm, yrm, id);
		fprintf (fplan, "%f %f %f %f %d\n", xle, yle, xre, yre, id);
		float a = seg_alpha[i];
		fprintf (fpath, "%f %f %d\n", xls*a+(1-a)*xrs, yls*a+(1-a)*yrs, id);
		fprintf (fpath, "%f %f %d\n", xlm*a+(1-a)*xrm, ylm*a+(1-a)*yrm, id);
		fprintf (fpath, "%f %f %d\n", xle*a+(1-a)*xre, yle*a+(1-a)*yre, id);
		a = seg_alpha_new[i];
		fprintf (fpathnew, "%f %f %d\n", xls*a+(1-a)*xrs, yls*a+(1-a)*yrs, id);
		fprintf (fpathnew, "%f %f %d\n", xlm*a+(1-a)*xrm, ylm*a+(1-a)*yrm, id);
		fprintf (fpathnew, "%f %f %d\n", xle*a+(1-a)*xre, yle*a+(1-a)*yre, id);
	}
	fclose(fpathnew);
	fclose(fpath);
	fclose(fplan);
}

/// compute optimal targets
float Driver::computeOptimalTarget (tTrackSeg* seg, FILE* f)
{

	Vector C(2);

	float target = 0.5;
	float rmax=1;

	if (seg->type!=TR_STR) {
		// try and find best fit directly
		FindBestCircle(seg, &C, rmax);
		target = FindCurveTarget(seg, &C, rmax);
		
		if (f) {
			fprintf (f, "%f %f %f %f\n",
					 seg->center.x, seg->center.y,
					 C.x[0], C.x[1]);
		}
		ideal_radius[seg->id] = rmax;
	} else {
		// we search for curves
		tTrackSeg* prev = seg;
		float l_back = 0.0;;
		float l_fore = 0.0;;
		while(prev->type==TR_STR) {
			prev = prev->prev;
			l_back += seg->length;
		}
		
		tTrackSeg* next = seg;
		while(next->type==TR_STR) {
			next = next->next;
			l_fore += seg->length;
		}
		float ratio = l_back/(l_back+l_fore);
		
		bool prev_flag = true;
		bool next_flag = true;
		float rmax_prev;
		float rmax_next;
		FindBestCircle(prev, &C, rmax_prev);
		float prev_target = FindStraightTarget(prev, seg, &C, rmax_prev, prev_flag);
		if (l_back>seg->width) {
			if (prev->type==TR_LFT) {
				prev_target = 0.0;
			} else {
				prev_target = 1.0;
			}
		}

		FindBestCircle(next, &C, rmax_next);
		float next_target = FindStraightTarget(next, seg, &C, rmax_next, next_flag);
		if (l_fore>seg->width) {
			if (next->type==TR_LFT) {
				next_target = 0.0;
			} else {
				next_target = 1.0;
			}
		}
		ideal_radius[seg->id] = FLT_MAX;		
		if (prev_flag && next_flag) {
			target = ratio * next_target + (1-ratio) * prev_target;
			rmax = ratio * rmax_next + (1-ratio) * rmax_prev;
		} else if (prev_flag) {
			target = prev_target;
			rmax = rmax_prev;
		} else if (next_flag) {
			target = next_target;
			rmax = rmax_next;
		} else {
			target = ratio * next_target + (1-ratio) * prev_target;
			rmax = FLT_MAX;
		}
		//printf ("%f\n", target);

	}

	return target;

}

/// find best circle through segment
void Driver::FindBestCircle (tTrackSeg* seg, Vector* C, float& rmax)
{
	assert(seg->type!=TR_STR);

	float arc = seg->arc;
	float radius_in, radius_out;
	if (seg->type==TR_LFT) {
		radius_in = seg->radiusl;
		radius_out = seg->radiusr;
	} else {
		radius_in = seg->radiusr;
		radius_out = seg->radiusl;
	}

	tTrackSeg* prev_seg = seg->prev;
	tTrackSeg* next_seg = seg->next;
	//float arc = seg->arc;
	while ((prev_seg->type == seg->type) 
		&& (fabs (prev_seg->arc - seg->arc) < 0.0001)) {
		arc += prev_seg->arc;
		prev_seg = prev_seg->prev;
	}
	while ((next_seg->type == seg->type)
		&& (fabs (next_seg->arc - seg->arc) < 0.0001)) {
		arc += next_seg->arc;
		next_seg = next_seg->next;
	}
	float mid_arc = 0.5*arc;
	float arc_start = 0.5*M_PI - prev_seg->next->angle[TR_ZS];

	float aratio = pow(M_PI/arc, 1.76553);
	
	// the best relative center.
	float nx = aratio * (radius_in - radius_out) * sin (arc_start + mid_arc);
	float ny = aratio * (radius_in - radius_out) * cos (arc_start + mid_arc);
	
	rmax = radius_in + sqrt(nx*nx+ny*ny);

	C->x[0]=nx + seg->center.x;
	C->x[1]=ny + seg->center.y;

	//printf("C:%f %f\n", C->x[0], C->x[1]);
}



/**
   \brief Given a segment, estimate the radius of the optimal path through it.
 */
float Driver::EstimateRadius (tTrackSeg* seg, tTrackSeg* prev_seg, tTrackSeg* next_seg) 
{

	std::vector<Vector> vmatrix;
	ParametricSphere curve(2);
	for (tTrackSeg* s = prev_seg; s!=next_seg; s=s->next) {
		Vector optimal(2);
		int i = s->id;
		float alpha = seg_alpha[i];
		//alpha = 0.0;
		optimal[0] = s->vertex[TR_SL].x * alpha
			+ s->vertex[TR_SR].x * (1 - alpha);
		optimal[1] = s->vertex[TR_SL].y * alpha
			+ s->vertex[TR_SR].y * (1 - alpha);
		vmatrix.push_back(optimal);
	}
	curve.C->x[0] = seg->center.x;
	curve.C->x[1] = seg->center.y;
	//printf ("%f %f\n", curve.C->x[0], curve.C->x[1]);
	//printf ("%f %f\n", (*curve.C)[0], (*curve.C)[1]);
	curve.r = ideal_radius[seg->id];//seg->radius ;
	EstimateSphere (vmatrix, &curve);
#if 0
	printf ("%d ", seg->id);
	for (int i=0; i<curve.C->N; i++) {
		printf ("%.1f ", (*(curve.C))[i]);
	}
	printf (":%.1f ",curve.r);
	if (seg->type!=TR_STR) {
		printf ("(%.1f %.1f) :  %.1f %.1f\n", seg->center.x, seg->center.y, seg->radiusl, seg->radiusr);
	} else {
		printf ("\n");
	}
#endif
	return curve.r;
}



/// Given a circle and a segment, find target path
float Driver::FindCurveTarget(tTrackSeg* seg, Vector* C, float rmax)
{
	Vector inside(2);
	Vector outside(2);
	
	if (seg->type==TR_LFT) {
		inside.x[0] = seg->vertex[TR_SL].x;
		inside.x[1] = seg->vertex[TR_SL].y;
		outside.x[0] = seg->vertex[TR_SR].x;
		outside.x[1] = seg->vertex[TR_SR].y;
	} else {
		inside.x[0] = seg->vertex[TR_SR].x;
		inside.x[1] = seg->vertex[TR_SR].y;
		outside.x[0] = seg->vertex[TR_SL].x;
		outside.x[1] = seg->vertex[TR_SL].y;
	}

	ParametricLine R(&inside, &outside);
	Vector* intersect = IntersectSphereLine(&R, C, rmax);
	float target = .5;
	bool flag = false;
	//	if (intersect->N==0) {
	//		printf ("oops:");
	//	}

	for (int j=0; j<intersect->Size(); j++) {
		if ((intersect->x[j]>=0) && (intersect->x[j]<=1)) {
			flag = true;
			if (seg->type==TR_LFT) {
				target = 1 -intersect->x[j];
			} else {
				target = intersect->x[j];
			}
		} else {
			if (flag==false) {
				float dxj=0.5;
				if (intersect->x[j]<0) {
					dxj=0;
				}
				if (intersect->x[j]>1) {
					dxj=1;
				}
				if (seg->type==TR_LFT) {
					target = 1 - dxj;
				} else {
					target = dxj;
				}
			}
		}
	}



	delete intersect;
	return target;
}

/// Find circle from previous or next curve intersecting the straight.
float Driver::FindStraightTarget(tTrackSeg* curve, tTrackSeg* seg, Vector* C, float rmax, bool& flag)
{
	Vector inside(2);
	Vector outside(2);

	float target = .5;	
	if (curve->type==TR_RGT) {
		inside.x[0] = seg->vertex[TR_SL].x;
		inside.x[1] = seg->vertex[TR_SL].y;
		outside.x[0] = seg->vertex[TR_SR].x;
		outside.x[1] = seg->vertex[TR_SR].y;
		target = 0.0;
	} else {
		inside.x[0] = seg->vertex[TR_SR].x;
		inside.x[1] = seg->vertex[TR_SR].y;
		outside.x[0] = seg->vertex[TR_SL].x;
		outside.x[1] = seg->vertex[TR_SL].y;
		target = 1.0;
	}

	ParametricLine R(&inside, &outside);
	Vector* intersect = IntersectSphereLine(&R, C, rmax);

	flag = false;
	//	if (intersect->N==0) {
	//		printf ("oops:");
	//	}

	for (int j=0; j<intersect->Size(); j++) {
		if ((intersect->x[j]>=0) && (intersect->x[j]<=1)) {
			flag = true;
			if (seg->type==TR_LFT) {
				target = 1 -intersect->x[j];
			} else {
				target = intersect->x[j];
			}
		}
	}

	delete intersect;
	return target;
}

/**
   \brief Adjust influence weight on radi of consecutive curves.

   The radius of some segments of a curve is more influential than
   others when creating the path. For example if you have one wide
   curve followed by a tight followed by another wide one, you wish to
   treat the wide curves as if they were straight, especially close
   to the tight curve. This function implements a weighting scheme
   that can be used later. This way one can find optimal paths for
   each curve independently and then combine them using those weights.

   \c cs is the beginning of the segments and \c ce is the end of the
   segments for which we will calculate radi.

   \c radi is an array that will contain the weights; it should have a
   size at least equal to the maximum segment ID.
 */
void Driver::AdjustRadi(tTrackSeg* cs, tTrackSeg* ce, float* radi)
{
	float sum = 0.0;
	float max = 0.0;
	for (tTrackSeg* aseg = cs->next; 
		 aseg != ce;
		 aseg = aseg->next) {
		int id = aseg->id;
		radi[id] = 1/(aseg->radius);//exp(-0.01*aseg->radius);
		sum += radi[id];
		if (max<radi[id]) max = radi[id];
	}
	//ideal_radius[i] = seg->radius;// * radi[i]/sum;

	for (tTrackSeg* aseg = cs->next; 
		 aseg != ce;
		 aseg = aseg->next) {
		int id = aseg->id;
		// first compute radius at top of curve piece.
		radi[id] /= max;
		// see how far away we are from next and previous
		// pieces (meaning with different radi).
		bool same_curve = true;
		float dist_to_next = aseg->length / 2;
		float dist_to_prev = aseg->length / 2;
		tTrackSeg* prev = aseg;
		tTrackSeg* next = aseg;
		while (same_curve) {
			same_curve = false;
			if ((prev->prev->type == aseg->type)
				&& (fabs(prev->prev->radius - aseg->radius) < 1)) {
				prev = prev->prev;
				dist_to_prev += prev->length;
				same_curve = true;
			}
			if ((next->next->type == aseg->type)
				&& (fabs(next->next->radius - aseg->radius) < 1)) {
				next = next->next;
				dist_to_next += next->length;
				same_curve = true;
			}
		}
		// calculate weight such that it is 0 at the center of the piece
		// and 1 at the ends.
		float total_length = dist_to_next + dist_to_prev;
		float weight = fabs(dist_to_prev - dist_to_next)/total_length;
		radi[id] = (1 - weight) + weight * radi[id];
	} // for (aseg)

}

#ifdef USE_OLETHROS_NAMESPACE
}
#endif
