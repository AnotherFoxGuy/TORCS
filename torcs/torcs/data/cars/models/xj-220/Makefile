##############################################################################
#
#    file                 : Makefile
#    created              : Sun May  6 15:25:23 CEST 2001
#    copyright            : (C) 2001 by Eric Espi�                        
#    email                : Eric.Espie@torcs.org   
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

CAR          = xj-220

DATADIR      = cars/$(CAR)

DATA         = $(CAR).xml readme.txt\
               $(CAR).rgb tex-wheel.rgb shadow.rgb \
               $(shell find *.acc -maxdepth 0 -type f -print) \
        $(shell find *.png -maxdepth 0 -type f -print)

data-cars-extra_PKGFILES	= $(DATA) $(shell find *.xcf -maxdepth 0 -type f -print)

data-cars-extra_PKGDIR		= $(DATADIR)

include ${MAKE_DEFAULT}


