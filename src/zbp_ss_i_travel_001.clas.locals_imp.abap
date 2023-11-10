CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS setActiveTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~setActiveTravel RESULT result.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zss_i_travel_001 IN LOCAL MODE
      ENTITY travel
        FIELDS ( TravelID TravelStatus  )
          WITH CORRESPONDING #( keys )
            RESULT DATA(travels)
              FAILED failed.

    " evaluate the conditions, set the operation state, and set result parameter
    result = VALUE #( FOR travel IN travels
                      ( %tky                   = travel-%tky

                        %features-%update       = COND #( WHEN travel-TravelStatus = 'A'
                                                    THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled   )
                        %features-%delete       = COND #( WHEN travel-TravelStatus = 'O'
                                                    THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled   )
                        %action-setActiveTravel = COND #( WHEN travel-TravelStatus = 'A'
                                                    THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled   )

                     ) ).
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setActiveTravel.

    " Read changed data for action result
*    READ ENTITIES OF zss_i_travel_001 IN LOCAL MODE
*         ENTITY travel
*         FROM VALUE #( FOR key IN keys (
*                                          %control = VALUE #(
*                                            AgencyID       = if_abap_behv=>mk-on
*                                            CustomerID     = if_abap_behv=>mk-on
*                                            BeginDate      = if_abap_behv=>mk-on
*                                            EndDate        = if_abap_behv=>mk-on
*                                            BookingFee     = if_abap_behv=>mk-on
*                                            TotalPrice     = if_abap_behv=>mk-on
*                                            CurrencyCode   = if_abap_behv=>mk-on
*                                            TravelStatus   = if_abap_behv=>mk-on
*                                            Description    = if_abap_behv=>mk-on
*                                            CreatedBy      = if_abap_behv=>mk-on
*                                            CreatedAt      = if_abap_behv=>mk-on
*                                            LastChangedBy  = if_abap_behv=>mk-on
*                                            LastChangedAt  = if_abap_behv=>mk-on
*                                          ) ) )
*         RESULT DATA(lt_travel).

    " modify travel instance(s)
*    MODIFY ENTITIES OF zss_i_travel_001 IN LOCAL MODE
*    ENTITY Travel
*    UPDATE FIELDS ( BookingFee )
*    WITH VALUE #( FOR key IN keys ( %tky       = key-%tky
*                                    BookingFee = 2000 ) )
*    FAILED failed
*    REPORTED reported.
*
*
*    READ ENTITIES OF zss_i_travel_001 IN LOCAL MODE
*    ENTITY Travel
*    ALL FIELDS WITH
*    CORRESPONDING #( keys )
*    RESULT DATA(lt_travel).
*
*    result = VALUE #( FOR travel IN lt_travel ( %tky      = travel-%tky
*                                                %param    = travel  ) ).

*********************************************************************************
    READ ENTITIES OF zss_i_travel_001 IN LOCAL MODE
    ENTITY Travel
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

    LOOP AT lt_travel ASSIGNING FIELD-SYMBOL(<lfs_travel>).
      <lfs_travel>-TotalPrice = ( <lfs_travel>-BookingFee + <lfs_travel>-TotalPrice ).
      DATA(lv_total) = <lfs_travel>-TotalPrice.
      DATA(lv_tid)   = <lfs_travel>-TravelID.
      DATA(lv_curr)  = <lfs_travel>-CurrencyCode.
    ENDLOOP.

    DATA lt_update TYPE TABLE FOR UPDATE zss_i_travel_001.
    lt_update = CORRESPONDING #( lt_travel ).

    MODIFY ENTITIES OF zss_i_travel_001 IN LOCAL MODE
    ENTITY Travel
    UPDATE FIELDS ( TotalPrice )
    WITH lt_update
    FAILED failed
    REPORTED reported.

**  Mesaj doldurma işlemi
    DATA(lv_message) = me->new_message( id       = 'ZCL_MSG_001'
                                        number   = 001
                                        severity = ms-information
                                        v1       = lv_total
                                        v2       = lv_tid
                                        v3       = lv_curr ).

    "" Display Popup
    DATA ls_record LIKE LINE OF reported-travel.
    ls_record-%msg = lv_message.
    ls_record-%element-totalprice = if_abap_behv=>mk-on.
    ls_record-%element-travelid   = if_abap_behv=>mk-on.
    APPEND ls_record TO reported-travel.


*  Hard code mesaj bastırma
*    DATA(lv_mess) = me->new_message_with_text( text = 'hello Word'
*                                               severity = ms-information ).
*
*    DATA ls_record LIKE LINE OF reported-travel.
*    ls_record-%msg = lv_mess.
*    APPEND ls_record TO reported-travel.

    result = VALUE #( FOR travel IN lt_travel ( %tky   = travel-%tky
                                                %param = travel ) ).

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Booking RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS setActiveBook FOR MODIFY
      IMPORTING keys FOR ACTION Booking~setActiveBook RESULT result.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setActiveBook.

    READ ENTITIES OF zss_i_travel_001 IN LOCAL MODE
    ENTITY Booking
     ALL FIELDS WITH
      CORRESPONDING #( keys )
     RESULT DATA(lt_booking).
*
*    LOOP AT lt_booking ASSIGNING FIELD-SYMBOL(<lfs_booking>).
*      <lfs_booking>-FlightPrice = ( <lfs_booking>-FlightPrice + '100' ).
*      DATA(lv_price) = <lfs_booking>-FlightPrice.
*      DATA(lv_bid)   = <lfs_booking>-BookingID.
*      DATA(lv_curr)  = <lfs_booking>-CurrencyCode.
*
*    ENDLOOP.
*
*    DATA lt_update TYPE TABLE FOR UPDATE zss_i_book_001.
*    lt_update = CORRESPONDING #( lt_booking ).
*
*    MODIFY ENTITIES OF zss_i_travel_001 IN LOCAL MODE
*    ENTITY Booking
*    UPDATE FIELDS ( FlightPrice )
*    WITH lt_update
*    FAILED failed
*    REPORTED reported.
*

    DATA(lv_price) = '200'.
    DATA(lv_bid) = '20'.
    DATA(lv_curr) = 'TRY'.
**  Mesaj doldurma işlemi
    DATA(lv_message) = me->new_message( id       = 'ZCL_MSG_001'
                                        number   = 002
                                        severity = ms-information
                                        v1       = lv_price
                                        v2       = lv_bid
                                        v3       = lv_curr ).
*
*    "" Display Popup
    DATA ls_record LIKE LINE OF reported-travel.
    ls_record-%msg = lv_message.
    ls_record-%element-totalprice = if_abap_behv=>mk-on.
    ls_record-%element-travelid   = if_abap_behv=>mk-on.
    APPEND ls_record TO reported-travel.

    result = VALUE #( FOR booking IN lt_booking ( %tky   = booking-%tky
                                                  %param = booking ) ).

*    DATA(lv_mess) = me->new_message_with_text( text = 'hello Word'
*                                               severity = ms-information ).

*    DATA ls_record LIKE LINE OF reported-travel.
*    ls_record-%msg = lv_message.
*    APPEND ls_record TO reported-travel.
  ENDMETHOD.

ENDCLASS.
