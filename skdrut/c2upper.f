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
      subroutine c2upper(cbuf_in,cbuf_out)
      implicit none

C Convert a character string to upper case.
C The number of characters converted is the shorter
C of the two string lengths.

C 960201 nrv New.
C 040623  ZMM  changed min1 function to min
C              removed trailing RETURN


      character*(*) cbuf_in
      character*(*) cbuf_out

C Local
      integer iin,iout
      character*1 c
      integer i

      iin=len(cbuf_in)
      iout=len(cbuf_out)
      do i=1,min(iin,iout)
        c=cbuf_in(i:i)
        if ((c.ge.'a').and.(c.le.'z')) then
           cbuf_out(i:i) = char(ichar(c) - (ichar('a') - ichar('A')))
        else
           cbuf_out(i:i) = c
        end if
      enddo
C     if (iiout.gt.iin) then
C       do i=iin+1,iiout
C         cbuf_out(i:i)=' '
C       enddo
C     endif

      end
