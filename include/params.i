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
c params.i
c compile time parameters
c
      integer INT_BITS      ! bits/int
      integer INT_CHARS     ! chars/int
      integer INT2_CHARS    ! chars/int2
      integer INT_ALIGN     ! number of ints for maximum aligned unit
      integer MAXNRX_FS     ! maximum number of values in rxdiode.ctl
      integer MK3           ! Mark III comparison bit variable
      integer VLBA          ! VLBA comparison bit variable
      integer MK4           ! Mark IV comparison bit variable
      integer S2            ! S2 comparison bit variable
      integer K4            ! K4 comparison bit variable
      integer K4MK4         ! K4MK4 comparison bit variable
      integer K4K3          ! K4K3 comparison bit variable
      integer VLBA4         ! VLBA4 comparison bit variable
      integer VLBAG         ! VLBA geodesy rack
      integer VLBA2         ! VLBA drive type 2
      integer VLBAB         ! VLBA drive type B
      integer MK4B          ! Mark IV 1 head
      integer K41           ! K41 comparison bit variable
      integer K41U          ! K41U comparison bit variable
      integer K42           ! K42 comparison bit variable
      integer K42A          ! K42A comparison bit variable
      integer K42B          ! K42B comparison bit variable
      integer K42BU         ! K42BU comparison bit variable
      integer K42C          ! K42C comparison bit variable
      integer K41DMS        ! K41DMS comparison bit variable
      integer K42DMS        ! K42DMS comparison bit variable
      integer VLBA42        ! VLBA42 comparison bit variable
      integer LBA           ! LBA comparison bit variable
      integer LBA4          ! LBA4 comparison bit variable
      integer MK5           ! MK5 comparison bit variable
      integer DBBC          ! DBBC comparison bit variable
      integer MK5A          ! MK5A comparison bit variable
      integer MK5A_BS       ! MK5A_BS comparison bit variable
      integer MK45          ! MK45 comparison bit variable
      integer VLBA45        ! VLBA45 comparison bit variable
      integer DBBC_DDC      ! FILA10G_DDC comparison bit variable
      integer DBBC_DDC_FILA10G       ! FILA10G_DDC_FILA10G comparison bit variable
      integer DBBC_PFB      ! FILA10G_PFB comparison bit variable
      integer DBBC_PFB_FILA10G       ! FILA10G_PFB_FILA10G comparison bit variable
      integer VLBA4C        ! VLBA4C comparison bit variable
      integer VLBA4CDAS     ! VLBA4CDAS comparison bit variable
      integer MK5B          ! MK5B comparison bit variable
      integer MK5B_BS       ! MK5B_BS comparison bit variable
      integer MK5C          ! MK5C comparison bit variable
      integer MK5C_BS       ! MK5C_BS comparison bit variable
      integer FLEXBUFF      ! FLEXBUFF comparison bit variable
      integer MAX_DAS       ! Max number of LBA DAS allowed
      integer RDBE          ! RDBE comparison bit variable
      integer MK6           ! MK6 comparison bit variable
      integer DBBC3         ! DBBC3 comparison bit variable
      character*5 FS_ROOT
      integer MAX_BBC
      integer MAX_VLBA_BBC
      integer MAX_VLBA_DIST
      integer MAX_IF
      integer MAX_VLBA_IF
      integer MAX_DET
      integer MAX_DBBC_BBC
      integer MAX_DBBC_IF
      integer MAX_DBBC_DET
      integer MAX_DBBC_PFB
      integer MAX_DBBC_PFB_DET
      integer MAX_MK6
      integer MAX_RDBE_IF
      integer MAX_RDBE_CH
      integer MAX_RDBE
      integer MAX_DBBC3_BBC
      integer MAX_DBBC3_IF
      integer MAX_DBBC3_DET
      integer MAX_GLOBAL_DET
      integer CH_PRIOR      ! chekr        realtime priority
      integer CL_PRIOR      ! clock func.  realtime priority
      integer FS_PRIOR      ! Field System realtime priority
      integer AN_PRIOR      ! Antenna      realtime priority
      integer MAX_RXCODES   ! Max number of entries in rxdef.ctl
      integer MAX_HOR      ! Max number of horizon mask entries
      integer MAX_MODEL_PARAM ! maximum pointing model parameters
c
      integer MAX_PROC_PARAM_CHARS ! maximum chars in a proc parameter
      integer MAX_PROC_PARAM_WORDS ! max int words needed for a proc parameter
      integer MAX_PROC_PARAM_COUNT ! max count of stack spack for proc params
c
      integer MAX_PROC1, MAX_PROC2
      PARAMETER (MAX_PROC1=256, MAX_PROC2=1500)
