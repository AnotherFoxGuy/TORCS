/***************************************************************************

    file                 : pathfinder.h
    created              : Tue Oct 9 16:52:00 CET 2001
    copyright            : (C) 2001-2002 by Bernhard Wymann
    email                : berniw@bluewin.ch
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

/*
	should (!) compute a good path
*/

#ifndef _PATHFINDER_H_
#define _PATHFINDER_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <tgf.h>
#include <track.h>
#include <car.h>
#include <raceman.h>
#include <robot.h>
#include <robottools.h>
#include <math.h>
#include <ttypes.h>
#include "trackdesc.h"
#include "mycar.h"
#include "spline.h"
#include "linalg.h"

#define FNPF "drivers/berniw/parameter.dat"
#define FNIS "drivers/berniw/intsinsqr.dat"
#define FNIC "drivers/berniw/intcossqr.dat"

/* how far we look forward for overtaking, collisions, etc */
#define AHEAD 500

#define BERNIW_SECT_PRIV	"berniw private"
#define BERNIW_ATT_PITENTRY	"pitentry"
#define BERNIW_ATT_PITEXIT	"pitexit"

/* how many segments can i pass per simulation step, depends on TRACKRES, simulation->_deltaTime and speed */
#define SEGRANGE 3

/* choose old path */
//#define PATH_BERNIW

/* choose k1999 path */
#define PATH_K1999

class MyCar;
class OtherCar;

typedef struct {
	double x;
	double pd;
	double is;
	double ic;
} tParam;


typedef struct {
	double strdist;			/* straight distance */
	double speedsqr;		/* on track direction projected speed squared of opponent */
	double speed;			/* same, but not squared */
	double time;			/* estimate of time to catch up the car */
	double cosalpha;		/* cos(alpha) from angle between my ond opponent */
	double disttomiddle;	/* distance to middle (for prediction) */
	int catchseg;			/* segment, where i expect (or better guess!) to catch opponent */
	int dist;				/* #segments from me to the other car */
	OtherCar* collcar;		/* pointers to the cars */
} tOCar;


class PathSeg
{
	public:
		inline void set(tdble ispeedsqr, tdble ilength, v3d* ip, v3d* id) {
			speedsqr = ispeedsqr;
			length = ilength;
			p = (*ip);
			if (id != NULL) d = (*id);
		}
		inline void setLoc(v3d* ip) { p = (*ip); }
		inline void setOptLoc(v3d* ip) { o = (*ip); }
		inline void setPitLoc(v3d* ip) { l = (*ip); }

		inline void setSpeedsqr(tdble spsqr) { speedsqr = spsqr; }
		inline void setWeight(tdble w) { weight = w; }

		inline tdble getSpeedsqr() { return speedsqr; }
		inline tdble getLength() { return length; }
		inline tdble getWeight() { return weight; }

		inline v3d* getOptLoc() { return &o; }
		inline v3d* getPitLoc() { return &l; }
		inline v3d* getLoc() { return &p; }
		inline v3d* getDir() { return &d; }

	private:
		tdble speedsqr;	/* max possible speed sqared (speed ist therefore sqrt(speedsqr) */
		tdble length;	/* dist to the next pathseg */
		tdble weight;	/* weight function value for superposition */
		v3d p;			/* position in space, dynamic trajectory */
		v3d o;			/* position in space, static trajectory */
		v3d d;			/* direction vector of dynamic trajectory */
		v3d l;			/* trajectory for pit lane */
};


class Pathfinder
{
	public:
		static const double colldist = 200.0;
		static const int pitpoints = 7;
		static const int NTPARAMS = 1001;				/* # entries in dat files */
		static const double TPRES = PI/(NTPARAMS - 1);	/* resolution of the steps */
		tParam cp[NTPARAMS];							/* holds values needed for clothiod */


		Pathfinder(TrackDesc* itrack, tCarElt* car, tSituation *situation);
		~Pathfinder();
		void plan(int trackSegId, tCarElt* car, tSituation* situation, MyCar* myc, OtherCar* ocar);
		void plan(MyCar* myc);

