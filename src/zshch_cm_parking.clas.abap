CLASS zshch_cm_parking DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF date_interval,
        msgid TYPE symsgid VALUE 'ZSHCH_CM_PARKING',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'BEGINDATE',
        attr2 TYPE scx_attrname VALUE 'ENDDATE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF date_interval .
    CONSTANTS:
      BEGIN OF begin_date_before_system_date,
        msgid TYPE symsgid VALUE 'ZSHCH_CM_PARKING',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'BEGINDATE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF begin_date_before_system_date .
    CONSTANTS:
      BEGIN OF status_unknown,
        msgid TYPE symsgid VALUE 'ZSHCH_CM_PARKING',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'STATUSID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF status_unknown .
    CONSTANTS:
      BEGIN OF space_unavailable,
        msgid TYPE symsgid VALUE 'ZSHCH_CM_PARKING',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'SPACEID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF space_unavailable .
    CONSTANTS:
      BEGIN OF passport_not_filled,
        msgid TYPE symsgid VALUE 'ZSHCH_CM_PARKING',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF passport_not_filled .
    CONSTANTS:
      BEGIN OF phone_number_not_filled,
        msgid TYPE symsgid VALUE 'ZSHCH_CM_PARKING',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF phone_number_not_filled .
    CONSTANTS:
      BEGIN OF name_not_filled,
        msgid TYPE symsgid VALUE 'ZSHCH_CM_PARKING',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF name_not_filled .


    METHODS constructor
      IMPORTING
        severity  TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid    LIKE if_t100_message=>t100key OPTIONAL
        previous  TYPE REF TO cx_root OPTIONAL
        begindate TYPE zshch_d_rorder_a-rent_beg_date OPTIONAL
        enddate   TYPE zshch_d_rorder_a-rent_end_date OPTIONAL
        statusid  TYPE zshch_d_rorder_a-payment_status OPTIONAL
        spaceid   TYPE zshch_d_rorder_a-space_id OPTIONAL.

    DATA begindate TYPE zshch_d_rorder_a-rent_beg_date READ-ONLY.
    DATA enddate TYPE zshch_d_rorder_a-rent_end_date READ-ONLY.
    DATA statusid TYPE string READ-ONLY.
    DATA spaceid TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zshch_cm_parking IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->begindate = begindate.
    me->enddate = enddate.
    me->statusid = |{ statusid ALPHA = OUT }|.
    me->spaceid = |{ spaceid ALPHA = OUT }|.

ENDMETHOD.

ENDCLASS.
