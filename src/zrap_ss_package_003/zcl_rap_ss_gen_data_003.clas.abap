CLASS zcl_rap_ss_gen_data_003 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_ss_gen_data_003 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM zrap_vbrk.
    DELETE FROM zrap_vbrp.
    DELETE FROM zrap_vbap.
    DELETE FROM zrap_vbak_ss.
    DELETE FROM zrap_likp.
    DELETE FROM zrap_lips.

    DATA lt_vbrk TYPE TABLE OF zrap_vbrk.
    DATA lt_vbrp TYPE TABLE OF zrap_vbrp.
    DATA lt_vbap TYPE TABLE OF zrap_vbap.
    DATA lt_vbak TYPE TABLE OF zrap_vbak_ss.
    DATA lt_likp TYPE TABLE OF zrap_likp.
    DATA lt_lips TYPE TABLE OF zrap_lips.

*   fill internal travel table (itab)
    lt_vbrk = VALUE #(
      ( vbeln = '90000049' waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D1' fkdat = '20201221' zterm = '0001' )
      ( vbeln = '90000051' waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D3' fkdat = '20201222' zterm = '0001' )
      ( vbeln = '90000055' waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D5' fkdat = '20201223' zterm = '0001' )
      ( vbeln = '90000062' waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D3' fkdat = '20201223' zterm = '0001' )
      ( vbeln = '90000078' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T3' fkdat = '20210106' zterm = 'Z000' )
      ( vbeln = '90000079' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210106' zterm = 'Z000' )
      ( vbeln = '90000089' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210111' zterm = 'Z000' )
      ( vbeln = '90000092' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T3' fkdat = '20210112' zterm = 'Z000' )
      ( vbeln = '90000186' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210228' zterm = 'Z000' )
      ( vbeln = '90000187' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210331' zterm = 'Z000' )
      ( vbeln = '90000188' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210430' zterm = 'Z000' )
      ( vbeln = '90000189' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210228' zterm = 'Z000' )
      ( vbeln = '90000190' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210331' zterm = 'Z000' )
      ( vbeln = '90000191' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210430' zterm = 'Z000' )
      ( vbeln = '90000192' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210531' zterm = 'Z000' )
      ( vbeln = '90000193' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210630' zterm = 'Z000' )
      ( vbeln = '90000194' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210731' zterm = 'Z000' )
      ( vbeln = '90000195' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210228' zterm = 'Z000' )
      ( vbeln = '90000196' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210331' zterm = 'Z000' )
      ( vbeln = '90000197' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210430' zterm = 'Z000' )
      ( vbeln = '90000198' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210531' zterm = 'Z000' )
      ( vbeln = '90000199' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210630' zterm = 'Z000' )
      ( vbeln = '90000229' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210126' zterm = 'Z000' )
      ( vbeln = '90000230' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T3' fkdat = '20210126' zterm = 'Z000' )
      ( vbeln = '90000231' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' fkdat = '20210126' zterm = 'Z000' )
      ( vbeln = '90000304' waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D1' fkdat = '20210408' zterm = '0001' )
 ).

    INSERT zrap_vbrk FROM TABLE @lt_vbrk.
    COMMIT WORK.

    lt_vbrp = VALUE #(
      ( vbeln = '90000049' posnr = '10' fkimg = '4'      vrkme = 'ADT' vgbel = '60000016' vgpos = '10' )
      ( vbeln = '90000051' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000018' vgpos = '10' )
      ( vbeln = '90000055' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000022' vgpos = '10' )
      ( vbeln = '90000062' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000025' vgpos = '10' )
      ( vbeln = '90000078' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '60000030' vgpos = '10' )
      ( vbeln = '90000079' posnr = '10' fkimg = '1000'   vrkme = 'ADT' vgbel = '60000031' vgpos = '10' )
      ( vbeln = '90000089' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000034' vgpos = '10' )
      ( vbeln = '90000092' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000035' vgpos = '10' )
      ( vbeln = '90000186' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '484'      vgpos = '10' )
      ( vbeln = '90000187' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '484'      vgpos = '10' )
      ( vbeln = '90000188' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '484'      vgpos = '10' )
      ( vbeln = '90000189' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '485'      vgpos = '10' )
      ( vbeln = '90000190' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '485'      vgpos = '10' )
      ( vbeln = '90000191' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '485'      vgpos = '10' )
      ( vbeln = '90000192' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '485'      vgpos = '10' )
      ( vbeln = '90000193' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '485'      vgpos = '10' )
      ( vbeln = '90000194' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '485'      vgpos = '10' )
      ( vbeln = '90000195' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '486'      vgpos = '10' )
      ( vbeln = '90000196' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '486'      vgpos = '10' )
      ( vbeln = '90000197' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '486'      vgpos = '10' )
      ( vbeln = '90000198' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '486'      vgpos = '10' )
      ( vbeln = '90000199' posnr = '10' fkimg = '10'     vrkme = 'ADT' vgbel = '486'      vgpos = '10' )
      ( vbeln = '90000229' posnr = '10' fkimg = '100000' vrkme = 'ADT' vgbel = '60000036' vgpos = '10' )
      ( vbeln = '90000230' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000038' vgpos = '10' )
      ( vbeln = '90000231' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000039' vgpos = '10' )
      ( vbeln = '90000304' posnr = '10' fkimg = '1'      vrkme = 'ADT' vgbel = '60000061' vgpos = '10' )
    ).

    INSERT zrap_vbrp FROM TABLE @lt_vbrp.
    COMMIT WORK.

    lt_likp = VALUE #(
    ( vbeln = '80000252' ernam = 'SSZR'   erdat = '20210201' vstel = 'KSYR' vkorg = 'TK01' lfart = 'SF' )
    ( vbeln = '80000253' ernam = 'SSZR'   erdat = '20210201' vstel = 'KSYR' vkorg = 'TK01' lfart = 'SF' )
    ( vbeln = '80000254' ernam = 'SSZR'   erdat = '20210201' vstel = 'KSYR' vkorg = 'TK01' lfart = 'SF' )
    ( vbeln = '84000008' ernam = 'IBARUT' erdat = '20201221' vstel = 'BFR4' vkorg = 'BLFZ' lfart = 'BB4' )
    ( vbeln = '84000010' ernam = 'IBARUT' erdat = '20201222' vstel = 'BFR4' vkorg = 'BLFZ' lfart = 'BB4' )
    ( vbeln = '84000014' ernam = 'IBARUT' erdat = '20201222' vstel = 'BFR4' vkorg = 'BLFZ' lfart = 'BLR' )
    ( vbeln = '84000017' ernam = 'IBARUT' erdat = '20201223' vstel = 'BFR4' vkorg = 'BLFZ' lfart = 'BB4' )
    ( vbeln = '84000021' ernam = 'SSZR'   erdat = '20210106' vstel = 'HLKL' vkorg = 'TK01' lfart = 'SLR' )
    ( vbeln = '84000022' ernam = 'SSZR'   erdat = '20210106' vstel = 'KSYR' vkorg = 'TK01' lfart = 'SLR' )
    ( vbeln = '84000023' ernam = 'SSZR'   erdat = '20210111' vstel = 'KSYR' vkorg = 'TK01' lfart = 'SLR' )
    ( vbeln = '84000024' ernam = 'SSZR'   erdat = '20210112' vstel = 'HLKL' vkorg = 'TK01' lfart = 'SLR' )
    ( vbeln = '84000025' ernam = 'SSZR'   erdat = '20210126' vstel = 'KSYR' vkorg = 'TK01' lfart = 'SLR' )
    ( vbeln = '84000026' ernam = 'SSZR'   erdat = '20210126' vstel = 'HLKL' vkorg = 'TK01' lfart = 'SLR' )
    ( vbeln = '84000027' ernam = 'SSZR'   erdat = '20210126' vstel = 'KSYR' vkorg = 'TK01' lfart = 'SLR' )
    ( vbeln = '84000032' ernam = 'EMALIK' erdat = '20210408' vstel = 'BFR4' vkorg = 'BLFZ' lfart = 'BB4' )
    ).

    INSERT zrap_likp FROM TABLE @lt_likp.
    COMMIT WORK.

    lt_lips = VALUE #(
    ( vbeln = '80000252' posnr = '10' ernam = 'SSZR'   erdat = '20210201' matnr = '663' vgbel = '484' vgpos = '10' )
    ( vbeln = '80000253' posnr = '10' ernam = 'SSZR'   erdat = '20210201' matnr = '663' vgbel = '486' vgpos = '10' )
    ( vbeln = '80000254' posnr = '10' ernam = 'SSZR'   erdat = '20210201' matnr = '663' vgbel = '485' vgpos = '10' )
    ( vbeln = '84000008' posnr = '10' ernam = 'IBARUT' erdat = '20201221' matnr = 'VEKCAY4' vgbel = '60000016' vgpos = '10' )
    ( vbeln = '84000010' posnr = '10' ernam = 'IBARUT' erdat = '20201222' matnr = 'VEKCAY4' vgbel = '60000018' vgpos = '10' )
    ( vbeln = '84000014' posnr = '10' ernam = 'IBARUT' erdat = '20201222' matnr = 'VEKCAY2' vgbel = '60000022' vgpos = '10' )
    ( vbeln = '84000017' posnr = '10' ernam = 'IBARUT' erdat = '20201223' matnr = 'VEKCAY3' vgbel = '60000025' vgpos = '10' )
    ( vbeln = '84000021' posnr = '10' ernam = 'SSZR'   erdat = '20210106' matnr = '663' vgbel = '60000030' vgpos = '10' )
    ( vbeln = '84000022' posnr = '10' ernam = 'SSZR'   erdat = '20210106' matnr = '663' vgbel = '60000031' vgpos = '10' )
    ( vbeln = '84000023' posnr = '10' ernam = 'SSZR'   erdat = '20210111' matnr = '663' vgbel = '60000034' vgpos = '10' )
    ( vbeln = '84000024' posnr = '10' ernam = 'SSZR'   erdat = '20210112' matnr = '663' vgbel = '60000035' vgpos = '10' )
    ( vbeln = '84000025' posnr = '10' ernam = 'SSZR'   erdat = '20210126' matnr = '663' vgbel = '60000036' vgpos = '10' )
    ( vbeln = '84000026' posnr = '10' ernam = 'SSZR'   erdat = '20210126' matnr = '663' vgbel = '60000038' vgpos = '10' )
    ( vbeln = '84000027' posnr = '10' ernam = 'SSZR'   erdat = '20210126' matnr = '663' vgbel = '60000039' vgpos = '10' )
    ( vbeln = '84000032' posnr = '10' ernam = 'EMALIK' erdat = '20210408' matnr = 'VEKCAY2' vgbel = '60000061' vgpos = '10' )
     ).

    INSERT zrap_lips FROM TABLE @lt_lips.
    COMMIT WORK.

    lt_vbak = VALUE #(
    ( vbeln = '484'      ernam = 'SSZR'   erdat = '20210201' auart = 'ZSTA' netwr = '2295'     waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' )
    ( vbeln = '486'      ernam = 'SSZR'   erdat = '20210201' auart = 'ZSTA' netwr = '4590'     waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' )
    ( vbeln = '485'      ernam = 'SSZR'   erdat = '20210201' auart = 'ZSTA' netwr = '3825'     waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' )
    ( vbeln = '60000016' ernam = 'IBARUT' erdat = '20201221' auart = 'FKR'  netwr = '360'      waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D1' )
    ( vbeln = '60000018' ernam = 'IBARUT' erdat = '20210222' auart = 'FKR'  netwr = '90'       waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D3' )
    ( vbeln = '60000022' ernam = 'IBARUT' erdat = '20201222' auart = 'BRE'  netwr = '90'       waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D5' )
    ( vbeln = '60000025' ernam = 'SSZR'   erdat = '20201223' auart = 'FKR'  netwr = '22'       waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D3' )
    ( vbeln = '60000030' ernam = 'SSZR'   erdat = '20210106' auart = 'SRE'  netwr = '1210'     waerk = 'TRY' vkorg = 'TK01' vtweg = 'T3' )
    ( vbeln = '60000031' ernam = 'SSZR'   erdat = '20210106' auart = 'SRE'  netwr = '120000'   waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' )
    ( vbeln = '60000034' ernam = 'SSZR'   erdat = '20210211' auart = 'SRE'  netwr = '120'      waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' )
    ( vbeln = '60000035' ernam = 'SSZR'   erdat = '20210212' auart = 'SRE'  netwr = '120'      waerk = 'TRY' vkorg = 'TK01' vtweg = 'T3' )
    ( vbeln = '60000036' ernam = 'SSZR'   erdat = '20210226' auart = 'SRE'  netwr = '12750000' waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' )
    ( vbeln = '60000038' ernam = 'SSZR'   erdat = '20210226' auart = 'SRE'  netwr = '80'       waerk = 'TRY' vkorg = 'TK01' vtweg = 'T3' )
    ( vbeln = '60000039' ernam = 'SSZR'   erdat = '20210226' auart = 'SRE'  netwr = '85'       waerk = 'TRY' vkorg = 'TK01' vtweg = 'T2' )
    ( vbeln = '60000061' ernam = 'EMALIK' erdat = '20210408' auart = 'FKR'  netwr = '90'       waerk = 'TRY' vkorg = 'BLFZ' vtweg = 'D1' )
     ).

    INSERT zrap_vbak_ss FROM TABLE @lt_vbak.
    COMMIT WORK.

    lt_vbap = VALUE #(
         ( vbeln = '484'      posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'STA2' )
         ( vbeln = '486'      posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'STA2' )
         ( vbeln = '485'      posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'STA2' )
         ( vbeln = '60000016' posnr = '10' matnr = 'VEKCAY4' matkl = '60001' arktx = 'Freezone Ekinezya çay' pstyv = 'FKRN' )
         ( vbeln = '60000018' posnr = '10' matnr = 'VEKCAY4' matkl = '60001' arktx = 'Freezone Ekinezya çay' pstyv = 'FKRN' )
         ( vbeln = '60000022' posnr = '10' matnr = 'VEKCAY2' matkl = '60001' arktx = 'Freezone Ihlamur çay' pstyv = 'FREN' )
         ( vbeln = '60000025' posnr = '10' matnr = 'VEKCAY3' matkl = '02'    arktx = 'Freezone Ihlamur HAMMADDE' pstyv = 'FKRN' )
         ( vbeln = '60000030' posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'SREN' )
         ( vbeln = '60000031' posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'SREN' )
         ( vbeln = '60000034' posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'SREN' )
         ( vbeln = '60000035' posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'SREN' )
         ( vbeln = '60000036' posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'SREN' )
         ( vbeln = '60000038' posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'SREN' )
         ( vbeln = '60000039' posnr = '10' matnr = '663'     matkl = '60001' arktx = 'Ekinezya Bitki Çayi' pstyv = 'SREN' )
         ( vbeln = '60000061' posnr = '10' matnr = 'VEKCAY2' matkl = '60001' arktx = 'Freezone Ihlamur çay' pstyv = 'FKRN' )
      ).
    INSERT zrap_vbap FROM TABLE @lt_vbap.
    COMMIT WORK.

  ENDMETHOD.
ENDCLASS.
