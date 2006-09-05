# **********************************************************************
#
# Copyright (c) 2003-2006 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= ..\..

LIBNAME		= $(top_srcdir)\lib\iceutil$(LIBSUFFIX).lib
DLLNAME         = $(top_srcdir)\bin\iceutil$(SOVERSION)$(LIBSUFFIX).dll

TARGETS		= $(LIBNAME) $(DLLNAME)

OBJS		= Base64.obj \
		  Cond.obj \
                  ConvertUTF.obj \
		  CountDownLatch.obj \
		  CtrlCHandler.obj \
		  Exception.obj \
		  Shared.obj \
		  InputUtil.obj \
		  MD5.obj \
		  MD5I.obj \
		  Options.obj \
		  OutputUtil.obj \
		  Random.obj \
		  RWRecMutex.obj \
		  RecMutex.obj \
		  StaticMutex.obj \
		  StringUtil.obj \
		  Thread.obj \
		  ThreadException.obj \
		  Time.obj \
		  UUID.obj \
		  Unicode.obj

SRCS		= $(OBJS:.obj=.cpp)

!include $(top_srcdir)/config/Make.rules.mak

CPPFLAGS        = $(CPPFLAGS) -DICE_UTIL_API_EXPORTS -I..

!if "$(BORLAND_HOME)" == "" & "$(OPTIMIZE)" != "yes"
PDBFLAGS	= /pdb:$(DLLNAME:.dll=.pdb)
!endif

$(LIBNAME): $(DLLNAME)

$(DLLNAME): $(OBJS)
	del /q $@
	$(LINK) $(LD_DLLFLAGS) $(PDBFLAGS) $(OBJS) $(PREOUT)$(DLLNAME) $(PRELIBS)$(ICE_OS_LIBS)
	move $(DLLNAME:.dll=.lib) $(LIBNAME)

clean::
	del /q $(DLLNAME:.dll=.*)

install:: all
	copy $(LIBNAME) $(install_libdir)
	copy $(DLLNAME) $(install_bindir)

!if "$(BORLAND_HOME)" == "" & "$(OPTIMIZE)" != "yes"

install:: all
	copy $(DLLNAME:.dll=.pdb) $(install_bindir)

!endif

!include .depend
