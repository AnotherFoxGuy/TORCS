##############################################################################
#
#    file        : Makefile
#    created     : Sun Nov 10 19:52:39 CET 2002
#    copyright   : (C) 2002 by Eric Espi�                        
#    email       : Eric.Espie@torcs.org   
#    version     : $Id$                                  
#
##############################################################################
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
##############################################################################

CAR       = vm-x4

DATADIR   = cars/$(CAR)

DATA      = $(shell find *.txt -maxdepth 0 -type f -print) \
            $(shell find *.xml -maxdepth 0 -type f -print) \
            $(shell find *.rgb -maxdepth 0 -type f -print) \
            $(shell find *.acc -maxdepth 0 -type f -print) \
        $(shell find *.png -maxdepth 0 -type f -print)

data-cars-VM_PKGFILES	= $(DATA) $(shell find *.xcf -maxdepth 0 -type f -print)

data-cars-VM_PKGDIR	= $(DATADIR)

include ${MAKE_DEFAULT}



