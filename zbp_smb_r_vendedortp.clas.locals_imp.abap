CLASS lhc_Vendedor DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CLASS-DATA mt_create TYPE TABLE OF zsmb_vendedor.
    CLASS-DATA mt_update TYPE TABLE OF zsmb_vendedor.
    CLASS-DATA mt_delete TYPE TABLE OF zsmb_vendedor.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Vendedor RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Vendedor.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Vendedor.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Vendedor.

    METHODS read FOR READ
      IMPORTING keys FOR READ Vendedor RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Vendedor.

ENDCLASS.

CLASS lhc_Vendedor IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
    LOOP AT entities INTO DATA(lv_entity).
      APPEND VALUE zsmb_vendedor(
        idvendedor = lv_entity-IDVendedor
        nombre     = lv_entity-Nombre
        email      = lv_entity-Email
        activo     = lv_entity-Activo
      ) TO mt_create.
      APPEND VALUE #(
        %cid = lv_entity-%cid
        %key = lv_entity-%key
      ) TO mapped-vendedor.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
    LOOP AT entities INTO DATA(lv_entity).
      APPEND VALUE zsmb_vendedor(
        idvendedor = lv_entity-IDVendedor
        nombre     = lv_entity-Nombre
        email      = lv_entity-Email
        activo     = lv_entity-Activo
      ) TO mt_update.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
    LOOP AT keys INTO DATA(lv_key).
      APPEND VALUE zsmb_vendedor(
        idvendedor = lv_key-IDVendedor
      ) TO mt_delete.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.
    LOOP AT keys INTO DATA(lv_key).
      SELECT SINGLE FROM zsmb_vendedor
        FIELDS idvendedor, nombre, email, activo
        WHERE idvendedor = @lv_key-IDVendedor
        INTO @DATA(lv_vendedor).
      IF sy-subrc = 0.
        APPEND VALUE #(
          %key       = lv_key-%key
          Nombre     = lv_vendedor-nombre
          Email      = lv_vendedor-email
          Activo     = lv_vendedor-activo
        ) TO result.
      ELSE.
        APPEND VALUE #( %key = lv_key-%key ) TO failed-vendedor.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZSMB_R_VENDEDORTP DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PUBLIC SECTION.

  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZSMB_R_VENDEDORTP IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    INSERT zsmb_vendedor FROM TABLE @lhc_vendedor=>mt_create.
    MODIFY zsmb_vendedor FROM TABLE @lhc_vendedor=>mt_update.
    DELETE zsmb_vendedor FROM TABLE @lhc_vendedor=>mt_delete.
  ENDMETHOD.

  METHOD cleanup.
    CLEAR lhc_vendedor=>mt_create.
    CLEAR lhc_vendedor=>mt_update.
    CLEAR lhc_vendedor=>mt_delete.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
