/***************************************************************************

    file                 : grsound.cpp
    created              : Thu Aug 17 23:57:10 CEST 2000
    copyright            : (C) 2000-2003 by Eric Espie, Christos Dimitrakakis
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

#include <plib/sl.h>
#include <plib/sm.h>
#include <math.h>

#include <tgfclient.h>
#include <graphic.h>

#include "grsound.h"


#ifndef M_PI
#define EX_PI 3.1415926535
#else
#define EX_PI M_PI
#endif

#define MAX_VOL 1.0 // maximum volume for all effects

#define VOLUME_SLOT 0
#define PITCH_SLOT 1
#define FILTER_SLOT 2
#define SPEED_OF_SOUND 340.0
#define NB_CRASH_SOUND	6
#ifdef OLETHROS_PLIB
#define NB_ENGINE_SOUND 6
#else
#define NB_ENGINE_SOUND 1
#endif
static int		curCrashSnd;
static slScheduler	*sched;
static slSample		**engSample;
static slSample		*crashSample[NB_CRASH_SOUND];

static slSample         *bottomCrashSample;
static slSample         *bangSample;

static slSample		*skidSample;
static slEnvelope	*skidVolEnv;
static slEnvelope       *skidPitchEnv;

#ifdef OLETHROS_PLIB
static slSample		*grassSample;
static slEnvelope	*grassVolEnv;
static slEnvelope       *grassPitchEnv;

static slSample		*roadSample;
static slEnvelope	*roadVolEnv;
static slEnvelope       *roadPitchEnv;

static slSample		*skidgrassSample;
static slEnvelope	*skidgrassVolEnv;
static slEnvelope       *skidgrassPitchEnv;

static slSample		*skid_metalSample;
static slEnvelope	*skid_metalVolEnv;
static slEnvelope       *skid_metalPitchEnv;

static slSample		*axleSample;
static slEnvelope	*axleVolEnv;
static slEnvelope   *axlePitchEnv;
#endif

static slEnvelope	**engPitchEnv;
static slEnvelope	**engVolEnv;
#ifdef OLETHROS_PLIB
static slEnvelope	**engFilterEnv;
#endif
static SoundPri          *engpri;

static float* drag_collision;
static float* drag_collision_pitch;
static float* base_frequency;

static int soundInitialized = 0;
static int update_cnt = 0;
static float* smooth_accel;
void
grInitSound(tSituation* s, int ncars)
{
    char	buf[256];
    int		i;
    int car_i;
    GfOut("-- grInitSound\n");

    sched = new slScheduler(44100);

    sched->setSafetyMargin(0.128f);
#ifdef OLETHROS_PLIB
    sched->setMaxConcurrent(ncars+10);
#else
	sched->setMaxConcurrent(4);
#endif

	engpri = new SoundPri [ncars];
    for (car_i=0; car_i<ncars; car_i++) {
	engpri[car_i].state = None;
	engpri[car_i].id = car_i;
    }

    int maxcars=NB_ENGINE_SOUND;
    if (ncars>NB_ENGINE_SOUND) {
	maxcars = NB_ENGINE_SOUND;
    } else {
	maxcars = ncars;
    }

    smooth_accel = new float[ncars];
    drag_collision = new float [ncars];
    drag_collision_pitch = new float [ncars];
    base_frequency = new float [ncars];

    for (car_i=0; car_i<ncars; car_i++) {
	smooth_accel[car_i] = 0.0;
	drag_collision[car_i] = 0.0;
	drag_collision_pitch[car_i] = 0.0;
    }

    engSample = new slSample* [ncars];
    engPitchEnv = new slEnvelope* [ncars];
    engVolEnv = new slEnvelope* [ncars];
#ifdef OLETHROS_PLIB
    engFilterEnv = new slEnvelope* [ncars];
#endif

    skidSample = new slSample("data/sound/skid_tyres.wav", sched);
    skidVolEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    skidPitchEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    sched->loopSample(skidSample);
    sched->addSampleEnvelope(skidSample, 0, VOLUME_SLOT, skidVolEnv, SL_VOLUME_ENVELOPE);
    sched->addSampleEnvelope(skidSample, 0, PITCH_SLOT, skidPitchEnv, SL_PITCH_ENVELOPE);
    skidVolEnv->setStep(0, 0.0, 0.0);
    skidPitchEnv->setStep(0, 0.0, 1.0);

#ifdef OLETHROS_PLIB
    roadSample = new slSample("data/sound/road-ride.wav", sched);
    roadVolEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    roadPitchEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    sched->loopSample(roadSample);
    sched->addSampleEnvelope(roadSample, 0, VOLUME_SLOT, roadVolEnv, SL_VOLUME_ENVELOPE);
    sched->addSampleEnvelope(roadSample, 0, PITCH_SLOT, roadPitchEnv, SL_PITCH_ENVELOPE);
    roadVolEnv->setStep(0, 0.0, 0.0);
    roadPitchEnv->setStep(0, 0.0, 1.0);

    grassSample = new slSample("data/sound/out_of_road.wav", sched);
    grassVolEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    grassPitchEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    sched->loopSample(grassSample);
    sched->addSampleEnvelope(grassSample, 0, VOLUME_SLOT, grassVolEnv, SL_VOLUME_ENVELOPE);
    sched->addSampleEnvelope(grassSample, 0, PITCH_SLOT, grassPitchEnv, SL_PITCH_ENVELOPE);
    grassVolEnv->setStep(0, 0.0, 0.0);
    grassPitchEnv->setStep(0, 0.0, 1.0);

    skidgrassSample = new slSample("data/sound/out_of_road-3.wav", sched);
    skidgrassVolEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    skidgrassPitchEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    sched->loopSample(skidgrassSample);
    sched->addSampleEnvelope(skidgrassSample, 0, VOLUME_SLOT, skidgrassVolEnv, SL_VOLUME_ENVELOPE);
    sched->addSampleEnvelope(skidgrassSample, 0, PITCH_SLOT, skidgrassPitchEnv, SL_PITCH_ENVELOPE);
    skidgrassVolEnv->setStep(0, 0.0, 0.0);
    skidgrassPitchEnv->setStep(0, 0.0, 1.0);


    skid_metalSample = new slSample("data/sound/skid_metal.wav", sched);
    skid_metalVolEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    skid_metalPitchEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    sched->loopSample(skid_metalSample);
    sched->addSampleEnvelope(skid_metalSample, 0, VOLUME_SLOT, skid_metalVolEnv, SL_VOLUME_ENVELOPE);
    sched->addSampleEnvelope(skid_metalSample, 0, PITCH_SLOT, skid_metalPitchEnv, SL_PITCH_ENVELOPE);
    skid_metalVolEnv->setStep(0, 0.0, 0.0);
    skid_metalPitchEnv->setStep(0, 0.0, 1.0);


    axleSample = new slSample("data/sound/axle.wav", sched);
    axleVolEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    axlePitchEnv = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
    sched->loopSample(axleSample);
    sched->addSampleEnvelope(axleSample, 0, VOLUME_SLOT, axleVolEnv, SL_VOLUME_ENVELOPE);
    sched->addSampleEnvelope(axleSample, 0, PITCH_SLOT, axlePitchEnv, SL_PITCH_ENVELOPE);
    axleVolEnv->setStep(0, 0.0, 0.0);
    axlePitchEnv->setStep(0, 0.0, 1.0);
#endif // OLETHROS_PLIB

    for (car_i=0; car_i<ncars; car_i++) {
	void* handle = s->cars[car_i]->_carHandle;
	char* param;
	char buf[512];
	tdble rpm_scale;
	param = GfParmGetStr(handle, "Sound", "engine sample", "engine-1.wav");
	rpm_scale = GfParmGetNum(handle, "Sound", "rpm scale", NULL, 1.0);
	sprintf (buf, "data/sound/%s", param);

	printf("Loaded %s (rpm scale:%f) for car %d : %s\n", buf, rpm_scale, car_i, s->cars[car_i]->_carName);
	engSample[car_i] = new slSample(buf, sched);

	engPitchEnv[car_i] = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
	engVolEnv[car_i] = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);	
#ifdef OLETHROS_PLIB
	engFilterEnv[car_i] = new slEnvelope(1, SL_SAMPLE_ONE_SHOT);
#endif
	sched->loopSample(engSample[car_i]);

	sched->addSampleEnvelope(engSample[car_i], 0, 0, engVolEnv[car_i], SL_VOLUME_ENVELOPE);
	sched->addSampleEnvelope(engSample[car_i], 0, 1, engPitchEnv[car_i], SL_PITCH_ENVELOPE);
#ifdef OLETHROS_PLIB
	sched->addSampleEnvelope(engSample[car_i], 0, 2, engFilterEnv[car_i], SL_FILTER_ENVELOPE);
#endif

	engVolEnv[car_i]->setStep(0, 0.0, 0.0);
	engPitchEnv[car_i]->setStep(0, 0.0, 1.0);
#ifdef OLETHROS_PLIB
	engFilterEnv[car_i]->setStep(0, 0.0, 1.0);
#endif
	base_frequency[car_i] = rpm_scale;
	if (car_i<NB_ENGINE_SOUND) {
	    engpri[car_i].state = Playing;
	} else {
	    sched->pauseSample (engSample[car_i]);
	    engpri[car_i].state = Paused;
	}

    }

    
    for (i = 0; i < NB_CRASH_SOUND; i++) {
	sprintf(buf, "data/sound/crash%d.wav", i+1);
	crashSample[i] = new slSample(buf, sched);
	crashSample[i]->adjustVolume(0.25);
    }
    curCrashSnd = 0;
    
    bangSample = new slSample ("data/sound/boom.wav");
    bottomCrashSample = new slSample ("data/sound/bottom_crash.wav");

    soundInitialized = 1;
}


void 
grShutdownSound(int ncars)
{
    int i;

    GfOut("-- grShutdownSound\n");
    
    if (!soundInitialized) {
	return;
    }
    soundInitialized = 0;
    for (i=0; i<ncars; i++) {
	if (i<NB_ENGINE_SOUND) {
	    sched->stopSample(engSample[i]);
	}
    }
#ifdef OLETHROS_PLIB
    sched->stopSample(skidSample);
    sched->stopSample(roadSample);
    sched->stopSample(grassSample);
    sched->stopSample(skidgrassSample);
    sched->stopSample(skid_metalSample);
    sched->stopSample(axleSample);
#endif
    for (i = 0; i < NB_CRASH_SOUND; i++) {
	sched->stopSample(crashSample[i]);
    }

    for (i=0; i<ncars; i++) {
	sched->stopSample(engSample[i]);
	sched->addSampleEnvelope(engSample[i], 0, VOLUME_SLOT, NULL,
				 SL_NULL_ENVELOPE);
	sched->addSampleEnvelope(engSample[i], 0, PITCH_SLOT, NULL,
				 SL_NULL_ENVELOPE);
#ifdef OLETHROS_PLIB
	sched->addSampleEnvelope(engSample[i], 0, FILTER_SLOT, NULL,
				 SL_NULL_ENVELOPE);
#endif
    }

    delete [] engPitchEnv;
    delete [] engVolEnv;
#ifdef OLETHROS_PLIB
    delete [] engFilterEnv;
#endif
    delete [] engpri;
    delete [] base_frequency;

    sched->addSampleEnvelope(skidSample,0,VOLUME_SLOT, NULL, SL_NULL_ENVELOPE);
    sched->addSampleEnvelope(skidSample,0,PITCH_SLOT, NULL, SL_NULL_ENVELOPE);
    delete skidVolEnv;
    delete skidPitchEnv;

#ifdef OLETHROS_PLIB
    sched->addSampleEnvelope(roadSample,0,VOLUME_SLOT,NULL, SL_NULL_ENVELOPE);
    sched->addSampleEnvelope(roadSample,0,PITCH_SLOT, NULL, SL_NULL_ENVELOPE);
    delete roadVolEnv;
    delete roadPitchEnv;

    sched->addSampleEnvelope(grassSample,0,VOLUME_SLOT,NULL, SL_NULL_ENVELOPE);
    sched->addSampleEnvelope(grassSample,0,PITCH_SLOT, NULL, SL_NULL_ENVELOPE);
    delete grassVolEnv;
    delete grassPitchEnv;

    sched->addSampleEnvelope(skidgrassSample,0,VOLUME_SLOT,NULL, SL_NULL_ENVELOPE);
    sched->addSampleEnvelope(skidgrassSample,0,PITCH_SLOT, NULL, SL_NULL_ENVELOPE);
    delete skidgrassVolEnv;
    delete skidgrassPitchEnv;

    sched->addSampleEnvelope(skid_metalSample,0,VOLUME_SLOT,NULL, SL_NULL_ENVELOPE);
    sched->addSampleEnvelope(skid_metalSample,0,PITCH_SLOT, NULL, SL_NULL_ENVELOPE);
    delete skid_metalVolEnv;
    delete skid_metalPitchEnv;


    sched->addSampleEnvelope(axleSample,0,VOLUME_SLOT,NULL, SL_NULL_ENVELOPE);
    sched->addSampleEnvelope(axleSample,0,PITCH_SLOT, NULL, SL_NULL_ENVELOPE);
    delete axleVolEnv;
    delete axlePitchEnv;
#endif //OLETHROS_PLIB

    sched->update();

    for (i = 0; i < NB_CRASH_SOUND; i++) {
	delete crashSample[i];
    }
    delete [] engSample;

    delete skidSample;
#ifdef OLETHROS_PLIB
    delete roadSample;
    delete grassSample;
    delete skidgrassSample;
    delete skid_metalSample;
	delete axleSample;
#endif
    delete bangSample;
    delete bottomCrashSample;

    delete sched;
    delete [] drag_collision_pitch;
    delete [] drag_collision;
    delete [] smooth_accel;
    if (__slPendingError) {
	GfOut("!!! error ignored: %s\n", __slPendingError);
	__slPendingError = 0;	/* ARG!!! ugly ugly bad thing... but should not occur anymore now */
    }
}



