c
c     store directives for checkpoint level 1
c
c     created: heimbach@mit.edu 10-Jan-2002
c
#ifdef INCLUDE_EXTERNAL_FORCING_PACKAGE
# ifdef ALLOW_ATM_TEMP
CADJ STORE aqh0      = comlev1, key = ikey_dynamics
CADJ STORE aqh1      = comlev1, key = ikey_dynamics
CADJ STORE atemp0    = comlev1, key = ikey_dynamics
CADJ STORE atemp1    = comlev1, key = ikey_dynamics
CADJ STORE precip0   = comlev1, key = ikey_dynamics
CADJ STORE precip1   = comlev1, key = ikey_dynamics
CADJ STORE lwflux0   = comlev1, key = ikey_dynamics
CADJ STORE lwflux1   = comlev1, key = ikey_dynamics
CADJ STORE swflux0   = comlev1, key = ikey_dynamics
CADJ STORE swflux1   = comlev1, key = ikey_dynamics
#  ifdef EXF_READ_EVAP
CADJ STORE evap0     = comlev1, key = ikey_dynamics
CADJ STORE evap1     = comlev1, key = ikey_dynamics
#  else
CADJ STORE evap      = comlev1, key = ikey_dynamics
#  endif
#  ifdef ALLOW_DOWNWARD_RADIATION
CADJ STORE swdown0   = comlev1, key = ikey_dynamics
CADJ STORE swdown1   = comlev1, key = ikey_dynamics
CADJ STORE lwdown0   = comlev1, key = ikey_dynamics
CADJ STORE lwdown1   = comlev1, key = ikey_dynamics
#  endif
# else
CADJ STORE hflux0    = comlev1, key = ikey_dynamics
CADJ STORE hflux1    = comlev1, key = ikey_dynamics
CADJ STORE sflux0    = comlev1, key = ikey_dynamics
CADJ STORE sflux1    = comlev1, key = ikey_dynamics
#  ifdef ALLOW_KPP
CADJ STORE swflux0   = comlev1, key = ikey_dynamics
CADJ STORE swflux1   = comlev1, key = ikey_dynamics
#  endif
# endif /* ALLOW_ATM_TEMP */
# ifdef ALLOW_ATM_WIND
CADJ STORE uwind0    = comlev1, key = ikey_dynamics
CADJ STORE uwind1    = comlev1, key = ikey_dynamics
CADJ STORE vwind0    = comlev1, key = ikey_dynamics
CADJ STORE vwind1    = comlev1, key = ikey_dynamics
# else
CADJ STORE ustress0  = comlev1, key = ikey_dynamics
CADJ STORE ustress1  = comlev1, key = ikey_dynamics
CADJ STORE vstress0  = comlev1, key = ikey_dynamics
CADJ STORE vstress1  = comlev1, key = ikey_dynamics
# endif  /* ALLOW_ATM_WIND */
# ifdef ALLOW_BULKFORMULAE
CADJ STORE theta     = comlev1, key = ikey_dynamics
# endif
# ifdef ALLOW_CLIMSSS_RELAXATION
CADJ STORE climsss0   = comlev1, key = ikey_dynamics
CADJ STORE climsss1   = comlev1, key = ikey_dynamics
# endif
#ifdef ALLOW_CLIMSST_RELAXATION
CADJ STORE climsst0   = comlev1, key = ikey_dynamics
CADJ STORE climsst1   = comlev1, key = ikey_dynamics
# endif
#ifdef ALLOW_CLIMSALT_RELAXATION
cph not used so far
cphCADJ STORE climsalt0  = comlev1, key = ikey_dynamics
cphCADJ STORE climsalt1  = comlev1, key = ikey_dynamics
# endif
#ifdef ALLOW_CLIMTEMP_RELAXATION
cph not used so far
cphCADJ STORE climtemp0  = comlev1, key = ikey_dynamics
cphCADJ STORE climtemp1  = comlev1, key = ikey_dynamics
# endif
# ifdef ATMOSPHERIC_LOADING
CADJ STORE apressure0    = comlev1, key = ikey_dynamics
CADJ STORE apressure1    = comlev1, key = ikey_dynamics
# endif

# ifdef ALLOW_HFLUX_CONTROL
CADJ STORE xx_hflux0     = comlev1, key = ikey_dynamics
CADJ STORE xx_hflux1     = comlev1, key = ikey_dynamics
# endif
# ifdef ALLOW_SFLUX_CONTROL
CADJ STORE xx_sflux0     = comlev1, key = ikey_dynamics
CADJ STORE xx_sflux1     = comlev1, key = ikey_dynamics
# endif
# ifdef ALLOW_USTRESS_CONTROL
CADJ STORE xx_tauu0      = comlev1, key = ikey_dynamics
CADJ STORE xx_tauu1      = comlev1, key = ikey_dynamics
# endif
# ifdef ALLOW_VSTRESS_CONTROL
CADJ STORE xx_tauv0      = comlev1, key = ikey_dynamics
CADJ STORE xx_tauv1      = comlev1, key = ikey_dynamics
# endif
#endif /* INCLUDE_EXTERNAL_FORCING_PACKAGE */

#ifdef ALLOW_SEAICE
CADJ STORE area          = comlev1, key = ikey_dynamics
CADJ STORE heff          = comlev1, key = ikey_dynamics
CADJ STORE hsnow         = comlev1, key = ikey_dynamics
CADJ STORE tice          = comlev1, key = ikey_dynamics
CADJ STORE runoff        = comlev1, key = ikey_dynamics
#endif
