// **********************************************************************
//
// Copyright (c) 2002
// MutableRealms, Inc.
// Huntsville, AL, USA
//
// All Rights Reserved
//
// **********************************************************************

#ifndef ICE_TRACE_LEVELS_F_H
#define ICE_TRACE_LEVELS_F_H

#include <Ice/Handle.h>

namespace __Ice
{

class TraceLevelsI;
void ICE_API incRef(TraceLevelsI*);
void ICE_API decRef(TraceLevelsI*);
typedef __Ice::Handle<TraceLevelsI> TraceLevels;

}

#endif
