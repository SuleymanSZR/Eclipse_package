CLASS lhc_Fatura DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Fatura RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Fatura RESULT result.

ENDCLASS.

CLASS lhc_Fatura IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zr_rap_bill_005 IN LOCAL MODE
    ENTITY Fatura
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_fatura).

    LOOP AT lt_fatura ASSIGNING FIELD-SYMBOL(<lfs_fatura>).
*      CALL FUNCTION 'CONVERSION_EXIT_MATN1_OUTPUT'
*        EXPORTING
*          input  = <lfs_fatura>-Matnr
*        IMPORTING
*          output = <lfs_fatura>-Matnr.

    ENDLOOP.



  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
