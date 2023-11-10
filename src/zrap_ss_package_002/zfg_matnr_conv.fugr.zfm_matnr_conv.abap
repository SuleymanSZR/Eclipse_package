FUNCTION zfm_matnr_conv.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
*  IMPORTING
*    VALUE(input) TYPE any ##ADT_PARAMETER_UNTYPED
*  EXPORTING
*    VALUE(output) TYPE any ##ADT_PARAMETER_UNTYPED.
*
*
*
** Änderung von output nach output_help als Hilfsvariable RWA 04.06.98
** Introduction of lv_kind and lv_input_help for strings (WD) BIS 20050405
*  DATA: lv_input_help  TYPE string,
*        lv_kind        TYPE abap_typekind,
*        lv_input_c(40).
*
*  FIELD-SYMBOLS: <e_ptr>,              "Eingabe
*                 <a_ptr>,              "Ausgabe
*                 <s_ptr>,              "Schablone
*                 <n_ptr>,              "numerische Zeichen
*                 <t_ptr>.              "Trennzeichen in Schablone
*
*
*  DATA : output_help(255).                                 "RWA 04.06.98
*
*** Customer Exit zu 4.0 wk
*  CALL CUSTOMER-FUNCTION '901' "#EC *
*    CHANGING
*      matnr       = input
*    EXCEPTIONS
*      ignore_rest = 1
*      OTHERS      = 2.
*  IF sy-subrc EQ 1.
*    output = input.
*    EXIT.
*  ENDIF.
*
*  PERFORM badi_matn1_check_init.
*
**  IF NOT imp_badi_matn1_exist IS INITIAL.
*  IF g_badi_matn1_new IS BOUND.
*    lv_input_c = input.
*
*    CALL BADI g_badi_matn1_new->matn1_output_001
*      CHANGING
*        MATNR       = lv_input_c
*      EXCEPTIONS
*        IGNORE_REST = 1.
*
**    CALL METHOD g_badi_matn1->matn1_output_001
**      CHANGING
**        matnr       = lv_input_c
**      EXCEPTIONS
**        ignore_rest = 1.
*    IF sy-subrc = 1.
*      output = lv_input_c.                                "note 1046715
*      EXIT.
*    ENDIF.
*  ENDIF.
*
*  IF tmcnv-convid NE matconv.          "Wenn Tabelle noch nicht gelesen
*    SELECT SINGLE * FROM tmcnv WHERE convid EQ matconv.
*    IF sy-subrc NE 0.
**     message e135(bmg) with sy-subrc.
**--only A-messages allowed HB 14.06.95
*      MESSAGE a135(bmg) WITH sy-subrc.
*    ENDIF.
*  ENDIF.
*
*  anum = tmcnv-atrenn + 10.
*  MOVE tmcnv-tz TO num+10(40).
*
*  lng_e = strlen( input ).
*  IF lng_e EQ 0.
**   CLEAR OUTPUT.                                          "RWA 04.06.98
*    CLEAR output_help.                                     "RWA 04.06.98
*    EXIT.
*  ENDIF.
*
*  lv_kind = cl_abap_datadescr=>get_data_type_kind( p_data = input ).
*  CASE lv_kind.
*    WHEN cl_abap_datadescr=>typekind_string.
*      lv_input_help = input(lng_e).
*      ASSIGN lv_input_help TO <e_ptr>.
*    WHEN OTHERS.
*      ASSIGN input(lng_e) TO <e_ptr>.      "->Eingabe
*  ENDCASE.
*  IF tmcnv-lmaske GT 0.
*    ASSIGN tmcnv-maske(tmcnv-lmaske) TO <s_ptr>. "->Schablone
*  ENDIF.
*  IF tmcnv-atrenn GT 0.
*    ASSIGN num+10(tmcnv-atrenn) TO <t_ptr>.  "->Trennz. aus Schablone
*  ENDIF.
*  ASSIGN num(anum) TO <n_ptr>.         "->numerische und Trennzeichen
*
**--lexicographical material number storage  HB 08.11.95
*  IF tmcnv-lexflag = 'X'.
*    tmcnv-flag0 = 'X'.
*  ENDIF.
*
**+++
**  Ausgabe ohne Aufbereitung über Schablone
**---
*  IF tmcnv-lmaske EQ 0 OR              "Schablone existiert nicht oder
*     <s_ptr> CO '_ '.                  "enthält nur Auswahlzeichen
*    IF <e_ptr> CO <n_ptr> AND          "Materialnummer numerisch?
**--lexicographical material number storage  HB 08.11.95
*        tmcnv-lexflag IS INITIAL.
*      IF tmcnv-flag0 EQ 'X'.           "führende Nullen ausgeben?
*        IF tmcnv-lmatnr > 18.          "note 2236459
*          off_e = 0.
*        else.
*          off_e = lmatnr_num - tmcnv-lmatnr. "Offset für Ausgabe
*        endif.
*        CASE lv_kind.
*          WHEN cl_abap_datadescr=>typekind_string.
*            lv_input_help = input+off_e(tmcnv-lmatnr).
*            ASSIGN lv_input_help TO <e_ptr>.
*          WHEN OTHERS.
*            data lv_laenge type i. "note 3237264
*            lv_laenge = lmatnr_num - off_e.
*            ASSIGN input+off_e(lv_laenge) TO <e_ptr>. "note 2427900
*        ENDCASE.
*      ELSE.                            "keine führenden Nullen ausgeben
*        IF <e_ptr> CA '0'.             "Nullen?
*          IF sy-fdpos EQ 0.            "Führende Nullen?
*            IF <e_ptr> CN '0'.         "Offset 1.Nicht-Null
*              lng_e = lng_e - sy-fdpos."Länge ohne führende Nullen
*              CASE lv_kind.
*                WHEN cl_abap_datadescr=>typekind_string.
*                  lv_input_help = <e_ptr>+sy-fdpos(lng_e).
*                  ASSIGN lv_input_help TO <e_ptr>.
*                WHEN OTHERS.
*                  ASSIGN <e_ptr>+sy-fdpos(lng_e) TO <e_ptr>.
*              ENDCASE.
*            ELSE.                      "alles Nullen
*              ASSIGN '0' TO <e_ptr>.
*              lng_e = 0.
*            ENDIF.
*          ENDIF.
*        ENDIF.
*      ENDIF.
*    ENDIF.
**   MOVE <E_PTR> TO OUTPUT.                                "RWA 04.06.98
*    MOVE <e_ptr> TO output_help.                           "RWA 04.06.98
*
**+++
**  Aufbereitung über Schablone
**---
*  ELSE.
*    IF <e_ptr> CO <n_ptr> AND          "Materialnummer numerisch?
**--lexicographical material number storage  HB 08.11.95
*         tmcnv-lexflag IS INITIAL.
*      CLEAR work.
*      off_1st = 0.                     "Offset -> 1.Ziffer
*      IF tmcnv-flag0 NE 'X'.           "führende Nullen unterdrücken?
*        IF <e_ptr> CA '0'.             "Nullen?
*          IF sy-fdpos EQ 0.            "führende Nullen?
*            IF input CN '0'.           "alles Nullen?
*              off_1st = sy-fdpos.      "Offset 1.signifikante Ziffer
*            ELSE.
*              off_1st = lng_e - 1.     "Offset -> letzte Ziffer
*            ENDIF.
*          ENDIF.
*        ENDIF.
*      ENDIF.
*      lng_e = lmatnr_num.
*      lng_a = tmcnv-lmatnr.
*      if lng_a > lmatnr_num.
*        lng_a = lmatnr_num + tmcnv-ATRENNX.   "note 2481134
*      endif.
**      lng_a = minimum( tmcnv-lmatnr lmatnr_num ).
*      off_a = lng_a - 1.
*      off_e = lng_e - 1.
*      off_s = tmcnv-lmaske - 1.
*      if off_s >= lmatnr_num.
*        off_s = lmatnr_num + tmcnv-ATRENNX - 1.   "note 2481134
*      endif.
*      WHILE off_a GE 0 AND
*            off_e GE 0.
*        CASE lv_kind.
*          WHEN cl_abap_datadescr=>typekind_string.
*            lv_input_help = input+off_e(1).
*            ASSIGN lv_input_help TO <e_ptr>.
*          WHEN OTHERS.
*            ASSIGN input+off_e(1)  TO <e_ptr>.    "-> lfd. Eingabebyte
*        ENDCASE.
*        ASSIGN work+off_a(1)   TO <a_ptr>.    "-> lfd. Ausgabebyte
*        IF off_s GE 0.
*          ASSIGN tmcnv-maske+off_s(1)  TO <s_ptr>.  "-> lfd. Zeiche
*        ENDIF.
*        IF <s_ptr> CO editze.          "Ziffernauswahlzeichen
*          MOVE <e_ptr> TO <a_ptr>.     "Ziffer Input -> Output
*          off_e = off_e - 1.           "Offset nächste Ziffer
*        ELSE.                          "sonst
*          MOVE <s_ptr> TO <a_ptr>.     "Zeichen aus Schab -> Output
*        ENDIF.
*        IF off_s EQ 0.                 "Ende der Schablone
*          ASSIGN ' ' TO <s_ptr>.       "->Blank für Aufbereitung
*        ENDIF.
*        off_s = off_s - 1.             "Offset nächstes Schab-Zeichen
*        off_a = off_a - 1.             "Offset nächstes Ausgabebyte
*        IF off_e LT off_1st.           "Nach 1.signifikanter Ziffer
*          EXIT.                        "abbrechen
*        ENDIF.
*      ENDWHILE.
*      ASSIGN work(lng_a) TO <a_ptr>.   "->aufbereitete Ausgabe
*      IF <a_ptr> CA ' '.               "Blanks?
*        IF sy-fdpos = 0.               "führende Blanks?
*          IF <a_ptr> CN ' '.           "Offset 1.Non-Blank
*            lng_a = lng_a - sy-fdpos.
*            ASSIGN <a_ptr>+sy-fdpos(lng_a) TO <a_ptr>.
*          ENDIF.
*        ENDIF.
*      ENDIF.
**     MOVE <A_PTR> TO OUTPUT.                              "RWA 04.06.98
*      MOVE <a_ptr> TO output_help.                         "RWA 04.06.98
*
*    ELSE.                              "Materialnummer nicht-numerisch
*      lng_e = strlen( input ).
*      lng_a = tmcnv-lmatnr.
*      off_a = 0.
*      off_e = 0.
*      off_s = 0.
**     MOVE ' ' TO OUTPUT.                                  "RWA 04.06.98
*      MOVE ' ' TO output_help.                             "RWA 04.06.98
*      WHILE off_a LT lng_a AND
*            lng_e GT 0.
*        CASE lv_kind.
*          WHEN cl_abap_datadescr=>typekind_string.
*            lv_input_help = input+off_e(lng_e).
*            ASSIGN lv_input_help TO <e_ptr>.
*          WHEN OTHERS.
*            ASSIGN input+off_e(lng_e) TO <e_ptr>.      "-> Eingabebyte
*        ENDCASE.
*
*        ASSIGN tmcnv-maske+off_s(1) TO <s_ptr>.    "-> Zeichen in Schab
**   ASSIGN OUTPUT+OFF_A(1)    TO <A_PTR>. -> Ausgabebyte    RWA 04.06.98
*        ASSIGN output_help+off_a(1)    TO <a_ptr>.         "RWA 04.06.98
*        IF <s_ptr> CO editze.          "Ziffernauswahlzeichen
*          MOVE <e_ptr> TO <a_ptr>.     "Ziffer Input -> Output
*          off_e = off_e + 1.           "Offset nächste Ziffer
*          lng_e = lng_e - 1.
*        ELSE.                          "sonst
*          MOVE <s_ptr> TO <a_ptr>.     "Zeichen aus Schab -> Output
*        ENDIF.
*        off_s = off_s + 1.             "Offset nächstes Schab-Zeichen
*        off_a = off_a + 1.             "Offset nächstes Ausgabebyte
*      ENDWHILE.
*    ENDIF.
*  ENDIF.
*
**<<<<<<<<<<<<<<<<<NOTE 453468<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
**OUTPUT = OUTPUT_HELP.
**  "RWA 04.06.98
**
**** customer exit to 4.0 wk
**  CALL CUSTOMER-FUNCTION '902'
**       EXPORTING
**            MATNR_ORIG  = INPUT
**       CHANGING
**           MATNR       = OUTPUT
**       EXCEPTIONS
**            OTHERS      = 2.
**OUTPUT = OUTPUT_HELP.
**  "RWA 04.06.98
*
*** customer exit to 4.0 wk
*  CALL CUSTOMER-FUNCTION '902' "#EC *
*    EXPORTING
*      matnr_orig = input
*    CHANGING
*      matnr      = output_help
*    EXCEPTIONS
*      OTHERS     = 2.
*
**  IF NOT imp_badi_matn1_exist IS INITIAL.
*  IF g_badi_matn1_new IS BOUND.
*    lv_input_c = input.
*
*    CALL BADI g_badi_matn1_new->MATN1_OUTPUT_002
*      EXPORTING
*        MATNR_ORIG = lv_input_c
*      CHANGING
*        MATNR      = output_help.
*
**    CALL METHOD g_badi_matn1->matn1_output_002
**      EXPORTING
**        matnr_orig = lv_input_c
**      CHANGING
**        matnr      = output_help.
*  ENDIF.
*
*  output = output_help.
**<<<<<<<<<<<<<<<<<NOTE 453468<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
*
*
ENDFUNCTION.
