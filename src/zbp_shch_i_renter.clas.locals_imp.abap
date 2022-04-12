CLASS lhc_Renter DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF discount_amount,
        platinum TYPE zshch_d_renter_a-discount  VALUE 20,    "Discount 20%
        gold     TYPE zshch_d_renter_a-discount  VALUE 15,    "Discount 15%
        silver   TYPE zshch_d_renter_a-discount  VALUE 10,    "Discount 10%
        bronze   TYPE zshch_d_renter_a-discount  VALUE 5,     "Discount 5%
        start    TYPE zshch_d_renter_a-discount  VALUE 0,     "Discount 0%
      END OF discount_amount,
      BEGIN OF discount_type,
        platinum TYPE zshch_d_renter_a-rent_number  VALUE 40, "Start from 40 uses
        gold     TYPE zshch_d_renter_a-rent_number  VALUE 30, "Start from 30 uses
        silver   TYPE zshch_d_renter_a-rent_number  VALUE 20, "Start from 30 uses
        bronze   TYPE zshch_d_renter_a-rent_number  VALUE 10, "Start from 30 uses
      END OF discount_type.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING lt_keys REQUEST requested_features FOR renter RESULT et_result.

    METHODS returnInitialDiscount FOR MODIFY
      IMPORTING lt_keys FOR ACTION renter~returnInitialDiscount RESULT et_result.

    METHODS maximizeDiscount FOR MODIFY
      IMPORTING lt_keys FOR ACTION renter~maximizeDiscount RESULT et_result.

    METHODS calculateRenterId FOR DETERMINE ON SAVE
      IMPORTING lt_keys FOR Renter~calculateRenterId.

    METHODS increaseRentNumber FOR MODIFY
      IMPORTING lt_keys FOR ACTION renter~increaseRentNumber.

    METHODS validatePassport FOR VALIDATE ON SAVE
      IMPORTING lt_keys FOR renter~validatePassport.

    METHODS validatePhoneNumber FOR VALIDATE ON SAVE
      IMPORTING lt_keys FOR renter~validatePhoneNumber.

ENDCLASS.

