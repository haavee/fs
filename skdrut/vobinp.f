      SUBROUTINE VOBINP(ivexnum,LU,IERR)

C  This routine gets all the observations from the vex file.
C  Call after vmoinp, vstinp, and vsoinp.
C
C History
C 960527 nrv New.

      include '../skdrincl/skparm.ftni'
      include '../skdrincl/freqs.ftni'
      include '../skdrincl/statn.ftni'
      include '../skdrincl/skobs.ftni'
C
C  INPUT:
      integer ivexnum,lu
C
C  OUTPUT:
      integer iret ! error from vex routines
      integer ierr ! error from this routine

C  CALLED BY: 
C  CALLS:  fget_scan_station         (get station lines)
C          fvex_scan_source          (get sources in a scan)
c          newscan                   (form new scan)
C          addscan                   (add a station to a scan)
C          findscan                  (find a matching scan)
C
C  LOCAL:
      integer isor,icod,istn,il,ip,idur,ifeet
      integer idum,irec,ipnt,nxtrec
      integer*2 itim1(6),itim2(6)
      integer*2 lcb
      character*128 cmo,cstart,csor,cout,cunit
      integer istart(5)
      double precision d,start_sec,dst,det
      logical kearl
      integer ichmv,ichmv_ch,ivgtso,ivgtmo
      integer fget_scan_station,fvex_scan_source,fvex_date,
     .fvex_field,fvex_double,fvex_units,ptr_ch,fvex_len

C 1. Get scans for one station at a time.

      nobs = 0
      nxtrec = 1
      do istn=1,nstatn ! each station
        write(lu,9100) lpocod(istn)
9100    format('VOBINP - Generating observations for ',a2)
        iret = fget_scan_station(ptr_ch(cstart),len(cstart),
     .         ptr_ch(cmo),len(cmo),
     .         ptr_ch(stndefnames(istn)),ivexnum)
        ierr = 1 ! station
        do while (iret.eq.0) ! get all scans for this station
          iret = fvex_date(ptr_ch(cstart),istart,start_sec)
          ierr=2 ! date/time
          if (iret.ne.0) return
          istart(5) = start_sec ! convert to integer
          ierr = 3 ! first source name
          iret = fvex_scan_source(1,ptr_ch(csor),len(csor))
          if (iret.ne.0) return
          ierr = 4 ! source index
          if (ivgtso(csor,isor).le.0) then
            il=fvex_len(csor)
            write(lu,'("VOBINP01 - Source ",a," not found")') csor(1:il)
          endif
          ierr = 5 ! code index
            il=fvex_len(cmo)
          if (ivgtmo(cmo,icod).le.0) then
            write(lu,'("VOBINP02 - Mode ",a," not found")') cmo(1:il)
          endif
          ierr = 6 ! data start
          iret = fvex_field(2,ptr_ch(cout),len(cout))
          if (iret.ne.0) return
          iret = fvex_units(ptr_ch(cunit),len(cunit))
          iret = fvex_double(ptr_ch(cout),ptr_ch(cunit),d)
          if (iret.ne.0) return
          dst = d
          ierr = 7 ! data end
          iret = fvex_field(3,ptr_ch(cout),len(cout))
          if (iret.ne.0) return
          iret = fvex_units(ptr_ch(cunit),len(cunit))
          iret = fvex_double(ptr_ch(cout),ptr_ch(cunit),d)
          if (iret.ne.0) return
          det = d
          idur = det-dst
          ierr = 8 ! footage
          iret = fvex_field(4,ptr_ch(cout),len(cout))
          if (iret.ne.0) return
          iret = fvex_units(ptr_ch(cunit),len(cunit))
          iret = fvex_double(ptr_ch(cout),ptr_ch(cunit),d)
          if (iret.ne.0) return
          ifeet = d*100.d0/(2.54*12.d0) ! convert mks to feet
          ierr = 9 ! pass
          iret = fvex_field(5,ptr_ch(cout),len(cout))
          if (iret.ne.0) return
          il = fvex_len(cout)
          ip=1
          do while (ip.le.npassl.and.cout(1:il).ne.
     .              cpassorderl(ip,istn)(1:il))
            ip=ip+1
          enddo
          if (ip.gt.npassl) return ! pass not found
          ierr = 10 ! pointing sector
          iret = fvex_field(6,ptr_ch(cout),len(cout))
          if (iret.ne.0) return
          il = fvex_len(cout)
          if (il.eq.0) then ! null wrap
            idum=ichmv_ch(lcb,1,'- ')
          else ! check it
            if (cout(1:il).eq.'&n') idum=ichmv_ch(lcb,1,'- ')
            if (cout(1:il).eq.'&cw') idum=ichmv_ch(lcb,1,'C ')
            if (cout(1:il).eq.'&ccw') idum=ichmv_ch(lcb,1,'W ')
          endif

C 2. Form the observation record for the first station.

          if (istn.eq.1) then ! form new scan
            call newscan(istn,isor,icod,istart,
     .      idur,ifeet,ip,lcb,ierr)
C      write(lu,9100) istn,istart,isor
C9100  format('newscan  istn=',i3,' istart=',5i5,' isor=',i3)

C 3. For subsequent stations, try to find a matching time, source
C    and mode. If there is one, add this station to the observation.
C    If there is not one, make a new observation.
     
          else ! check for existing
            call findscan(isor,icod,istart,irec)
            if (irec.ne.0) then ! add this station
              call addscan(irec,istn,idur,ifeet,ip,lcb,ierr)
              if (ierr.ne.0) then
                write(lu,9103) ierr,irec,istn,istart
9103            format('addscan error ',i3,' irec=',i3,' istn=',i3,
     .          'istart=',5i5)
              endif
C      write(lu,9101) istn,istart,isor
C9101  format('addscan  istn=',i3,' istart=',5i5,' isor=',i3)
            else ! new scan
              call newscan(istn,isor,icod,istart,
     .        idur,ifeet,ip,lcb,ierr)
C      write(lu,9100) istn,istart,isor
            endif
          endif ! form/check

C 4. Get the next record.

          iret = fget_scan_station(ptr_ch(cstart),len(cstart),
     .           ptr_ch(cmo),len(cmo),
     .           ptr_ch(stndefnames(istn)),0)
        enddo ! get all obs for this station
      enddo ! each station
      if (ierr.gt.0) ierr=0

C  5. This next section orders the index array, iskrec, in time order.
C
      irec=nobs
      idum= ichmv(itim1,1,lskobs(1,iskrec(irec)),24,11)
      idum= ichmv(itim2,1,lskobs(1,iskrec(irec-1)),24,11)
      do while (kearl(itim1,itim2).and.irec.gt.1)  !out of order
C       Swap pointers
        ipnt = iskrec(irec+1)
        iskrec(irec+1) = iskrec(irec)
        iskrec(irec) = ipnt
C       Get new time fields
        idum= ichmv(itim1,1,lskobs(1,iskrec(irec)),24,11)
        irec = irec-1
        idum= ichmv(itim2,1,lskobs(1,iskrec(irec-1)),24,11)
      end do  !out of order

      return
      end
