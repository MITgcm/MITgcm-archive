C $Header: /u/gcmpack/MITgcm/pkg/shelfice/shelfice_check.F,v 1.11 2017/12/15 19:37:08 jmc Exp $
C $Name:  $
#include "SHELFICE_OPTIONS.h"

      SUBROUTINE SHELFICE_CHECK( myThid )
C     *==========================================================*
C     | SUBROUTINE SHELFICE_CHECK                                |
C     | o Validate basic package setup and inter-package         |
C     | dependencies.                                            |
C     *==========================================================*
      IMPLICIT NONE

C     === Global variables ===
#include "SIZE.h"
#include "EEPARAMS.h"
#include "PARAMS.h"
#include "SHELFICE.h"

C     === Routine arguments ===
C     myThid   :  Number of this instance of SHELFICE_CHECK
      INTEGER myThid

#ifdef ALLOW_SHELFICE

C     === Local variables ===
C     msgBuf   :: Informational/error message buffer
      CHARACTER*(MAX_LEN_MBUF) msgBuf
      INTEGER errCount

      _BEGIN_MASTER(myThid)
      errCount = 0

      WRITE(msgBuf,'(A)') 'SHELFICE_CHECK: #define ALLOW_SHELFICE'
      CALL PRINT_MESSAGE( msgBuf, standardMessageUnit,
     &     SQUEEZE_RIGHT, myThid )

C     print shelfice summary here before checking the parameter combinations
      WRITE(msgBuf,'(A)') ' '
      CALL PRINT_MESSAGE( msgBuf, standardMessageUnit,
     &     SQUEEZE_RIGHT, myThid )
      WRITE(msgBuf,'(A)')
     &     'SHELFICE_CHECK: start of SHELFICE config. summary'
      CALL PRINT_MESSAGE( msgBuf, standardMessageUnit,
     &     SQUEEZE_RIGHT, myThid )

       CALL WRITE_0D_L( SHELFICEisOn, INDEX_NONE,
     &   'SHELFICEisOn =', ' /* package is turned on */')

       CALL WRITE_0D_L( useISOMIPTD, INDEX_NONE,
     &   'useISOMIPTD =', ' /* use simple isomip thermodynamics */')
       CALL WRITE_0D_L( SHELFICEconserve, INDEX_NONE,
     &   'SHELFICEconserve =',
     &      ' /* use a conservative form of boundary conditions */')
       CALL WRITE_0D_L( SHELFICEboundaryLayer, INDEX_NONE,
     &   'SHELFICEboundaryLayer =',
     &   ' /* use simple boundary layer scheme to suppress noise */')
       CALL WRITE_0D_L( SHELFICEadvDiffHeatFlux, INDEX_NONE,
     &   'SHELFICEadvDiffHeatFlux =',
     &   ' /* use adv.-diff. instead of just diff. heat flux into'//
     &   ' the ice shelf */')
       CALL WRITE_0D_L( SHELFICEMassStepping, INDEX_NONE,
     &   'SHELFICEMassStepping =',
     &   ' /* step forward ice shelf mass/thickness */')
       CALL WRITE_0D_L( no_slip_shelfice, INDEX_NONE,
     &   'no_slip_shelfice =', ' /* use no slip boundary conditions */')
       CALL WRITE_0D_RL( SHELFICEdragLinear, INDEX_NONE,
     & 'SHELFICEdragLinear    =', ' /* linear drag coefficient */')
       CALL WRITE_0D_RL( SHELFICEdragQuadratic, INDEX_NONE,
     & 'SHELFICEdragQuadratic =', ' /* quadratic drag coefficient */')
       CALL WRITE_0D_I( SHELFICEselectDragQuadr, INDEX_NONE,
     &  'SHELFICEselectDragQuadr =',
     &  ' /* select quadratic drag option */')
       CALL WRITE_0D_RL( SHELFICElatentHeat, INDEX_NONE,
     & 'SHELFICElatentHeat      =', ' /* latent heat of ice */')
       CALL WRITE_0D_RL( SHELFICEheatCapacity_Cp, INDEX_NONE,
     & 'SHELFICEheatCapacity_Cp =', ' /* heat capacity of ice shelf */')
       CALL WRITE_0D_RL( rhoShelfice, INDEX_NONE,
     & 'rhoShelfice   =', ' /* density of ice shelf */')
       CALL WRITE_0D_RL( SHELFICEkappa, INDEX_NONE,
     & 'SHELFICEkappa =', ' /* thermal conductivity of ice shelf */')
       CALL WRITE_0D_RL( SHELFICEthetaSurface, INDEX_NONE,
     & 'SHELFICEthetaSurface =',' /* surface temperature above i.s. */')
       CALL WRITE_0D_RL( SHELFICEheatTransCoeff, INDEX_NONE,
     & 'SHELFICEheatTransCoeff =', ' /* heat transfer coefficient */')
       CALL WRITE_0D_RL( SHELFICEsaltTransCoeff, INDEX_NONE,
     & 'SHELFICEsaltTransCoeff =', ' /* salt transfer coefficient */')

       CALL WRITE_0D_L( SHELFICEuseGammaFrict, INDEX_NONE,
     &   'SHELFICEuseGammaFrict =',
     &   ' /* use velocity dependent exchange coefficients */')
       IF ( SHELFICEuseGammaFrict ) THEN
        CALL WRITE_0D_L( SHELFICE_oldCalcUStar, INDEX_NONE,
     &   'SHELFICE_oldCalcUStar =', ' /* use old uStar expression */')
        CALL WRITE_0D_RL( shiCdrag, INDEX_NONE,
     & 'shiCdrag   =', ' /* quadr. drag coefficient for uStar */')
        CALL WRITE_0D_RL( shiZetaN, INDEX_NONE,
     & 'shiZetaN   =', ' /* parameter for gammaTurb */')
        CALL WRITE_0D_RL( shiRc, INDEX_NONE,
     & 'shiRc      =', ' /* parameter for gammaTurb (not used) */')
        CALL WRITE_0D_RL( shiPrandtl, INDEX_NONE,
     & 'shiPrandtl =', ' /* const. Prandtl No. for gammaTurb */')
        CALL WRITE_0D_RL( shiSchmidt, INDEX_NONE,
     & 'shiSchmidt =', ' /* const. Schmidt No. for gammaTurb */')
        CALL WRITE_0D_RL( shiKinVisc, INDEX_NONE,
     & 'shiKinVisc =', ' /* const. kin. viscosity for gammaTurb */')
       ENDIF

      CALL WRITE_0D_C( SHELFICEloadAnomalyFile, -1, INDEX_NONE,
     &  'SHELFICEloadAnomalyFile =',
     &  ' /* file name of loaded loadAnomaly field */')
      CALL WRITE_0D_C( SHELFICEmassFile, -1, INDEX_NONE,
     &  'SHELFICEmassFile =', ' /* file name of loaded mass field */')
      CALL WRITE_0D_C( SHELFICEtopoFile, -1, INDEX_NONE,
     &  'SHELFICEtopoFile =',
     &  ' /* file name of loaded under-ice topography */')
      CALL WRITE_0D_C( SHELFICEMassDynTendFile, -1, INDEX_NONE,
     &  'SHELFICEMassDynTendFile =',
     &  ' /* file name of loaded dynamic mass tendency field */')
