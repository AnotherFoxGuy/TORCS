##############################################################################
#
#    file                 : Makefile
#    created              : Sat Mar 18 23:21:24 CET 2000
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


ROBOT     = inferno

MODULE    = ${ROBOT}.so

MODULEDIR = drivers/${ROBOT}

SOURCES   = ${ROBOT}.cpp common.cpp

SHIPDIR   = drivers/${ROBOT}

SHIP      = ${ROBOT}.xml car1.xml logo.rgb mclaren-f1.rgb

SHIPSUBDIRS = $(shell find * -maxdepth 0 -type d -print | grep -v CVS | grep -v tracksdata)

PKGSUBDIRS		= ${SHIPSUBDIRS}

src-robots-base_PKGFILES	= $(shell find * -maxdepth 0 -type f -print)

src-robots-base_PKGDIR		= ${PACKAGE}-${VERSION}/$(subst ${TORCS_BASE},,$(shell pwd))

include ${MAKE_DEFAULT}


