C $Header: /u/gcmpack/MITgcm/pkg/monitor/MONITOR_OPTIONS.h,v 1.1.4.1 2003/10/02 18:18:33 adcroft Exp $
C $Name:  $

C CPP options file for monitor package
C
C Use this file for selecting options within the monitor package

#ifndef MONITOR_OPTIONS_H
#define MONITOR_OPTIONS_H
#include "PACKAGES_CONF.h"
#ifdef ALLOW_MONITOR

#include "CPP_OPTIONS.h"

C Disable use of hFacZ
#undef MONITOR_TEST_HFACZ

#endif /* ALLOW_MONITOR */
#endif /* MONITOR_OPTIONS_H */