C-    I/O parameters:
       CALL WRITE_0D_L( SHELFICEwriteState, INDEX_NONE,
     &   'SHELFICEwriteState  =', ' /* do simple standard output */')
       CALL WRITE_0D_L( SHELFICE_dump_mdsio, INDEX_NONE,
     &   'SHELFICE_dump_mdsio =', ' /* use mdsio for snapshots */')
       CALL WRITE_0D_L( SHELFICE_tave_mdsio, INDEX_NONE,
     &   'SHELFICE_tave_mdsio =', ' /* use mdsio for time averages */')
       CALL WRITE_0D_L( SHELFICE_dump_mnc, INDEX_NONE,
     &   'SHELFICE_dump_mnc   =', ' /* use netcdf for snapshots */')
       CALL WRITE_0D_L( SHELFICE_tave_mnc, INDEX_NONE,
     &   'SHELFICE_tave_mnc   =', ' /* use netcdf for time averages */')
       CALL WRITE_0D_RL( SHELFICE_dumpFreq, INDEX_NONE,
     & 'SHELFICE_dumpFreq =', ' /* analoguous to dumpFreq */')
       CALL WRITE_0D_RL( SHELFICE_taveFreq, INDEX_NONE,
     & 'SHELFICE_taveFreq =', ' /* analoguous to taveFreq */')

      WRITE(msgBuf,'(A)')
     &     'SHELFICE_CHECK: end of SHELFICE config. summary'
      CALL PRINT_MESSAGE( msgBuf, standardMessageUnit,
     &     SQUEEZE_RIGHT, myThid )

