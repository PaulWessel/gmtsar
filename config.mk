#-------------------------------------------------------------------------------
#	$Id: config.mk.in 227 2015-08-12 00:25:27Z pwessel $
#
#	Standard Makefile Macro Setup for GMTSAR
#
# Edit this file only, NOT the makefile itself.
#-------------------------------------------------------------------------------
# The purpose of this section is to contain common make macros
# that should be processed by every execution of that utility.
#-------------------------------------------------------------------------------

# POSIX shell.  On some platforms it is not /bin/sh.
SHELL		= /bin/sh

# Installation Directories:
PACKAGE_TARNAME = gmtsar
GMTSARHOME	= /usr/local/GMTSAR
ORBITS_DIR	= /usr/local/orbits
TIFF_INC	= /opt/local/include
TIFF_LIB	= /opt/local/lib
LALIBS		= -framework Accelerate
prefix          = /usr/local/GMTSAR
exec_prefix     = ${prefix}
bindir		= $(DESTDIR)${exec_prefix}/bin
sharedir	= $(DESTDIR)/usr/local/GMTSAR/share/gmtsar

# GMTSAR version number
GMTSAR_VERSION = 5.5.0

# Compilers, if $CC not set in environment
CC		= gcc

# Preprocessing:
CPP		= gcc -E
CPPFLAGS	= $(INCLUDES) $(DEFINES) 
HDF5_CPPFLAGS	= -I/usr/local/opt/szip/include -I/usr/local/Cellar/hdf5/1.10.5/include
HDF5_LDFLAGS	= -L/usr/local/opt/szip/lib -L/usr/local/Cellar/hdf5/1.10.5/lib 

#-------------------------------------------------------------------------------
#	Math library specification 
#	(Will most of the time be -lm, on Solaris -lsunmath -lm)
#-------------------------------------------------------------------------------
#
LIBS		= 
HDF5_LIBS	= -lm -ldl -lz -lsz  -lhdf5 -lhdf5_hl -lhdf5_cpp
#
#-------------------------------------------------------------------------------
#	Miscellaneous Standard Utilities
#-------------------------------------------------------------------------------
#
INSTALL		= /usr/bin/install -c
AWK		= awk
AR		= ar
RANLIB		= ranlib
CSH		= csh
LD		= ld
LN_S		= ln -s
GNUTAR		= :
#
#-------------------------------------------------------------------------------
#	Required directives for GMT includes and library
#-------------------------------------------------------------------------------
GMT_INC		= -I/usr/local/include/gmt
GMT_LIB		= -L/usr/local/lib -lgmt
#
#-------------------------------------------------------------------------------
#	Required directives for GMTSAR library
#-------------------------------------------------------------------------------
GMTSAR		= -L/usr/local/GMTSAR/gmtsar -lgmtsar
#
#-------------------------------------------------------------------------------
#	Compiler switches and linker flags
#-------------------------------------------------------------------------------
#
CFLAGS		=  -O2 -Wall -m64 -fPIC -fno-strict-aliasing -std=c99
LDFLAGS		=  -m64 -Wl,-x
#
#-------------------------------------------------------------------------------
#	Shared library file extension. Examples:
#	Solaris, Linux, IRIX: so	HP: sl		Mac OS X: dylib
#	SL_VERSION is extension for versioned shared libraries. Examples:
#	Linux: so.<version>		Mac OS X: <version>.dylib
#	Set SL_VERSION = $(SL) to prevent the creation of versioned shared libraries
#-------------------------------------------------------------------------------
#
SL		= so
SL_VERSION	= $(SL)
#
#-------------------------------------------------------------------------------
#	Set  LIBEXT = a      to create static libraries (default)
#	Set  LIBEXT = $(SL)  to create shared libraries (and set SL below)
#-------------------------------------------------------------------------------
#
LIBEXT		= a
#-------------------------------------------------------------------------------
#	Linker switch for building shared libraries
#	SunOS: -G  HP-UX: -b  Linux,IRIX: -shared
#-------------------------------------------------------------------------------
#
LD_OPT		= 
#-------------------------------------------------------------------------------
