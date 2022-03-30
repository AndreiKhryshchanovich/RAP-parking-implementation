FUNCTION zshch_update_parking.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_METHOD_NAME) TYPE  SWF_METNAM
*"     VALUE(IV_TABNAME) TYPE  TABNAME OPTIONAL
*"     VALUE(IS_KEY) TYPE  STRING OPTIONAL
*"     VALUE(IS_PARAM) TYPE  STRING OPTIONAL
*"     VALUE(IS_ENTRY_STR) TYPE  STRING OPTIONAL
*"     VALUE(IS_CONTACT) TYPE  ZSHCH_D_CONTACT OPTIONAL
*"     VALUE(IS_RENTER) TYPE  ZSHCH_D_RENTER OPTIONAL
*"     VALUE(IS_RENTER_T) TYPE  ZSHCH_D_RENTER_T OPTIONAL
*"     VALUE(IS_OWNER) TYPE  ZSHCH_D_OWNER OPTIONAL
*"     VALUE(IS_OWNER_T) TYPE  ZSHCH_D_OWNER_T OPTIONAL
*"     VALUE(IS_ORDER) TYPE  ZSHCH_D_RORDER OPTIONAL
*"     VALUE(IS_SPACE) TYPE  ZSHCH_D_PSPACE OPTIONAL
*"     VALUE(IS_SPACE_TYPE) TYPE  ZSHCH_D_STYPE OPTIONAL
*"     VALUE(IS_PARKING_TYPE) TYPE  ZSHCH_D_PTYPE OPTIONAL
*"     VALUE(IT_SPACE_TYPES) TYPE  ZSHCH_T_STYPE OPTIONAL
*"     VALUE(IT_RENTERS) TYPE  ZSHCH_T_RENTER OPTIONAL
*"     VALUE(IT_RENTERS_T) TYPE  ZSHCH_T_RENTER_T OPTIONAL
*"     VALUE(IT_CONTACTS) TYPE  ZSHCH_T_CONTACT OPTIONAL
*"     VALUE(IT_OWNERS) TYPE  ZSHCH_T_OWNER OPTIONAL
*"     VALUE(IT_OWNERS_T) TYPE  ZSHCH_T_OWNER_T OPTIONAL
*"     VALUE(IT_SPACES) TYPE  ZSHCH_T_PSPACE OPTIONAL
*"  EXCEPTIONS
*"      ALREADY_EXIST
*"      NOT_EXIST
*"      UNKNOWN_EXCEPTION
*"----------------------------------------------------------------------

  TRY .

      CASE iv_method_name.
        WHEN zshch_if_parking_c=>gc_method_name-update.
          UPDATE (iv_tabname) SET (is_param) WHERE (is_key).
        WHEN zshch_if_parking_c=>gc_method_name-delete.
          DELETE FROM (iv_tabname) WHERE (is_key).
        WHEN zshch_if_parking_c=>gc_method_name-insert.
          CASE iv_tabname.
            WHEN zshch_if_parking_c=>gc_db_tab-contact.
              INSERT INTO (iv_tabname) VALUES is_contact.
            WHEN zshch_if_parking_c=>gc_db_tab-renter.
              INSERT INTO (iv_tabname) VALUES is_renter.
            WHEN zshch_if_parking_c=>gc_db_tab-renter_t.
              INSERT INTO (iv_tabname) VALUES is_renter_t.
            WHEN zshch_if_parking_c=>gc_db_tab-owner.
              INSERT INTO (iv_tabname) VALUES is_owner.
            WHEN zshch_if_parking_c=>gc_db_tab-owner_t.
              INSERT INTO (iv_tabname) VALUES is_owner_t.
            WHEN zshch_if_parking_c=>gc_db_tab-rent_order.
              INSERT INTO (iv_tabname) VALUES is_order.
            WHEN zshch_if_parking_c=>gc_db_tab-park_space.
              INSERT INTO (iv_tabname) VALUES is_space.
            WHEN zshch_if_parking_c=>gc_db_tab-space_type.
              INSERT INTO (iv_tabname) VALUES is_space_type.
            WHEN zshch_if_parking_c=>gc_db_tab-park_type.
              INSERT INTO (iv_tabname) VALUES is_parking_type.
          ENDCASE.
        WHEN zshch_if_parking_c=>gc_method_name-modify.
          CASE iv_tabname.
            WHEN zshch_if_parking_c=>gc_db_tab-contact.
              MODIFY (iv_tabname) FROM is_contact.
            WHEN zshch_if_parking_c=>gc_db_tab-renter.
              MODIFY (iv_tabname) FROM is_renter.
            WHEN zshch_if_parking_c=>gc_db_tab-renter_t.
              MODIFY (iv_tabname) FROM is_renter_t.
            WHEN zshch_if_parking_c=>gc_db_tab-owner.
              MODIFY (iv_tabname) FROM is_owner.
            WHEN zshch_if_parking_c=>gc_db_tab-owner_t.
              MODIFY (iv_tabname) FROM is_owner_t.
            WHEN zshch_if_parking_c=>gc_db_tab-rent_order.
              MODIFY (iv_tabname) FROM is_order.
            WHEN zshch_if_parking_c=>gc_db_tab-park_space.
              MODIFY (iv_tabname) FROM is_space.
            WHEN zshch_if_parking_c=>gc_db_tab-space_type.
              MODIFY (iv_tabname) FROM is_space_type.
            WHEN zshch_if_parking_c=>gc_db_tab-park_type.
              MODIFY (iv_tabname) FROM is_parking_type.
          ENDCASE.
        WHEN zshch_if_parking_c=>gc_method_name-modify_table.
          CASE iv_tabname.
            WHEN zshch_if_parking_c=>gc_db_tab-contact.
              MODIFY (iv_tabname) FROM TABLE it_contacts.
            WHEN zshch_if_parking_c=>gc_db_tab-renter.
              MODIFY (iv_tabname) FROM TABLE it_renters.
            WHEN zshch_if_parking_c=>gc_db_tab-renter_t.
              MODIFY (iv_tabname) FROM TABLE it_renters_t.
            WHEN zshch_if_parking_c=>gc_db_tab-owner.
              MODIFY (iv_tabname) FROM TABLE it_owners.
            WHEN zshch_if_parking_c=>gc_db_tab-owner_t.
              MODIFY (iv_tabname) FROM TABLE it_owners_t.
            WHEN zshch_if_parking_c=>gc_db_tab-space_type.
              MODIFY (iv_tabname) FROM TABLE it_space_types.
            WHEN zshch_if_parking_c=>gc_db_tab-park_space.
              MODIFY (iv_tabname) FROM TABLE it_spaces.
          ENDCASE.
      ENDCASE.

      IF sy-subrc <> 0.
        IF sy-subrc = 4.
          CASE iv_method_name.
            WHEN zshch_if_parking_c=>gc_method_name-update.
              RAISE not_exist.
            WHEN zshch_if_parking_c=>gc_method_name-delete.
              RAISE not_exist.
            WHEN zshch_if_parking_c=>gc_method_name-insert.
              RAISE already_exist.
          ENDCASE.
        ELSE.
          RAISE unknown_exception.
        ENDIF.
      ENDIF.

    CATCH cx_sy_dynamic_osql_error.
      MESSAGE a038(zshch_parking).
  ENDTRY.

ENDFUNCTION.
