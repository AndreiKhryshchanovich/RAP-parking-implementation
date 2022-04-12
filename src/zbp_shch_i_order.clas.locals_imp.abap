CLASS lhc_Order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF payment_status,
        paid   TYPE zshch_d_rorder_a-payment_status  VALUE '1',
        unpaid TYPE zshch_d_rorder_a-payment_status  VALUE '2',
      END OF payment_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING lt_keys REQUEST requested_features FOR Order RESULT et_result.

    METHODS payRental FOR MODIFY
      IMPORTING lt_keys FOR ACTION Order~payRental RESULT et_result.

    METHODS calculateRental FOR DETERMINE ON MODIFY
      IMPORTING lt_keys FOR Order~calculateRental.

    METHODS calculateRentEndTime FOR DETERMINE ON MODIFY
      IMPORTING lt_keys FOR Order~calculateRentEndTime.

    METHODS calculateRentOrderId FOR DETERMINE ON SAVE
      IMPORTING lt_keys FOR Order~calculateRentOrderId.

    METHODS refreshRelatedTables FOR DETERMINE ON SAVE
      IMPORTING lt_keys FOR Order~refreshRelatedTables.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING lt_keys FOR Order~validateDates.

    METHODS validateSpaceAbailability FOR VALIDATE ON SAVE
      IMPORTING lt_keys FOR Order~validateSpaceAbailability.

    METHODS validateStatus FOR VALIDATE ON SAVE
      IMPORTING lt_keys FOR Order~validateStatus.


ENDCLASS.

CLASS lhc_Order IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        FIELDS ( PaymentStatus ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_orders)
      FAILED failed.

    et_result =
      VALUE #(
        FOR ls_order IN lt_orders
            ( %tky                 = ls_order-%tky
              %action-payRental    = COND #( WHEN ls_order-PaymentStatus = payment_status-paid
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled )
             ) ).

  ENDMETHOD.

  METHOD payRental.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        UPDATE
          FIELDS ( PaymentStatus )
            WITH VALUE #( FOR ls_key IN lt_keys
                         ( %tky          = ls_key-%tky
                           PaymentStatus = payment_status-paid ) )
      FAILED failed
      REPORTED reported.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        ALL FIELDS WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_orders).

    et_result = VALUE #( FOR ls_order IN lt_orders
                        ( %tky   = ls_order-%tky
                          %param = ls_order ) ).

  ENDMETHOD.

  METHOD calculateRental.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Order
          FIELDS ( SpaceId RentBegDate RentEndDate )
          WITH CORRESPONDING #( lt_keys )
       RESULT DATA(lt_orders).

    DELETE lt_orders WHERE SpaceId IS INITIAL
                        OR RentBegDate IS INITIAL
                        OR RentEndDate IS INITIAL.

    CHECK lt_orders IS NOT INITIAL.

    LOOP AT lt_orders ASSIGNING FIELD-SYMBOL(<ls_order>).

      IF ( <ls_order>-RentEndDate - <ls_order>-RentBegDate ) > 0.
        SELECT SINGLE FROM zshch_sh_space_empty
                      FIELDS RentalDay WHERE SpaceId = @<ls_order>-SpaceId
                      INTO @DATA(lv_rental_per_day).
        SELECT SINGLE FROM zshch_i_renter
                      FIELDS Discount WHERE RenterUuid = @<ls_order>-RenterUuid
                      INTO @DATA(lv_discount).

        <ls_order>-RentalTotal = lv_rental_per_day * ( <ls_order>-RentEndDate - <ls_order>-RentBegDate ).
        <ls_order>-RentalDiscount = <ls_order>-RentalTotal * lv_discount / 100.
        <ls_order>-RentalFinal = <ls_order>-RentalTotal - <ls_order>-RentalDiscount.
        <ls_order>-CurrencyCode = 'BYN'.
      ELSE.
        CLEAR <ls_order>-RentalTotal.
        CLEAR <ls_order>-RentalDiscount.
        CLEAR <ls_order>-RentalFinal.
      ENDIF.

    ENDLOOP.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Order
          UPDATE FIELDS ( RentalTotal RentalDiscount RentalFinal CurrencyCode )
          WITH CORRESPONDING #( lt_orders )
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

  ENDMETHOD.

  METHOD calculateRentEndTime.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        FIELDS ( RentBegTime  )
        WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_orders).

    DELETE lt_orders WHERE RentBegTime IS INITIAL.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        UPDATE FIELDS ( RentEndTime )
          WITH VALUE #( FOR ls_order IN lt_orders
                       ( %tky         = ls_order-%tky
                         RentEndTime  = ls_order-RentBegTime
                         %control-RentEndTime = if_abap_behv=>mk-on ) )
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    reported = CORRESPONDING #( DEEP lt_reported ).

  ENDMETHOD.

  METHOD calculateRentOrderId.

    DATA: lv_number  TYPE cl_numberrange_runtime=>nr_number.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Order
          FIELDS ( RentOrderId )
          WITH CORRESPONDING #( lt_keys )
       RESULT DATA(lt_orders).

    DELETE lt_orders WHERE RentOrderId IS NOT INITIAL.

    CHECK lt_orders IS NOT INITIAL.

    LOOP AT lt_orders ASSIGNING FIELD-SYMBOL(<ls_order>).
      TRY.
          CALL METHOD cl_numberrange_runtime=>number_get
            EXPORTING
              nr_range_nr = '01'
              object      = 'ZSHCH_ORDE'
              quantity    = 00000000000000000001
            IMPORTING
              number      = lv_number.
          <ls_order>-RentOrderId = |{ lv_number ALPHA = OUT }|.
        CATCH cx_nr_object_not_found.
        CATCH cx_number_ranges.
      ENDTRY.
    ENDLOOP.

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Order
          UPDATE FIELDS ( RentOrderId )
          WITH CORRESPONDING #( lt_orders )
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

  ENDMETHOD.

  METHOD refreshRelatedTables.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Order
          ALL FIELDS WITH CORRESPONDING #( lt_keys )
       RESULT DATA(lt_orders).

    MODIFY ENTITIES OF zshch_i_renter IN LOCAL MODE
       ENTITY Renter
          EXECUTE increaseRentNumber
          FROM CORRESPONDING #( lt_orders )
    REPORTED DATA(lt_executed_reported).

