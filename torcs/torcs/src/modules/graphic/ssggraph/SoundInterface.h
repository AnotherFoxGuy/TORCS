// -*- Mode: c++ -*-
/***************************************************************************
    file                 : SoundInterface.h
    created              : Tue Apr 5 19:57:35 CEST 2005
    copyright            : (C) 2005 Christos Dimitrakakis
    email                : dimitrak@idiap.ch
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

#ifndef SOUND_INTERFACE_H
#define SOUND_INTERFACE_H

#define USE_OPENAL 1



#include <plib/sl.h>
#include <plib/sg.h>
#include <raceman.h>
#include <vector>

#include "TorcsSound.h"
//#include "grsound.h"
#include "QSoundChar.h"

class CarSoundData;

typedef struct QueueSoundMap_ {
	QSoundChar CarSoundData::*schar;
	TorcsSound* snd;
	float max_vol;
	int id;
} QueueSoundMap;

enum SoundPriState {
    None=0x0, Loaded, Playing, Paused, Stopped, Cleared
};

typedef struct SoundPri_ {
    float a; ///< amplitude
    int id; ///< car ID.
} SoundPri;

class SoundInterface {
protected:
	float sampling_rate;
	int n_channels;
	int n_engine_sounds;
	int curCrashSnd;
	TorcsSound* skid_sound[4];
	TorcsSound* road_ride_sound;
	TorcsSound* grass_ride_sound;
	TorcsSound* grass_skid_sound;
	TorcsSound* metal_skid_sound;
	TorcsSound* axle_sound;
	TorcsSound* turbo_sound;
	TorcsSound* backfire_loop_sound;
	TorcsSound* crash_sound[NB_CRASH_SOUND];
	TorcsSound* bang_sound;
	TorcsSound* bottom_crash_sound;
	TorcsSound* backfire_sound;
	TorcsSound* gear_change_sound;
public:
    SoundInterface(float sampling_rate, int n_channels)
	{
		this->sampling_rate = sampling_rate;
		this->n_channels = n_channels;
		for (int i=0; i<4; i++) {
			skid_sound[i]=NULL;
		}
		road_ride_sound=NULL;
		grass_ride_sound=NULL;
		grass_skid_sound=NULL;
		metal_skid_sound=NULL;
		axle_sound=NULL;
		turbo_sound=NULL;
		backfire_loop_sound=NULL;
		for (int i=0; i<NB_CRASH_SOUND; i++) {
			crash_sound[i]=NULL;
		}
		curCrashSnd = 0;
		bang_sound=NULL;
		bottom_crash_sound=NULL;
		gear_change_sound=NULL;
		n_engine_sounds = n_channels - 11;
		int MAX_N_ENGINE_SOUNDS = 8;
		if (n_engine_sounds<1) {
			n_engine_sounds = 1;
			fprintf (stderr, "Warning: maybe insufficient channels\n");
		} else if (n_engine_sounds > MAX_N_ENGINE_SOUNDS) {
			n_engine_sounds = MAX_N_ENGINE_SOUNDS;
		}
	}
    virtual ~SoundInterface() {}
	virtual void setNCars(int n_cars) = 0;
	virtual TorcsSound* addSample (const char* filename,
								   int flags = (ACTIVE_VOLUME|ACTIVE_PITCH),
								   bool loop = false) = 0;
	void setSkidSound (const char* sound_name)
	{
		for (int i=0; i<4; i++) {
			TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
			skid_sound[i] = sound;
		}

	}
	void setRoadRideSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
		road_ride_sound = sound;
	}
	void setGrassRideSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
		grass_ride_sound = sound;
	}
	void setGrassSkidSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
		grass_skid_sound = sound;
	}
	void setMetalSkidSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
		metal_skid_sound = sound;
	}
	void setAxleSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
		axle_sound = sound;
	}
	void setTurboSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
		turbo_sound = sound;
	}
	void setBackfireLoopSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, ACTIVE_VOLUME|ACTIVE_PITCH, true);
		backfire_loop_sound = sound;
	}
	void setCrashSound (const char* sound_name, int index)
	{
		TorcsSound* sound = addSample (sound_name, 0, false);
		assert (index>=0 && index<NB_CRASH_SOUND);
		crash_sound[index] = sound;
	}

	void setBangSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, 0, false);
		bang_sound = sound;
	}

	void setBottomCrashSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, 0, false);
		bottom_crash_sound = sound;
	}

	void setBackfireSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, 0, false);
		backfire_sound = sound;
	}

	void setGearChangeSound (const char* sound_name)
	{
		TorcsSound* sound = addSample (sound_name, 0, false);
		gear_change_sound = sound;
	}
	/// Update sound for a given observer.
	virtual void update(CarSoundData** car_sound_data,
						int n_cars, sgVec3 p_obs, sgVec3 u_obs, 
						sgVec3 c_obs = NULL, sgVec3 a_obs = NULL)
	{
		// do nothing
	}
	virtual float getGlobalGain() {return 1.0f;}
	virtual void setGlobalGain(float g) 
	{
		fprintf (stderr, "Warning, gain setting not supported\n");
	}

};

class PlibSoundInterface : public SoundInterface {
	typedef struct SoundChar_ {
		float f; //frequency modulation
		float a; //amplitude modulation
	} SoundChar;
protected:
	slScheduler* sched;
	std::vector<TorcsSound*> sound_list;
	SoundPri* engpri;
	PlibSoundSource* car_src;
	PlibSoundSource tyre_src[4];
	void DopplerShift (SoundChar* sound, float* p_src, float* u_src, float* p, float* u);
	
public:
	PlibSoundInterface(float sampling_rate, int n_channels) : SoundInterface (sampling_rate, n_channels)
	{
		sched = new slScheduler ((int) sampling_rate);
		sched->setSafetyMargin (0.128f);
		sched->setMaxConcurrent (n_channels);
		engpri = NULL;
		car_src = NULL;
	}
	virtual ~PlibSoundInterface()
	{
		for (unsigned int i=0; i<sound_list.size(); i++) {
			delete sound_list[i];
		}
		delete [] engpri;
		delete sched;

		if (car_src) {
			delete [] car_src;
		}

	}

	virtual void setNCars(int n_cars)
	{
		engpri = new SoundPri[n_cars];
		car_src = new PlibSoundSource[n_cars];
	}
	virtual slScheduler* getScheduler()
	{
		return sched;
	}
	virtual TorcsSound* addSample (const char* filename,
							int flags = (ACTIVE_VOLUME|ACTIVE_PITCH),
							bool loop = false)
	{
		TorcsSound* sound = new PlibTorcsSound (sched, filename, flags, loop);
		sound_list.push_back (sound);
		return sound;
	}
	
	virtual void update(CarSoundData** car_sound_data, int n_cars, sgVec3 p_obs, sgVec3 u_obs, sgVec3 c_obs = NULL, sgVec3 a_obs = NULL);

};


class OpenalSoundInterface : public SoundInterface {
	typedef struct SoundChar_ {
		float f; //frequency modulation
		float a; //amplitude modulation
	} SoundChar;
protected:
	void* cc;
	ALCdevice* dev;
	float global_gain;
	std::vector<TorcsSound*> sound_list;
	SoundPri* engpri;
	QueueSoundMap road;
	QueueSoundMap grass;
	QueueSoundMap grass_skid;
	QueueSoundMap metal_skid;
	QueueSoundMap backfire_loop;
	QueueSoundMap turbo;
	QueueSoundMap axle;
	//OpenalSoundSource* cars;
	//OpenalSoundSource tyres[4];
	void DopplerShift (SoundChar* sound, float* p_src, float* u_src, float* p, float* u);
	void SortSingleQueue (CarSoundData** car_sound_data, 
						  QueueSoundMap* smap,
						  int n_cars);
	void SetMaxSoundCar(CarSoundData** car_sound_data,
						QueueSoundMap* smap);
public:
	OpenalSoundInterface(float sampling_rate, int n_channels);
	virtual ~OpenalSoundInterface();
	virtual void setNCars(int n_cars);
	virtual TorcsSound* addSample (const char* filename,
								   int flags = (ACTIVE_VOLUME|ACTIVE_PITCH),
								   bool loop = false);
	virtual void update(CarSoundData** car_sound_data, int n_cars, sgVec3 p_obs, sgVec3 u_obs, sgVec3 c_obs, sgVec3 a_obs);
	virtual float getGlobalGain() {return global_gain;}
	virtual void setGlobalGain(float g)
	{
		global_gain = 0.5f*g;
		printf("Setting gain to %f\n", global_gain);
	}


};

int sortSndPriority(const void* a, const void* b);

#endif /* SOUND_INTERFACE_H */