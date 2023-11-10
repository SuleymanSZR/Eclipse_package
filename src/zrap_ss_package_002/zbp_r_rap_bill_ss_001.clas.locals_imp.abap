CLASS lhc_Fatura DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Fatura RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR fatura RESULT result.

    METHODS sirketdetay FOR MODIFY
      IMPORTING keys FOR ACTION fatura~sirketdetay RESULT result.

ENDCLASS.

CLASS lhc_Fatura IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD sirketDetay.

*    READ ENTITIES OF zr_rap_bill_ss_001 IN LOCAL MODE
*    ENTITY Sirket
*      ALL FIELDS WITH
*        CORRESPONDING #( keys )
*          RESULT DATA(lt_Sirket).

  ENDMETHOD.

ENDCLASS.
