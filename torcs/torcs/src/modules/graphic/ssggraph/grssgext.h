/***************************************************************************

    file                 : grssgext.h
    created              : Wed Aug 30 01:35:45 CEST 2000
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
 
/** @file    
    		This file contains the divergences from PLIB.
		I derived PLIB objects to adapt them to my needs.
    @author	<a href=mailto:torcs@free.fr>Eric Espie</a>
    @version	$Id$
*/

#ifndef _GRSSGEXT_H_
#define _GRSSGEXT_H_


/*
 * An ssgBranch with pre and post draw callbacks.
 * It must be clear that all the children nodes
 * have to be non-transparent in order to be 
 * drawn immediately.
 */
class ssgBranchCb : public ssgBranch
{

 protected:

  ssgCallback  preDrawCB;
  ssgCallback postDrawCB;
  
 public:

  ssgBranchCb(void):ssgBranch() {
    preDrawCB = NULL;
    postDrawCB = NULL;
  }
  
  void cull  ( sgFrustum *f, sgMat4 m, int test_needed ) 
    {
      int cull_result = cull_test ( f, m, test_needed ) ;
      
      if ( cull_result == SSG_OUTSIDE )
	return ;
      
      if ( preDrawCB != NULL && ! (*preDrawCB)(this) )
	return ;
      
      for ( ssgEntity *e = getKid ( 0 ) ; e != NULL ; e = getNextKid() )
	e -> cull ( f, m, cull_result != SSG_INSIDE ) ;
      
      if ( postDrawCB != NULL )
	(*postDrawCB)(this) ;
    }

  void setCallback ( int cb_type, ssgCallback cb ) {
    if ( cb_type == SSG_CALLBACK_PREDRAW )
      preDrawCB = cb ;
    else
      postDrawCB = cb ;
  }

};


/* Use the texture name to select options like mipmap */
class ssgLoaderOptionsEx : public ssgLoaderOptions
{
 public:
    ssgLoaderOptionsEx(ssgAppStateFunc        _app_state_cb,
		       ssgCreateLeafFunc      _create_leaf_cb = 0,
		       ssgHookFunc            _hook_cb = 0,
		       ssgCreateTextureFunc   _create_texture_cb = 0,
		       ssgCreateTransformFunc _create_transform_cb = 0)
	: ssgLoaderOptions(_app_state_cb,
			   _create_leaf_cb,
			   _hook_cb,
			   _create_texture_cb,
			   _create_transform_cb) 
	{}

    ssgTexture* createTexture(char* tfname, 
			      int wrapu  = TRUE, int wrapv = TRUE, 
			      int mipmap = TRUE) const
	{
	    char *buf;
	    char *s;

	    buf = (char *)malloc(strlen(tfname)+1);
	    strcpy(buf, tfname);

	    /* find the filename extension */
	    s = strrchr(buf, '.');
	    if (s) {
		*s = 0;
	    }
      
	    /* search for the texture parameters */
	    s = strrchr(buf, '_');
      
	    if (s) {
		/* no mipmap */
		if (strncmp(s, "_nmm", 4) == 0) {
		    mipmap = FALSE;
		}
	    }
	    free(buf);
      
	    return ssgLoaderOptions::createTexture(tfname, wrapu, wrapv, mipmap) ;
	}

};



#endif /* _GRSSGEXT_H_ */ 