		void initPit(tCarElt* car);
		inline bool isPitAvailable() { return pit; }
		inline int getPitSegId() { return pitSegId; }
		inline void setPitStop(bool p, int id) {
			if (isPitAvailable() && track->isBetween(e3, (s1 - AHEAD + nPathSeg) % nPathSeg, id) && p)
					pitStop = true ;
				else
					pitStop = false;
		}
		inline bool getPitStop() { return pitStop; }
		inline int segmentsToPit(int id) {
			if (id <= pitSegId) {
				return (pitSegId - id);
			} else {
				return (track->getnTrackSegments() - id + pitSegId);
			}
		}
		void plotPitStopPath(char* filename);
		void plotPath(char* filename);

		inline double sqr(double a) { return a*a; };
		inline double dist(v3d* a, v3d* b) { return sqrt(sqr(a->x-b->x) + sqr(a->y-b->y) + sqr(a->z-b->z)); }
		inline double dist2D(v3d* a, v3d* b) { return sqrt(sqr(a->x-b->x) + sqr(a->y-b->y)); }
		inline PathSeg* getPathSeg(int pathSegId) { return &ps[pathSegId]; }
		int getCurrentSegment(tCarElt* car);
		int getCurrentSegment(tCarElt* car, int range);
		inline int getnPathSeg() { return nPathSeg; }

	private:
		TrackDesc* track;		/* pointer to track data */
		int lastId;				/* segment id of the last call */
		PathSeg* ps;			/* array with the plan */
		int nPathSeg;			/* # of PathSeg */
		int lastPlan;			/* start of the last plan */
		int lastPlanRange;		/* range of the last plan */
		bool pitStop;			/* pitstop ? */
		bool inPit;				/* internal pit state */

		int s1, s3;				/* pitentrystart, pitentryend */
		int e1, e3;				/* pitexitstart, pitexitend */
		v3d *pmypitseg;

		v3d pitLoc;				/* location of pit */
		v3d pitDir;				/* direction vector of the pit */
		v3d toPit;				/* vector pointing perpendicular from the track to the pit */
		int pitSegId;			/* segment id of pit */
		bool pit;
		int pitside;
		int nPitLaneStart;
		int nPitLaneEnd;
		int changed;

		int collcars;
		tOCar* o;

		double ypit[pitpoints], yspit[pitpoints], spit[pitpoints];
		int snpit[pitpoints];

		tCarElt* thiscar;

		void initPitStopPath(void);
		void getPitPoint(int j, int k, double slope, double dist, v3d* r);
		int collision(int trackSegId, tCarElt* mycar, tSituation *s, MyCar* myc, OtherCar* ocar);
		int overtake(int trackSegId, tSituation *s, MyCar* myc, OtherCar* ocar);
		double curvature(double xp, double yp, double x, double y, double xn, double yn);
		void adjustRadius(int s, int p, int e, double c, double carwidth);
		void stepInterpolate(int iMin, int iMax, int Step);
		void interpolate(int Step);
		void smooth(int Step);

		int correctPath(int id, tCarElt* car, MyCar* myc);

		bool loadClothoidParams(tParam* p);
		double intsinsqr(double alpha);
		double intcossqr(double alpha);
		double clothparam(double alpha);
		double clothsigma(double beta, double y);
		double clothlength(double beta, double y);

		int findStartSegId(int id);
		int findEndSegId(int id);
		int initStraight(int id, double w);
		int initLeft(int id, double w);
		int initRight(int id, double w);
		double computeWeight(double x, double len);
		void setLocWeighted(int id, double newweight, v3d* newp);
		void smooth(int s, int e, int p, double w);
		void smooth(int id, double delta, double w);
		void optimize(int start, int range, double w);
		void optimize2(int start, int range, double w);
		void optimize3(int start, int range, double w);
		int updateOCar(int trackSegId, tSituation *s, MyCar* myc, OtherCar* ocar, tOCar* o);

		inline double pathSlope(int id) {
			double dp = (*ps[id].getDir())*(*track->getSegmentPtr(id)->getToRight());
			double alpha = PI/2.0 - acos(dp);
			return sin(alpha);
		}
};

#endif // _PATHFINDER_H_

