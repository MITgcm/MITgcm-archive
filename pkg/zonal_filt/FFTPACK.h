C $Header: /u/gcmpack/MITgcm/pkg/zonal_filt/FFTPACK.h,v 1.3.22.1 2003/10/02 18:18:34 adcroft Exp $
C $Name:  $

#include "ZONAL_FILT_OPTIONS.h"

#ifdef ALLOW_ZONAL_FILT

C     Data structures/work-space for FFTPACK
      COMMON /FFTPACKSUPPORT/ FFTPACKWS1,FFTPACKWS2,FFTPACKWS3
C     Real*8 FFTPACKWS(2*Nx+15,nSy)
      Real*8 FFTPACKWS1(Nx,nSy)
      Real*8 FFTPACKWS2(Nx,nSy)
      integer FFTPACKWS3(15,nSy)

#endif /* ALLOW_ZONAL_FILT */