C     Consistent choice of parameter:
      IF ( SHELFICEmassFile.NE.' ' .AND. SHELFICEloadAnomalyFile.NE.' '
     &   ) THEN
         WRITE(msgBuf,'(2A)') 'SHELFICE_CHECK: cannot specify both',
     &      ' SHELFICEmassFile and SHELFICEloadAnomalyFile'
         CALL PRINT_ERROR( msgBuf, myThid )
         errCount = errCount + 1
      ENDIF

C     So far, SHELFICE works only with oceanic z-coordinates
      IF ( buoyancyRelation .NE. 'OCEANIC' ) THEN
         WRITE(msgBuf,'(A)')
     &      'SHELFICE works only with buoyancyRelation = ''OCEANIC'''
         CALL PRINT_ERROR( msgBuf, myThid )
         errCount = errCount + 1
      ENDIF

      IF ( selectNHfreeSurf.NE.0 ) THEN
C--   Non-Hydrostatic Free-Surf below Ice-Shelf:
C     a) there is a practical implementation issue (kSurf > 1) that has to be
C        fixed before removing this stop.
C     b) In general, should also account for the vertical acceleration of the
C        Ice-shelf mass above Free-Surf in NH.Free-Surf equation (less obvious).
C        Ignore this term for now; as a consequence, might over-estimate
C        d.Eta/dt below Ice-Shelf.
         WRITE(msgBuf,'(2A,I3,A)') 'Current nonHydrostatic',
     &    ' Free-Surf option (selectNHfreeSurf=',selectNHfreeSurf,' )'
         CALL PRINT_ERROR( msgBuf, myThid )
         WRITE(msgBuf,'(A)') ' not compatible with SHELFICE code'
         CALL PRINT_ERROR( msgBuf, myThid )
         errCount = errCount + 1
      ENDIF

C     SHELFICE may not work with many other packages,
C     e.g. vertical mixing schemes, in particular KPP will not work properly,
C     as KPP requires surface fluxes at the surface, whereas shelfice will
C     provide interfacial fluxes at some depth. Richardson flux number based
C     schemes such as Packanowski-Philander (PP81) should be no problem.
CML#ifdef ALLOW_KPP
CML      IF ( useKPP ) THEN
CML         WRITE(msgBuf,'(A)')
CML     &      'SHELFICE and KPP cannot be turned on at the same time'
CML         CALL PRINT_ERROR( msgBuf , 1)
CML         errCount = errCount + 1
CML      ENDIF
CML#endif ALLOW_KPP

#ifndef ALLOW_ISOMIP_TD
      IF ( useISOMIPTD ) THEN
       WRITE(msgBuf,'(A,A,A)')
     &      'Run-time control flag useISOMIPTD was used'
       CALL PRINT_ERROR( msgBuf, myThid )
       WRITE(msgBuf,'(A,A,A)')
     &      'when CPP flag ALLOW_ISOMIP_TD was unset'
       CALL PRINT_ERROR( msgBuf, myThid )
       errCount = errCount + 1
      ENDIF
#else
      IF ( useISOMIPTD ) THEN
       IF ( SHELFICEconserve ) THEN
        WRITE(msgBuf,'(A,A,A)')
     &       'Run-time control flag SHELFICEconserve=.TRUE. was used'
        CALL PRINT_ERROR( msgBuf, myThid )
        WRITE(msgBuf,'(A,A,A)')
     &       'when useISOMIPTD=.TRUE.; this does not work!'
        CALL PRINT_ERROR( msgBuf, myThid )
        errCount = errCount + 1
       ENDIF
      ENDIF
#endif /* ALLOW_ISOMIP_TD */

#ifndef SHI_ALLOW_GAMMAFRICT
      IF ( SHELFICEuseGammaFrict ) THEN
       WRITE(msgBuf,'(A,A,A)')
     &      'Run-time control flag SHELFICEuseGammaFrict was used'
       CALL PRINT_ERROR( msgBuf, myThid )
       WRITE(msgBuf,'(A,A,A)')
     &      'when CPP flag SHI_ALLOW_GAMMAFRICT was unset'
       CALL PRINT_ERROR( msgBuf, myThid )
       errCount = errCount + 1
      ENDIF
#endif /* SHI_ALLOW_GAMMAFRICT */

      IF ( errCount.GE.1 ) THEN
        WRITE(msgBuf,'(A,I3,A)')
     &       'SHELFICE_CHECK: detected', errCount,' fatal error(s)'
        CALL PRINT_ERROR( msgBuf, myThid )
        CALL ALL_PROC_DIE( 0 )
        STOP 'ABNORMAL END: S/R SHELFICE_CHECK'
      ENDIF

      _END_MASTER(myThid)

#endif /* ALLOW_SHELFICE */

      RETURN
      END
