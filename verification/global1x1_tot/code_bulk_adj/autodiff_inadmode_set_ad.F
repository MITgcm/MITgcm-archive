C $Header: /u/gcmpack/MITgcm/verification/global1x1_tot/code_bulk_adj/Attic/autodiff_inadmode_set_ad.F,v 1.1.2.1 2005/06/04 05:36:06 heimbach Exp $

#include "AUTODIFF_OPTIONS.h"

      subroutine adautodiff_inadmode_set( myThid )
      IMPLICIT NONE
C     /==========================================================\
C     | SUBROUTINE adautodiff_inadmode_set                       |
C     |==========================================================|
C     == Global variables ===

#include "SIZE.h"
#include "EEPARAMS.h"
#include "PARAMS.h"

C     == Routine arguments ==
C     myThid - Thread number for this instance of the routine.
      integer myThid

      inAdmode = inAdTrue

      useGMREDI = .FALSE.
      useKPP    = .FALSE.

      end









