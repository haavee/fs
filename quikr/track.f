*
* Copyright (c) 2020 NVI, Inc.
*
* This file is part of VLBI Field System
* (see http://github.com/nvi-inc/fs).
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
      subroutine track(ip)
C  display tracking status
C
C     Display on-source information
C
C   MODIFIED 850204 TO HANDLE ERROR RETURN FROM ANTCN
C
      include '../include/fscom.i'
C
      dimension ip(1)
      dimension ireg(2),iparm(2)
      integer get_buf
      integer*2 ibuf(20)
C
      equivalence (ireg(1),reg),(iparm(1),parm)
C
      data ilen/40/
C
      iclcm = ip(1)
      ireg(2) = get_buf(iclcm,ibuf,-ilen,idum,idum)
      nchar = ireg(2)
      ieq = iscn_ch(ibuf,1,nchar,'=')
      if (ieq.eq.0) goto 200
      ierr = -99
      goto 990
C
C
C     2. The command is: ONSOURCE
C     The response may be either TRACKING or SLEWING,
C     depending on the variable IONSOR=1 or 0.
C     Schedule ANTCN to get the az,el errors and set IONSOR.
C
200   continue
      call fs_get_idevant(idevant)
      if (ichcm_ch(idevant,1,'/dev/null ').ne.0) then
        call run_prog('antcn','wait',7,idum,idum,idum,idum)
        call rmpar(ip)
        ierr = ip(3)
        return
      else
        ierr = -302
      endif

990   ip(1) = 0
      ip(2) = 0
      ip(3) = ierr
      call char2hol('qo',ip(4),1,2)
      end 
