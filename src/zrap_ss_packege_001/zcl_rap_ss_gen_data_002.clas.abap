CLASS zcl_rap_ss_gen_data_002 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_ss_gen_data_002 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**case 1
*    READ ENTITIES OF zss_i_travel_001
*    ENTITY Travel FROM VALUE #( ( TravelUUID = '46492F209E3ED99E180035A67BF6E95B' ) )
*    RESULT DATA(lt_table1).
*
*    out->write( 'Alansız Okuma başarılı' ).
*
** case 2
*    READ ENTITIES OF zss_i_travel_001
*    ENTITY travel FIELDS ( TravelID AgencyID )
*    WITH VALUE #( ( TravelUUID = '46492F209E3ED99E180035A67BF6E95B' ) )
*    RESULT DATA(lt_table2).
*
*    out->write('Anahtar alan Okuma başarılı').
*
** case 3
*    READ ENTITIES OF zss_i_travel_001
*    ENTITY travel ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '46492F209E3ED99E180035A67BF6E95B' ) )
*    RESULT DATA(lt_table3).
*
*    out->write( 'Tüm alan okuma Başarılı' ).
*
** case 4
*    READ ENTITIES OF zss_i_travel_001
*    ENTITY travel BY \_Booking
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '46492F209E3ED99E180035A67BF6E95B' ) )
*    RESULT DATA(lt_table4).
*
*    out->write( 'Assosiation okuma Başarılı' ).
*
** case 5
*    READ ENTITIES OF zss_i_travel_001
*    ENTITY travel
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '11111111111133333333333334444444' ) )
*    RESULT DATA(lt_table5)
*    FAILED DATA(lt_failed1)
*    REPORTED DATA(lt_reported1).
*
*    out->write( 'Kayıt olamadıgı için okuma başarısız' ).

* delete

*    SELECT *
*    FROM zss_book_001
*    INTO TABLE @DATA(lt_data).
*
*    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
*      <lfs_data>-zztemp_guid = <lfs_data>-booking_uuid.
*    ENDLOOP.
*
*
*    MODIFY zss_book_001 FROM TABLE @lt_data.
*    IF sy-subrc EQ 0.
*      COMMIT WORK.
*    ELSE.
*      ROLLBACK WORK.
*    ENDIF.

    READ ENTITIES OF zss_i_travel_001
    ENTITY travel ALL FIELDS
    WITH VALUE #( ( TravelUUID = '1D576A209E3ED99E180035A67BF6E95B' ) )
    RESULT DATA(lt_table3).

    MODIFY ENTITIES OF zss_i_travel_001
    ENTITY travel
    DELETE FROM
    VALUE #( ( TravelUUID = '1D576A209E3ED99E180035A67BF6E95B') )
    FAILED DATA(lt_failed2)
    REPORTED DATA(lt_reported2).

    COMMIT ENTITIES
    RESPONSE OF zss_i_travel_001
    FAILED DATA(lt_commit_failed)
    REPORTED DATA(lt_commit_reported).

    IF sy-subrc EQ 0.
      out->write('Kayıt silme Başarılı').
    ENDIF.
** delete
*    MODIFY ENTITIES OF zr_rap_ss_003
*    ENTITY travel
*    DELETE FROM
*    VALUE #( ( TravelID = '00000005') )
*    FAILED DATA(lt_failed2)
*    REPORTED DATA(lt_reported2).
*
*    COMMIT ENTITIES
*    RESPONSE OF zr_rap_ss_003
*    FAILED DATA(lt_commit_failed)
*    REPORTED DATA(lt_commit_reported).


  ENDMETHOD.

ENDCLASS.
