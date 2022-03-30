FUNCTION zshch_delete_owner .
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_OWNID) TYPE  ZSHCH_OWNER_ID
*"----------------------------------------------------------------------
  DATA: ls_name TYPE zshch_s_full_name.

  IF iv_ownid IS INITIAL.
    MESSAGE 'Please fill required field'(i03) TYPE 'I'.
  ELSE.
    SELECT SINGLE first_name, last_name
       FROM zshch_d_owner_t
       WHERE owner_id = @iv_ownid AND langu = @sy-langu
       INTO @ls_name.

    SELECT SINGLE contact_id
      FROM zshch_d_owner
      WHERE owner_id = @iv_ownid
      INTO @DATA(lv_contact_id).

    SELECT SINGLE COUNT(*)
      FROM zshch_d_pspace
      WHERE owner_id = @iv_ownid
      INTO @DATA(lv_count).

    IF lv_count > 0.
      MESSAGE |{ 'Owner'(i01) } { ls_name-first_name  } { ls_name-last_name } { 'cannot be deleted, because he owns some parking space!'(e01) }| TYPE 'E'.
    ELSE.
      DELETE FROM zshch_d_owner_t WHERE owner_id = @iv_ownid.
      DELETE FROM zshch_d_owner WHERE owner_id = @iv_ownid.
      DELETE FROM zshch_d_contact WHERE contact_id = @lv_contact_id.

      IF sy-subrc = 0.
        MESSAGE |{ 'Owner'(i01) } { ls_name-first_name  } { ls_name-last_name } { 'was successfully deleted'(i02) }.| TYPE 'I'.
      ELSE.
        MESSAGE 'Some issues with deleting owner.'(w01) TYPE 'W'.
      ENDIF.
    ENDIF.
  ENDIF.
ENDFUNCTION.
