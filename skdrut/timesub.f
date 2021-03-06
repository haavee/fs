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
	SUBROUTINE TimeSub(iTimeStart,idur,iTimeEnd)
! passed
      implicit none  !2020Jun15 JMGipson automatically inserted.
      integer itimeStart(5),itimeEnd(5)
      integer idur
      integer iday0
! local
        integer i
C
C     TMSUB subtracts a time, in seconds, from the input
C     and returns the difference
C
C  INPUT:
C
C     IYR - Year of start time
C     IDAYR - day of the year for start time
C     IHR, MIN, ISC - start time
C     DUR - duration, seconds
C
C
C  OUTPUT:
C
C     IYR2 - Year of stop time
C     IDAYR2 - day of stop
C     IHR2, MIN2, ISC2 - stop time
C
      logical LEAP
C
C  MODIFICATIONS
C  880411 NRV DE-COMPC'D

C
C     1. Simply subtract the duration from the minutes.  If adjustments
C     in the minutes, hours or days need to be done, do so.
C
      do i=1,5
        ItimeEnd(i)=iTimeStart(i)
      end do
      iTimeEnd(5)=ItimeEnd(5)-idur

C
      DO WHILE (itimeEnd(5).LT.0)
          itimeEnd(5) = itimeEnd(5) + 60
          itimeEnd(4) = itimeEnd(4) - 1
      END DO
C
      DO WHILE (itimeEnd(4).LT.0)
          itimeEnd(4) = itimeEnd(4) + 60
          itimeEnd(3) = itimeEnd(3) - 1
      END DO
C
      DO WHILE (itimeEnd(3).LT.0)
          itimeEnd(3) = itimeEnd(3) + 24
          itimeEnd(2) = itimeEnd(2) - 1
      END DO
C
      DO WHILE (itimeEnd(2).LT.1)
          itimeEnd(2) = itimeEnd(2)+365
          itimeEnd(1) =itimeEnd(1) - 1
          leap = IDAY0(itimeEnd(1),0).eq. 366
          IF (LEAP)  itimeEnd(2) =itimeEnd(2) + 1
      END DO
C
990   RETURN
      END