C
C these parameter are not used extensively, but it is start
      integer MAX_CLS_MSG_BYTES, MAX_CLS_MSG_I2
      parameter (MAX_CLS_MSG_BYTES=1024)
      parameter (MAX_CLS_MSG_I2=(MAX_CLS_MSG_BYTES+1)/2)
c
      parameter ( INT_BITS = 32 )
      parameter ( INT_CHARS=  4 )
      parameter ( INT2_CHARS= 2 )
      parameter ( INT_ALIGN=  2 )
      parameter ( MAXNRX_FS= 30 )
C rack/drive
      parameter ( MK3 = z'001'   )
      parameter ( VLBA = z'002'  )
      parameter ( MK4 = z'004'   )
      parameter ( S2  = z'008'   )
      parameter ( VLBA4 = z'010' )
      parameter ( K4 = z'020' )
      parameter ( K4MK4 = z'040' )
      parameter ( K4K3 = z'080' )
      parameter ( LBA = z'100'   )
      parameter ( LBA4 = z'200'   )
      parameter ( MK5 = z'400'   )
      parameter ( DBBC = z'800'   )
      parameter ( MK6 = z'1000'   )
      parameter ( RDBE = z'2000'   )
      parameter ( DBBC3 = z'4000'   )
C rack/drive _types
      parameter ( VLBAG    = z'1000' )
      parameter ( VLBA2    = z'2000' )
      parameter ( MK4B     = z'4000'  )
      parameter ( K41      = z'8000'  )
      parameter ( K41U     = z'10000'  )
      parameter ( K42      = z'20000'  )
      parameter ( K42A     = z'40000'  )
      parameter ( K42BU    = z'80000'  )
      parameter ( VLBAB    = z'100000' )
      parameter ( K41DMS   = z'200000' )
      parameter ( K42DMS   = z'400000' )
      parameter ( K42B     = z'800000'  )
      parameter ( K42C     = z'1000000'  )
      parameter ( VLBA42   = z'2000000'  )
      parameter ( MK5A     = z'4000000'  )
      parameter ( MK5A_BS  = z'8000000'  )
      parameter ( MK45     = z'10000000'  )
      parameter ( VLBA45   = z'20000000'  )
      parameter ( DBBC_DDC_FILA10G  = z'40000000'  )
      parameter ( DBBC_DDC = z'1'  )
      parameter ( DBBC_PFB_FILA10G  = z'2'  )
      parameter ( DBBC_PFB = z'4'  )
      parameter ( VLBA4C   = z'1' )
      parameter ( VLBA4CDAS= z'2' )
      parameter ( MK5B     = z'40000000'  )
      parameter ( MK5B_BS  = z'10000000'  )
      parameter ( MK5C     = z'1'  )
      parameter ( MK5C_BS  = z'2'  )
      parameter ( FLEXBUFF = z'4'  )
C
      parameter ( MAX_MK6 = 2 )
      parameter ( MAX_RDBE = 4 )
      parameter ( MAX_RDBE_IF = 2 )
      parameter ( MAX_RDBE_CH = 16 )
      parameter ( MAX_DAS = 2 )
      parameter ( FS_ROOT='/usr2')
C
      parameter ( MAX_BBC = 16 )
      parameter ( MAX_VLBA_BBC = 14 )
      parameter ( MAX_VLBA_DIST = 2 )
      parameter ( MAX_IF        = 4 )
      parameter ( MAX_VLBA_IF   = 2*MAX_VLBA_DIST)
      parameter ( MAX_DET = MAX_BBC*2+MAX_IF )
      parameter ( MAX_DBBC_BBC  =16)
      parameter ( MAX_DBBC_IF   = 4)
      parameter ( MAX_DBBC_DET  = 2*MAX_DBBC_BBC+MAX_DBBC_IF)
      parameter ( MAX_DBBC_PFB  =64)
      parameter ( MAX_DBBC_PFB_DET  = MAX_DBBC_PFB+MAX_DBBC_IF)
C
      parameter ( MAX_DBBC3_BBC  =128)
      parameter ( MAX_DBBC3_IF   = 8)
      parameter ( MAX_DBBC3_DET  = 2*MAX_DBBC3_BBC+MAX_DBBC3_IF)
      parameter ( MAX_GLOBAL_DET = MAX_DBBC3_DET)
C
      parameter ( CH_PRIOR=-04)
      parameter ( CL_PRIOR=-08)
      parameter ( FS_PRIOR=-12)
      parameter ( AN_PRIOR=-16)
      parameter ( MAX_RXCODES = 40)
      parameter ( MAX_HOR = 30)
C
      parameter (MAX_MODEL_PARAM = 30)
C
      parameter (MAX_PROC_PARAM_CHARS=512)
      parameter (MAX_PROC_PARAM_WORDS=MAX_PROC_PARAM_CHARS/INT2_CHARS)
      parameter (MAX_PROC_PARAM_COUNT=4*MAX_PROC_PARAM_WORDS)