float
grRefreshSound(tSituation *s, cGrCamera	*camera)
{

    tCarElt	*car;//= s->cars[s->current];
    int		i;

    SoundChar src_sound;
    int car_i;
    float max_skvol = 0.0;
    float max_skpitch = 0.0;
    float max_roadvol = 0.0;
    float max_roadpitch = 0.0;
    float max_grassvol = 0.0;
    float max_grasspitch = 0.0;
    float max_skidgrassvol = 0.0;
    float max_skidgrasspitch = 0.0;
    float max_skid_metalvol = 0.0;
    float max_skid_metalpitch = 0.0;
	float max_axlevol = 0.0;
	float max_axlepitch = 0.0;

    for (car_i = 0; car_i < s->_ncars; car_i++) {
	float mpitch;
	float skvol = 0.0;
	float skpitch = 1.0;
	float roadvol = 0.0;
	float roadpitch = 1.0;
	float grassvol = 0.0;
	float grasspitch = 1.0;
	float skidgrassvol = 0.0;
	float skid_metalvol = 0.0;
	float skid_metalpitch = 0.0;
	float axlevol = 0.0;
	float axlepitch = 0.0;
	float u_rel = 0.0;
	float crash_vol = 0.0;

	car = s->cars[car_i];
	engpri[car_i].a = 0.0;
	engpri[car_i].id = car->index;

	mpitch = base_frequency[car->index] * 
	    (float)(car->_enginerpm) / 600.0;
	//Calculate doppler effect
	u_rel = 0.0f;
	if (camera) {
	    sgVec3* u_camera;
	    sgVec3* p_camera;
	    sgVec3 u_car;
	    sgVec3 p_car;
	    
	    p_camera = camera->getPosv();
	    u_camera = camera->getSpeedv();
	    u_car[0] = car->pub.DynGCg.vel.x;
	    u_car[1] = car->pub.DynGCg.vel.y;
	    u_car[2] = car->pub.DynGCg.vel.z;
	    p_car[0] = car->pub.DynGC.pos.x;
	    p_car[1] = car->pub.DynGC.pos.y;
	    p_car[2] = car->pub.DynGC.pos.z;
	    src_sound.f = 1.0;//mpitch;
	    src_sound.a = 1.0;
	    DopplerShift (&src_sound, p_car, u_car, *p_camera, *u_camera);
		tdble gear_ratio = car->_gearRatio[car->_gear + car->_gearOffset];
		axlevol = 0.005*gear_ratio;
		axlepitch = mpitch*0.2*gear_ratio;
		//printf ("%f %d %d\n", gear_ratio, car->_gearNb, car->_gearOffset);
	    mpitch = mpitch * src_sound.f;
	    smooth_accel[car_i] = smooth_accel[car_i]*.95 + .05*(car->ctrl.accelCmd*.95+0.05);
	    engpri[car_i].a = src_sound.a;
	    engpri[car_i].f = mpitch;
	    tdble rev_cor =((float)car->_enginerpm / (float)car->_enginerpmMax);
	    engpri[car_i].lp = (smooth_accel[car_i]*(1.0-0.5*rev_cor) + rev_cor*rev_cor*rev_cor*0.5);
		
	}


	skvol = 0.0;
	roadvol = 0.0;
	grassvol = 0.0;
	skidgrassvol = 0.0;
	if ((car->_speed_x * car->_speed_x + car->_speed_y * car->_speed_y) > 10.0) {
	    for(i = 0; i < 4; i++) {
		char* s = car->priv.wheel[i].seg->surface->material;
		tdble roughness = car->priv.wheel[i].seg->surface->kRoughness;
		tdble roughnessFreq = 2.0*EX_PI/car->priv.wheel[i].seg->surface->kRoughWaveLen;
		float tmpvol = sqrt(car->_speed_x * car->_speed_x + car->_speed_y * car->_speed_y)*0.01;
		float ride  = car->priv.wheel[i].rollRes;

		if (update_cnt<=-10) {
		    printf ("%f %f %f %f\n", roughness, roughnessFreq, ride, tmpvol);
		}
		int out_of_road = false;
		if ((strcmp(s, TRK_VAL_GRASS)==0)
		    ||(strcmp(s, TRK_VAL_SAND)==0)
		    ||(strcmp(s, TRK_VAL_DIRT)==0)
		    ||(strstr(s, "sand"))
		    ||(strstr(s, "dirt"))
		    ||(strstr(s, "grass"))
		    ||(strstr(s, "gravel"))
		    ||(strstr(s, "mud"))
		    ) {
		    out_of_road = true;
		}

		if (out_of_road==false) {
		    float tmppitch = 0.5*tmpvol + 0.5*tmpvol*roughnessFreq;
		    tmpvol = 2.0*ride * (0.1 + roughness);
		    if (roadvol < tmpvol) {
			roadvol = tmpvol;
			roadpitch = tmppitch;
		    }
		    if (skvol < car->_skid[i]) {
			skvol = (float)car->_skid[i];
			skpitch = 0.7+0.3*roughnessFreq;
		    }
		} else {
		    float tmppitch = 0.5*tmpvol + 0.5*tmpvol*roughnessFreq;

		    tmpvol = (0.1+roughness)*tmpvol * ride;

		    if (grassvol < tmpvol) {
		        grassvol = tmpvol;
			grasspitch = tmppitch;
		    }
		    if (skidgrassvol < car->_skid[i]) {
			skidgrassvol = (float) car->_skid[i];
		    }
		}
	    }
	}




	if (car->priv.collision) {
	    if (car->priv.collision & 1) {
		skid_metalvol = sqrt(car->_speed_x * car->_speed_x + car->_speed_y * car->_speed_y)*0.01;
		skid_metalpitch = .5+0.5*skid_metalvol;
		drag_collision_pitch[car_i] = skid_metalpitch;
	    } else {
		skid_metalvol = 0;
	    }

	    if ((car->priv.collision & 16 )) {
		if (src_sound.a>1.0) {
		    crash_vol = MAX_VOL;
		} else {
		    crash_vol = MAX_VOL * src_sound.a;
		}
		
		if (crash_vol>0.3) {
		    sched->playSample(bottomCrashSample);
		}
	    }

	    if ((car->priv.collision & 8 )) {
		if (src_sound.a>1.0) {
		    crash_vol = MAX_VOL;
		} else {
		    crash_vol = MAX_VOL * src_sound.a;
		}
		
		if (crash_vol>0.3) {
		    sched->playSample(bangSample);
		}
	    }

	    if (((car->priv.collision & 1) ==0) ||
		((car->priv.collision & 2)
		 &&(skid_metalvol >drag_collision[car_i]))) {

		curCrashSnd++;
		if (curCrashSnd == NB_CRASH_SOUND) {
		    curCrashSnd = 0;
		}
		
		if (src_sound.a>1.0) {
		    crash_vol = MAX_VOL;
		} else {
		    crash_vol = MAX_VOL * src_sound.a;
		}
		
		if (crash_vol>0.3) {
		    sched->playSample(crashSample[curCrashSnd]);
		}		
	    }
	    car->priv.collision = 0;
	}

	drag_collision[car_i] = 0.9*drag_collision[car_i];
	drag_collision[car_i] += skid_metalvol;
	if (drag_collision[car_i]>1.0) {
	    drag_collision[car_i] = 1.0;
	}
	skid_metalvol = drag_collision[car_i];
	skid_metalpitch = drag_collision_pitch[car_i];

	if (max_skvol < (skvol * src_sound.a)) {
	    max_skvol = skvol * src_sound.a;
	    max_skpitch = (skpitch) * src_sound.f;
	}

	if (max_roadvol < (roadvol * src_sound.a)) {
	    max_roadvol = roadvol * src_sound.a;
	    max_roadpitch = src_sound.f * roadpitch;
	}

	if (max_grassvol < (grassvol * src_sound.a)) {
	    max_grassvol = grassvol * src_sound.a;
	    max_grasspitch = src_sound.f * grasspitch;
	}

	if (max_skidgrassvol < (skidgrassvol * src_sound.a)) {
	    max_skidgrassvol = skidgrassvol * src_sound.a;
	    max_skidgrasspitch = src_sound.f;
	}

	if (max_skid_metalvol < (skid_metalvol * src_sound.a)) {
	    max_skid_metalvol = skid_metalvol * src_sound.a;
	    max_skid_metalpitch = skid_metalpitch * src_sound.f;
	}

	if (max_axlevol < (axlevol * src_sound.a)) {
	    max_axlevol = axlevol * src_sound.a;
	    max_axlepitch = axlepitch * src_sound.f;
	}



    }

    qsort ((void*) engpri, s->_ncars, sizeof(SoundPri), &SortSndPriority);
    for (car_i=0; car_i<s->_ncars; car_i++) {
	int id = engpri[car_i].id;
	if (car_i<NB_ENGINE_SOUND) {
	    sched->resumeSample (engSample[id]);
#ifdef OLETHROS_PLIB
	    engFilterEnv[id]->setStep(0, 0.0, engpri[car_i].lp);
#endif
	    engPitchEnv[id]->setStep(0, 0.0, engpri[car_i].f);
	    if (engpri[car_i].a>MAX_VOL) {
		engVolEnv[id]->setStep(0, 0.0, MAX_VOL);
	    } else {
		engVolEnv[id]->setStep(0, 0.0, MAX_VOL * engpri[car_i].a);
	    }
	    engpri[car_i].state = Playing;
	} else {
	    engVolEnv[id]->setStep(0, 0.0, 0.0);
	    sched->pauseSample (engSample[id]);
	    engpri[car_i].state = Paused;
	}
    }

    if (max_skvol>1.0) {
	skidVolEnv->setStep(0, 0.0, MAX_VOL);
    } else {
	skidVolEnv->setStep(0, 0.0, MAX_VOL * max_skvol);
    }
    skidPitchEnv->setStep(0, 0.0, max_skpitch);

#ifdef OLETHROS_PLIB
    if (max_roadvol>1.0) {
	roadVolEnv->setStep(0, 0.0, MAX_VOL);
    } else {
	roadVolEnv->setStep(0, 0.0, MAX_VOL * max_roadvol);
    }
    roadPitchEnv->setStep(0, 0.0, max_roadpitch);

    if (max_grassvol>1.0) {
	grassVolEnv->setStep(0, 0.0, MAX_VOL);
    } else {
	grassVolEnv->setStep(0, 0.0, MAX_VOL * max_grassvol);
    }
    grassPitchEnv->setStep(0, 0.0, max_grasspitch);

    if (max_skidgrassvol>1.0) {
	skidgrassVolEnv->setStep(0, 0.0, MAX_VOL);
    } else {
	skidgrassVolEnv->setStep(0, 0.0, MAX_VOL * max_skidgrassvol);
    }
    skidgrassPitchEnv->setStep(0, 0.0, max_skidgrasspitch);

    if (max_skid_metalvol>1.0) {
	skid_metalVolEnv->setStep(0, 0.0, MAX_VOL);
    } else {
	skid_metalVolEnv->setStep(0, 0.0, MAX_VOL * max_skid_metalvol);
    }
    skid_metalPitchEnv->setStep(0, 0.0, max_skid_metalpitch);


    if (max_axlevol>1.0) {
	axleVolEnv->setStep(0, 0.0, MAX_VOL);
    } else {
	axleVolEnv->setStep(0, 0.0, MAX_VOL * max_axlevol);
    }
    axlePitchEnv->setStep(0, 0.0, max_axlepitch);
#endif

    sched->update();
   

    if (update_cnt<=0) {
      update_cnt=50;
    } 
    update_cnt--;


    return 0.0;
}