CLASS lhc_Renter IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter BY \_RenterTxt
        FIELDS ( FirstName ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters_txt)
      FAILED failed.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        FIELDS ( Discount ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters)
      FAILED failed.

    et_result =
      VALUE #(
        FOR ls_renter_txt IN lt_renters_txt
        FOR ls_renter     IN lt_renters FROM line_index( lt_renters[ RenterUuid = ls_renter_txt-RenterUuid ] )
                                        WHERE ( RenterUuid = ls_renter_txt-RenterUuid )
            ( %tky                      = ls_renter-%tky
              %assoc-_RenterTxt         = COND #( WHEN ls_renter_txt-FirstName IS NOT INITIAL
                                                  THEN if_abap_behv=>fc-o-disabled
                                                  ELSE if_abap_behv=>fc-o-enabled )
              %action-maximizeDiscount  = COND #( WHEN ls_renter-Discount = discount_amount-platinum
                                                  THEN if_abap_behv=>fc-o-disabled
                                                  ELSE if_abap_behv=>fc-o-enabled )
                                                  ) ).

  ENDMETHOD.

  METHOD maximizeDiscount.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        UPDATE
          FIELDS ( Discount )
            WITH VALUE #( FOR ls_key IN lt_keys
                         ( %tky     = ls_key-%tky
                           Discount = discount_amount-platinum ) )
      FAILED failed
      REPORTED reported.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        ALL FIELDS WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters).

    et_result = VALUE #( FOR ls_renter IN lt_renters
                        ( %tky   = ls_renter-%tky
                          %param = ls_renter ) ).

  ENDMETHOD.

  METHOD returnInitialDiscount.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        FIELDS ( RentNumber ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters)
      FAILED failed.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        UPDATE
          FIELDS ( Discount )
          WITH VALUE #( FOR ls_renter IN lt_renters
                        ( %tky     = ls_renter-%tky
                          Discount = COND #( WHEN ls_renter-RentNumber < discount_type-bronze   THEN discount_amount-start
                                             WHEN ls_renter-RentNumber < discount_type-silver   THEN discount_amount-bronze
                                             WHEN ls_renter-RentNumber < discount_type-gold     THEN discount_amount-silver
                                             WHEN ls_renter-RentNumber < discount_type-platinum THEN discount_amount-gold
                                             WHEN ls_renter-RentNumber > discount_type-platinum THEN discount_amount-platinum ) ) )
    FAILED failed
    REPORTED reported.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        ALL FIELDS WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters_update).

    et_result = VALUE #( FOR ls_renter_update IN lt_renters_update
                        ( %tky   = ls_renter_update-%tky
                          %param = ls_renter_update ) ).

  ENDMETHOD.

  METHOD calculateRenterId.

    DATA: lv_number  TYPE cl_numberrange_runtime=>nr_number.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Renter
          FIELDS ( RenterId )
          WITH CORRESPONDING #( lt_keys )
       RESULT DATA(lt_renters).

    DELETE lt_renters WHERE RenterId IS NOT INITIAL.

    CHECK lt_renters IS NOT INITIAL.

    LOOP AT lt_renters ASSIGNING FIELD-SYMBOL(<ls_renter>).
      TRY.
          CALL METHOD cl_numberrange_runtime=>number_get
            EXPORTING
              nr_range_nr = '01'
              object      = 'ZSHCH_RENT'
              quantity    = 00000000000000000001
            IMPORTING
              number      = lv_number.
          <ls_renter>-RenterId = |{ lv_number ALPHA = OUT }|.
        CATCH cx_nr_object_not_found.
        CATCH cx_number_ranges.
      ENDTRY.
    ENDLOOP.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Renter
          UPDATE FIELDS ( RenterId )
          WITH CORRESPONDING #( lt_renters )
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

  ENDMETHOD.

  METHOD increaseRentNumber.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Renter
          FIELDS ( RentNumber )
          WITH CORRESPONDING #( lt_keys )
       RESULT DATA(lt_renters).

    LOOP AT lt_renters ASSIGNING FIELD-SYMBOL(<ls_renter>).
      <ls_renter>-RentNumber = <ls_renter>-RentNumber + 1.
    ENDLOOP.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Renter
          UPDATE FIELDS ( RentNumber )
          WITH CORRESPONDING #( lt_renters )
      FAILED failed
      REPORTED reported.

  ENDMETHOD.

  METHOD validatePassport.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        FIELDS ( Passport ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters).

    LOOP AT lt_renters ASSIGNING FIELD-SYMBOL(<ls_renter>).
      APPEND VALUE #(  %tky               = <ls_renter>-%tky
                       %state_area        = 'VALIDATE_PASSPORT' )
        TO reported-renter.

      IF <ls_renter>-Passport IS INITIAL.
        APPEND VALUE #( %tky = <ls_renter>-%tky ) TO failed-renter.

        APPEND VALUE #( %tky        = <ls_renter>-%tky
                        %state_area = 'VALIDATE_PASSPORT'
                        %msg        = NEW zshch_cm_parking(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zshch_cm_parking=>passport_not_filled ) )
          TO reported-renter.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validatePhoneNumber.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Renter
        FIELDS ( PhoneNumber ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_renters).

    LOOP AT lt_renters ASSIGNING FIELD-SYMBOL(<ls_renter>).
      APPEND VALUE #(  %tky               = <ls_renter>-%tky
                       %state_area        = 'VALIDATE_PHONE_NUMBER' )
        TO reported-renter.

      IF <ls_renter>-PhoneNumber IS INITIAL.
        APPEND VALUE #( %tky = <ls_renter>-%tky ) TO failed-renter.

        APPEND VALUE #( %tky        = <ls_renter>-%tky
                        %state_area = 'VALIDATE_PHONE_NUMBER'
                        %msg        = NEW zshch_cm_parking(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zshch_cm_parking=>phone_number_not_filled ) )
          TO reported-renter.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
