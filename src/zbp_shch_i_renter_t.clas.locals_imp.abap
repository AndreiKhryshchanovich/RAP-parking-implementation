CLASS lhc_rentertxt DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS assignLangu FOR DETERMINE ON MODIFY
      IMPORTING lt_keys FOR RenterTxt~assignLangu.
    METHODS validateNames FOR VALIDATE ON SAVE
      IMPORTING lt_keys FOR RenterTxt~validateNames.

ENDCLASS.

CLASS lhc_rentertxt IMPLEMENTATION.

  METHOD assignLangu.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
        ENTITY RenterTxt
           UPDATE FIELDS ( Langu )
              WITH VALUE #( FOR ls_key IN lt_keys
                     ( %tky           = ls_key-%tky
                       Langu          = sy-langu
                       %control-Langu = if_abap_behv=>mk-on ) )
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    reported = CORRESPONDING #( DEEP lt_reported ).

  ENDMETHOD.

  METHOD validateNames.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY RenterTxt
        FIELDS ( FirstName LastName ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters_txt).

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY RenterTxt BY \_Renter
        FROM CORRESPONDING #( lt_renters_txt )
      LINK DATA(lt_rentertxt_renter_links).

    LOOP AT lt_renters_txt ASSIGNING FIELD-SYMBOL(<ls_renter_txt>).
      APPEND VALUE #(  %tky               = <ls_renter_txt>-%tky
                       %state_area        = 'VALIDATE_NAMES' )
        TO reported-rentertxt.

      IF <ls_renter_txt>-FirstName IS INITIAL OR <ls_renter_txt>-LastName IS INITIAL.
        APPEND VALUE #( %tky = <ls_renter_txt>-%tky ) TO failed-rentertxt.

        APPEND VALUE #( %tky        = <ls_renter_txt>-%tky
                        %state_area = 'VALIDATE_NAMES'
                        %msg        = NEW zshch_cm_parking(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zshch_cm_parking=>name_not_filled )
                        %path       = VALUE #( renter-%tky = lt_rentertxt_renter_links[ source-%tky = <ls_renter_txt>-%tky ]-target-%tky ) )
          TO reported-rentertxt.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