int SortSndPriority(const void* a, const void* b) 
{
    SoundPri* A = (SoundPri*) a;
    SoundPri* B = (SoundPri*) b;
    if (A->a > B->a) {
	return -1;
    } else {
	return 1;
    }
}

void DopplerShift (SoundChar* sound, float* p_src, float* u_src, float* p, float* u)
{
    // Get relative speed/position vector
    float u_rel = 0.0;
    float p_rel = 0.0;
    int i;
    for (i=0; i<3; i++) {
	u_src[i] = u_src[i] - u[i];
	u_rel += u_src[i]*u_src[i];
	
	p_src[i] = p_src[i] -  p[i];
	p_rel += p_src[i]*p_src[i];	    
    }
    
    
    // Only the vector component on the LOV is significant
    //    u_rel = sqrt(u_rel);
    p_rel = 1.0 + sqrt(p_rel);
    float p_cosx = p_src[0]/p_rel;
    float p_cosy = p_src[1]/p_rel;
    float p_cosz = p_src[2]/p_rel;
    float p_x_comp = u_src[0]*p_cosx;
    float p_y_comp = u_src[1]*p_cosy;
    float p_z_comp = u_src[2]*p_cosz;
    u_rel = (p_y_comp + p_x_comp + p_z_comp);

    if (fabs(u_rel)>=0.9*SPEED_OF_SOUND) {
	sound->a = 0.0;
    } else {
	sound->a = 10.0*sound->a/(1.0+p_rel);
	sound->f = sound->f*SPEED_OF_SOUND/(SPEED_OF_SOUND+u_rel);
    }

}