*    LOOP AT lt_orders ASSIGNING FIELD-SYMBOL(<ls_order>).
*        UPDATE zshch_d_pspace_a SET occupation_status = '3' WHERE space_id = @<ls_order>-SpaceId.
*    ENDLOOP.

  ENDMETHOD.

  METHOD validateDates.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        FIELDS ( RentBegDate RentEndDate ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_orders).

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order BY \_Renter
        FROM CORRESPONDING #( lt_orders )
      LINK DATA(lt_order_renter_links).

    LOOP AT lt_orders ASSIGNING FIELD-SYMBOL(<ls_order>).
      APPEND VALUE #(  %tky        = <ls_order>-%tky
                       %state_area = 'VALIDATE_DATES' )
        TO reported-order.

      IF <ls_order>-RentEndDate < <ls_order>-RentBegDate.
        APPEND VALUE #( %tky = <ls_order>-%tky ) TO failed-order.
        APPEND VALUE #( %tky               = <ls_order>-%tky
                        %state_area        = 'VALIDATE_DATES'
                        %msg               = NEW zshch_cm_parking(
                                                 severity  = if_abap_behv_message=>severity-error
                                                 textid    = zshch_cm_parking=>date_interval
                                                 begindate = <ls_order>-RentBegDate
                                                 enddate   = <ls_order>-RentEndDate )
                        %path            = VALUE #( renter-%tky = lt_order_renter_links[ source-%tky = <ls_order>-%tky ]-target-%tky )
                        %element-RentBegDate = if_abap_behv=>mk-on
                        %element-RentEndDate   = if_abap_behv=>mk-on ) TO reported-order.

      ELSEIF <ls_order>-RentBegDate < cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( %tky                 = <ls_order>-%tky ) TO failed-order.
        APPEND VALUE #( %tky                 = <ls_order>-%tky
                        %state_area          = 'VALIDATE_DATES'
                        %msg                 = NEW zshch_cm_parking(
                                                   severity  = if_abap_behv_message=>severity-error
                                                   textid    = zshch_cm_parking=>begin_date_before_system_date
                                                   begindate = <ls_order>-RentBegDate )
                        %path                = VALUE #( renter-%tky = lt_order_renter_links[ source-%tky = <ls_order>-%tky ]-target-%tky )
                        %element-RentBegDate = if_abap_behv=>mk-on ) TO reported-order.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateSpaceAbailability.

    DATA lt_spaces TYPE SORTED TABLE OF zshch_d_pspace_a WITH UNIQUE KEY space_id.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        FIELDS ( SpaceId ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_orders).

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order BY \_Renter
        FROM CORRESPONDING #( lt_orders )
      LINK DATA(lt_order_renter_links).

    lt_spaces = CORRESPONDING #( lt_orders DISCARDING DUPLICATES MAPPING space_id = SpaceId EXCEPT * ).
    DELETE lt_spaces WHERE space_id IS INITIAL.

    IF lt_spaces IS NOT INITIAL.
      SELECT FROM zshch_sh_space_empty FIELDS SpaceId
          FOR ALL ENTRIES IN @lt_spaces
          WHERE SpaceId = @lt_spaces-space_id
          INTO TABLE @DATA(lt_spaces_matched).
    ENDIF.

    LOOP AT lt_orders ASSIGNING FIELD-SYMBOL(<ls_order>).
      APPEND VALUE #(  %tky               = <ls_order>-%tky
                       %state_area        = 'VALIDATE_SPACE' )
        TO reported-order.

      IF <ls_order>-SpaceId IS INITIAL OR NOT line_exists( lt_spaces_matched[ SpaceId = <ls_order>-SpaceId ] ).
        APPEND VALUE #( %tky = <ls_order>-%tky ) TO failed-order.

        APPEND VALUE #( %tky             = <ls_order>-%tky
                        %state_area      = 'VALIDATE_SPACE'
                        %msg             = NEW zshch_cm_parking(
                                               severity = if_abap_behv_message=>severity-error
                                               textid   = zshch_cm_parking=>space_unavailable
                                               spaceid = <ls_order>-SpaceId )
                        %path            = VALUE #( renter-%tky = lt_order_renter_links[ source-%tky = <ls_order>-%tky ]-target-%tky )
                        %element-SpaceId = if_abap_behv=>mk-on )
          TO reported-order.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateStatus.

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order
        FIELDS ( PaymentStatus ) WITH CORRESPONDING #( lt_keys )
      RESULT DATA(lt_orders).

    READ ENTITIES OF zshch_i_renter IN LOCAL MODE
      ENTITY Order BY \_Renter
        FROM CORRESPONDING #( lt_orders )
      LINK DATA(lt_order_renter_links).


    SELECT FROM zshch_i_pay_stat FIELDS StatusId
        INTO TABLE @DATA(lt_statuses).


    LOOP AT lt_orders ASSIGNING FIELD-SYMBOL(<ls_order>).
      APPEND VALUE #(  %tky               = <ls_order>-%tky
                       %state_area        = 'VALIDATE_STATUS' )
        TO reported-order.

      IF <ls_order>-PaymentStatus IS INITIAL OR NOT line_exists( lt_statuses[ StatusId = <ls_order>-PaymentStatus ] ).
        APPEND VALUE #( %tky = <ls_order>-%tky ) TO failed-order.

        APPEND VALUE #( %tky                   = <ls_order>-%tky
                        %state_area            = 'VALIDATE_STATUS'
                        %msg                   = NEW zshch_cm_parking(
                                                     severity = if_abap_behv_message=>severity-error
                                                     textid   = zshch_cm_parking=>status_unknown
                                                     statusid = <ls_order>-PaymentStatus )
                        %path                  = VALUE #( renter-%tky = lt_order_renter_links[ source-%tky = <ls_order>-%tky ]-target-%tky )
                        %element-PaymentStatus = if_abap_behv=>mk-on )
          TO reported-order.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
