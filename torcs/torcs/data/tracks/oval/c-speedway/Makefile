##############################################################################
#
#    file                 : Makefile
#    created              : Sun Feb 13 17:25:53 CET 2000
#    copyright            : (C) 2000 by Eric Espie                         
#    email                : torcs@free.fr   
#    version              : $Id$                                  
#
##############################################################################
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
##############################################################################

TRACK	  = c-speedway

CATEGORY  = oval

DATADIR   = tracks/$(CATEGORY)/$(TRACK)

DATA      = $(shell find * -maxdepth 0 -type f -print)

data-tracks-oval_PKGFILES	= $(DATA)

data-tracks-oval_PKGDIR		= $(DATADIR)

include ${MAKE_DEFAULT}


