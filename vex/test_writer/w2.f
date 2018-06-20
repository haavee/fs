      program w2
      integer ptr_ch
      call fcreate_version(ptr_ch('2.0'//char(0)))
      call fcreate_comment(ptr_ch(char(0)),ptr_ch('* comment'//char(0)))

C  2. $GLOBAL

      call fcreate_block(ptr_ch('GLOBAL'//char(0)))
      call fcreate_ref(ptr_ch('EXPER'//char(0)),
     &     ptr_ch('DBETST'//char(0))) 
      call fcreate_ref(ptr_ch('SCHEDULING_PARAMS'//char(0)),
     &     ptr_ch('SKED_PARAMS'//char(0))) 

      call fcreate_block(ptr_ch('EXPER'//char(0)))     
      call fcreate_comment(ptr_ch(char(0)),
     &     ptr_ch('* comment 2'//char(0)))
c
      call fcreate_block(ptr_ch('SCHED'//char(0)))     
c
      call fcreate_scan(ptr_ch('No001'//char(0)))
      call fcreate_start(ptr_ch('2005y039d16h47m53s'//char(0)))
      call fcreate_station(ptr_ch('Wf'//char(0)),
     &     ptr_ch('0'//char(0)),
     &     ptr_ch('sec'//char(0)),
     &     ptr_ch('40'//char(0)),
     &     ptr_ch('sec'//char(0)),
     &     ptr_ch('10877'//char(0)),
     &     ptr_ch('ft'//char(0)),
     &     ptr_ch('3A'//char(0)),
     &     ptr_ch('n'//char(0)))
      call fcreate_station_drive_list(ptr_ch('1'//char(0)))
      call fcreate_station_drive_list(ptr_ch(char(0)))
      call fend_scan
      call fcreate_comment(ptr_ch('t'//char(0)),
     &     ptr_ch('* comment 3'//char(0)))
c
      call fcreate_scan(ptr_ch('No002'//char(0)))
      call fcreate_start(ptr_ch('2006y039d16h47m53s'//char(0)))
      call fcreate_station(ptr_ch('Wz'//char(0)),
     &     ptr_ch('0'//char(0)),
     &     ptr_ch('sec'//char(0)),
     &     ptr_ch('40'//char(0)),
     &     ptr_ch('sec'//char(0)),
     &     ptr_ch('10877'//char(0)),
     &     ptr_ch('ft'//char(0)),
     &     ptr_ch('3A'//char(0)),
     &     ptr_ch('n'//char(0)))
      call fcreate_station_drive_list(ptr_ch('1'//char(0)))
      call fcreate_station_drive_list(ptr_ch(char(0)))
      call fend_scan
      call fcreate_comment(ptr_ch(char(0)),
     &     ptr_ch('* comment 4'//char(0)))
c
      call fcreate_block(ptr_ch('STATION'//char(0)))     

      call fcreate_block(ptr_ch('ANTENNA'//char(0)))
      call fcreate_def(ptr_ch('Hb'//char(0)))
      call fcreate_axis_type(ptr_ch('az'//char(0)),
     &                       ptr_ch('el'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_axis_type(ptr_ch('az'//char(0)),
     &                       ptr_ch('el'//char(0)),
     &                       ptr_ch('1'//char(0)),
     &                       ptr_ch('deg'//char(0)))
      call fcreate_axis_type(ptr_ch('az'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_pointing_sector2(ptr_ch('ccw'//char(0)),
     &                       ptr_ch('ccwl'//char(0)),
     &                       ptr_ch('az'//char(0)),
     &                       ptr_ch('-90'//char(0)),
     &                       ptr_ch('deg'//char(0)),
     &                       ptr_ch('90'//char(0)),
     &                       ptr_ch('deg'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_pointing_sector2(ptr_ch('cw'//char(0)),
     &                       ptr_ch('cwl'//char(0)),
     &                       ptr_ch('az'//char(0)),
     &                       ptr_ch('270'//char(0)),
     &                       ptr_ch('deg'//char(0)),
     &                       ptr_ch('450'//char(0)),
     &                       ptr_ch('deg'//char(0)),
     &                       ptr_ch('el'//char(0)),
     &                       ptr_ch('0'//char(0)),
     &                       ptr_ch('deg'//char(0)),
     &                       ptr_ch('88'//char(0)),
     &                       ptr_ch('deg'//char(0)))
      call fcreate_nasmyth(ptr_ch('X'//char(0)),
     &                       ptr_ch('left'//char(0)))
      
      call fend_def
      call fcreate_block(ptr_ch('BITSTREAMS'//char(0)))
      call fcreate_def(ptr_ch('Hb'//char(0)))
      call fcreate_stream_def(ptr_ch('CH01'//char(0)),
     &                       ptr_ch('sign'//char(0)),
     &                       ptr_ch('1'//char(0)),
     &                       ptr_ch('33'//char(0)),
     &                       ptr_ch('bitstream1'//char(0))
     &     )
      call fcreate_stream_def(ptr_ch('CH01'//char(0)),
     &                       ptr_ch('mag'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch('34'//char(0)),
     &                       ptr_ch(char(0))
     &     )
      call fcreate_stream_def(ptr_ch('CH01'//char(0)),
     &                       ptr_ch('mag'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch('35'//char(0)),
     &                       ptr_ch('bitstream1'//char(0))
     &     )
      call fcreate_stream_sample_rate(ptr_ch('8'//char(0)),
     &                       ptr_ch('Ms/sec'//char(0)),
     &                       ptr_ch('bitstream1'//char(0))
     &     )
      call fcreate_stream_label(ptr_ch('stream1'//char(0)),
     &                       ptr_ch('bitstream1'//char(0))
     &     )
      call fend_def
      call fcreate_block(ptr_ch('CLOCK'//char(0)))
      call fcreate_def(ptr_ch('Hb'//char(0)))
c
c    clock_early = 1995y263d06h00m : 2.5 usec : 1995y132d00h08m0s : 1.2e-12 sec/sec : 10 sec/sec^2 : 11 sec/sec^3 : 12 usec;
c
      call fcreate_clock_early(ptr_ch('1995y263d06h00m'//char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch('sec/sec'//char(0)),
     &     ptr_ch('10'//char(0)),
     &     ptr_ch('sec/sec^2'//char(0)),
     &     ptr_ch('11'//char(0)),
     &     ptr_ch('sec/sec^3'//char(0)),
     &     ptr_ch('12'//char(0)),
     &     ptr_ch('usec'//char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch('sec/sec'//char(0)),
     &     ptr_ch('10'//char(0)),
     &     ptr_ch('sec/sec^2'//char(0)),
     &     ptr_ch('11'//char(0)),
     &     ptr_ch('sec/sec^3'//char(0)),
     &     ptr_ch('12'//char(0)),
     &     ptr_ch('usec'//char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch('10'//char(0)),
     &     ptr_ch('sec/sec^2'//char(0)),
     &     ptr_ch('11'//char(0)),
     &     ptr_ch('sec/sec^3'//char(0)),
     &     ptr_ch('12'//char(0)),
     &     ptr_ch('usec'//char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch('10'//char(0)),
     &     ptr_ch('sec/sec^2'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch('12'//char(0)),
     &     ptr_ch('usec'//char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch('12'//char(0)),
     &     ptr_ch('usec'//char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch('12'//char(0)),
     &     ptr_ch('usec'//char(0))
     &     )
      call fcreate_clock_early(ptr_ch('1995y263d06h00m'//char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch('10'//char(0)),
     &     ptr_ch('sec/sec^2'//char(0)),
     &     ptr_ch('11'//char(0)),
     &     ptr_ch('sec/sec^3'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch('10'//char(0)),
     &     ptr_ch('sec/sec^2'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0))
     &     )
      call fcreate_clock_early(ptr_ch(char(0)),
     &     ptr_ch('2.5'//char(0)),
     &     ptr_ch('usec'//char(0)),
     &     ptr_ch('1995y132d00h08m0s'//char(0)),
     &     ptr_ch('1.2e-12'//char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0)),
     &     ptr_ch(char(0))
     &     )
      call fend_def
c
      call fcreate_block(ptr_ch('DAS'//char(0)))
      call fcreate_def(ptr_ch('VEX2'//char(0)))
      call fcreate_equip(ptr_ch('rack'//char(0)),
     &     ptr_ch('RDBE'//char(0)),
     &     ptr_ch('RDBEA'//char(0)),
     &     ptr_ch('A'//char(0)))
      call fcreate_equip(ptr_ch('rack'//char(0)),
     &     ptr_ch('RDBE'//char(0)),
     &     ptr_ch('RDBEB'//char(0)),
     &     ptr_ch(char(0)))
      call fcreate_lvalue_list(ptr_ch('RBEA1'//char(0)))
      call fcreate_lvalue_list(ptr_ch('RBEA2'//char(0)))
      call fcreate_lvalue_list(ptr_ch('RBEA3'//char(0)))
      call fcreate_composite_equip(ptr_ch('RBEA'//char(0)))

      call fcreate_svalue_list(ptr_ch('on'//char(0)))
      call fcreate_equip_set(ptr_ch('RBEA'//char(0)),
     &                       ptr_ch('AGC'//char(0)))
      call fcreate_svalue_list(ptr_ch('on'//char(0)))
      call fcreate_svalue_list(ptr_ch('on1'//char(0)))
      call fcreate_equip_set(ptr_ch('RBEA'//char(0)),
     &                       ptr_ch('AGC'//char(0)))
      call fcreate_svalue_list(ptr_ch('G'//char(0)))
      call fcreate_equip_info(ptr_ch('RBEA'//char(0)),
     &                       ptr_ch('model'//char(0)))
c
      call fcreate_connection(ptr_ch('vdif'//char(0)),
     &                       ptr_ch('rdbea'//char(0)),
     &                       ptr_ch('out1'//char(0)),
     &                       ptr_ch('out'//char(0)),
     &                       ptr_ch('ETH'//char(0)))
      call fcreate_connection(ptr_ch('vdif'//char(0)),
     &                       ptr_ch('rdbea'//char(0)),
     &                       ptr_ch('out1'//char(0)),
     &                       ptr_ch('out'//char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_connection(ptr_ch('vdif'//char(0)),
     &                       ptr_ch('rdbea'//char(0)),
     &                       ptr_ch('out1'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_connection(ptr_ch('vdif'//char(0)),
     &                       ptr_ch('rdbea'//char(0)),
     &                       ptr_ch('out1'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch('ETH'//char(0)))
      call fcreate_record_method(ptr_ch('start_stop'//char(0)),
     &                       ptr_ch('10'//char(0)),
     &                       ptr_ch('seconds'//char(0)),
     &                       ptr_ch('20'//char(0)),
     &                       ptr_ch('minutes'//char(0)))
      call fcreate_record_method(ptr_ch('continuous'//char(0)),
     &                       ptr_ch('11'//char(0)),
     &                       ptr_ch('hours'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_record_method(ptr_ch('adaptive'//char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch(char(0)),
     &                       ptr_ch('21'//char(0)),
     &                       ptr_ch('days'//char(0)))
      call fcreate_record_control(ptr_ch('master'//char(0)))
      call fend_def
C
      call fcreate_block(ptr_ch('EOP'//char(0)))
      call fcreate_def(ptr_ch('VEX2'//char(0)))
      call fcreate_eop_origin(ptr_ch('RAPID'//char(0)),
     &                       ptr_ch('2001y012d'//char(0)))
      call fcreate_eop_origin(ptr_ch('FINAL'//char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_dvalue_list(ptr_ch('330'//char(0)),
     &     ptr_ch('masec'//char(0)) )
      call fcreate_dvalue_list(ptr_ch('0.330'//char(0)),
     &     ptr_ch('asec'//char(0)) )
      call fcreate_dvalue_list(ptr_ch('0.331'//char(0)),
     &     ptr_ch(char(0)) )
      call fcreate_delta_x_nut

      call fcreate_dvalue_list(ptr_ch('430'//char(0)),
     &     ptr_ch('masec'//char(0)) )
      call fcreate_dvalue_list(ptr_ch('0.430'//char(0)),
     &     ptr_ch('asec'//char(0)) )
      call fcreate_dvalue_list(ptr_ch('0.331'//char(0)),
     &     ptr_ch(char(0)) )
      call fcreate_delta_y_nut

      call fcreate_nut_origin(ptr_ch('GSFC'//char(0)),
     &                       ptr_ch('2011y012d'//char(0)))
      call fcreate_nut_origin(ptr_ch('BKG'//char(0)),
     &                       ptr_ch(char(0)))
      call fcreate_nut_model(ptr_ch('IAU2000A'//char(0)))
      call fend_def
c
      call fcreate_vex(ptr_ch(char(0)))
c
      END

