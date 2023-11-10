CLASS zcl_rap_bill_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_bill_001 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


*    DELETE FROM zrap_bill_001 .
*    DELETE FROM zrap_bill_002 .
*    DELETE FROM zrap_bill_003 .
*    DELETE FROM zrap_bill_004 .
*    DELETE FROM zrap_bill_005.
*    DELETE FROM zrap_bill_006.

*    DATA itab1 TYPE TABLE OF zrap_bill_001.
*
**   fill internal travel table (itab)
*    itab1 = VALUE #(
*      ( belnr = '3'
*        matnr = '2'
*        parabirimi = 'TRY'
*        toplamtutar = '10000'
*        olusturmatarih = '20231025'
*        sirketkodu = '1000' )
*
*      ( belnr = '2'
*        matnr = '2'
*        parabirimi = 'TRY'
*        toplamtutar = '20000'
*        olusturmatarih = '20231023'
*        sirketkodu = '2000' ) ).
*
**   insert the new table entries
*    INSERT zrap_bill_001 FROM TABLE @itab1.
*    COMMIT WORK.
*
*    DATA itab2 TYPE TABLE OF zrap_bill_002.
*
**   fill internal travel table (itab)
*    itab2 = VALUE #(
*      ( sirketkodu = '1000'
*        sirketadi = 'Vektora' )
*
*      ( sirketkodu = '2000'
*        sirketadi = 'Sezer' ) ).
*
**   insert the new table entries
*    INSERT zrap_bill_002 FROM TABLE @itab2.
*    COMMIT WORK.
*
*    DATA itab3 TYPE TABLE OF zrap_bill_003.
*
**   fill internal travel table (itab)
*    itab3 = VALUE #(
*      ( matnr = '1'
*        maktx = 'Deneme Malzemesi'
*        birimfiyat = '99.50' )
*
*      ( matnr = '2'
*        maktx = 'Test Malzemesi'
*        birimfiyat = '199.50' ) ).
*
**   insert the new table entries
*    INSERT zrap_bill_003 FROM TABLE @itab3.
*    COMMIT WORK.
*
*    DATA itab4 TYPE TABLE OF zrap_bill_004.
*
**   fill internal travel table (itab)
*    itab4 = VALUE #(
*      ( matnr = '1'
*        miktar = 2 )
*
*      ( matnr = '2'
*        miktar = 10 ) ).
*
**   insert the new table entries
*    INSERT zrap_bill_004 FROM TABLE @itab4.
*    COMMIT WORK.
*
*    DATA itab5 TYPE TABLE OF zrap_bill_005.
*
**   fill internal travel table (itab)
*    itab5 = VALUE #(
*      ( belnr = '1'
*        matnr = '1'
*        parabirimi = 'TRY'
*        toplamtutar = '10000'
*        olusturmatarih = '20231025'
*        sirketkodu = '1000' )
*
*      ( belnr = '2'
*        matnr = '2'
*        parabirimi = 'TRY'
*        toplamtutar = '20000'
*        olusturmatarih = '20231023'
*        sirketkodu = '2000' ) ).
*
**   insert the new table entries
*    INSERT zrap_bill_005 FROM TABLE @itab5.
*    COMMIT WORK.
*
*
*    DATA itab6 TYPE TABLE OF zrap_bill_006.
*
**   fill internal travel table (itab)
*    itab6 = VALUE #(
*      ( belnr = '1'
*        matnr = '1'
*        para_birimi = 'TRY'
*        toplam_tutar = '10000'
*        olusturma_tarih = '20231025'
*        sirket_kodu = '1000' )
*
*      ( belnr = '2'
*        matnr = '2'
*        para_birimi = 'TRY'
*        toplam_tutar = '20000'
*        olusturma_tarih = '20231025'
*        sirket_kodu = '2000' ) ).
*
**   insert the new table entries
*    INSERT zrap_bill_006 FROM TABLE @itab6.
*    COMMIT WORK.



    DELETE FROM zrap_bill_ss_001 .
    DELETE FROM zrap_bill_ss_002 .
    DELETE FROM zrap_bill_ss_003 .
    DELETE FROM zrap_bill_ss_004 .

    DATA itab1 TYPE TABLE OF zrap_bill_ss_001.

*   fill internal travel table (itab)
    itab1 = VALUE #(
      ( belnr = '1'
        matnr = '1'
        para_birimi = 'TRY'
        toplam_tutar = '10000'
        olusturma_tarihi = '20231026'
        sirket_kodu = '1000' )

      ( belnr = '2'
        matnr = '2'
        para_birimi = 'TRY'
        toplam_tutar = '20000'
        olusturma_tarihi = '20231026'
        sirket_kodu = '2000' ) ).

*   insert the new table entries
    INSERT zrap_bill_ss_001 FROM TABLE @itab1.
    COMMIT WORK.

    DATA itab2 TYPE TABLE OF zrap_bill_ss_002.

*   fill internal travel table (itab)
    itab2 = VALUE #(
      ( sirket_kodu = '1000'
        sirket_adi = 'Vektora' )

      ( sirket_kodu = '2000'
        sirket_adi = 'Sezer' ) ).

*   insert the new table entries
    INSERT zrap_bill_ss_002 FROM TABLE @itab2.
    COMMIT WORK.

    DATA itab3 TYPE TABLE OF zrap_bill_ss_003.

*   fill internal travel table (itab)
    itab3 = VALUE #(
      ( matnr = '1'
        miktar = 2 )

      ( matnr = '2'
        miktar = 10 ) ).

*   insert the new table entries
    INSERT zrap_bill_ss_003 FROM TABLE @itab3.
    COMMIT WORK.

    DATA itab4 TYPE TABLE OF zrap_bill_ss_004.

*   fill internal travel table (itab)
    itab4 = VALUE #(
      ( matnr = '1'
        maktx = 'Deneme Malzemesi'
        birimfiyat = '99.50' )

      ( matnr = '2'
        maktx = 'Test Malzemesi'
        birimfiyat = '199.50' ) ).

*   insert the new table entries
    INSERT zrap_bill_ss_004 FROM TABLE @itab4.
    COMMIT WORK.

  ENDMETHOD.
ENDCLASS.
