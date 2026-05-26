CLASS lhc_Ventas DEFINITION
  INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_global_authorizations
      FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations
      FOR Ventas RESULT result.
    METHODS set_defaults
      FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Ventas~set_defaults.
    METHODS validate_cliente
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR Ventas~validate_cliente.
    METHODS aprobar_venta
      FOR MODIFY
      IMPORTING keys   FOR ACTION Ventas~aprobar_venta
      RESULT    result.
ENDCLASS.

CLASS lhc_Ventas IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD set_defaults.
    MODIFY ENTITIES OF zsmb_r_ventastp IN LOCAL MODE
      ENTITY Ventas UPDATE FIELDS ( Unidad Moneda EstadoVenta )
      WITH VALUE #( FOR key IN keys (
        %tky                   = key-%tky
        Unidad                 = 'ST'
        Moneda                 = 'EUR'
        EstadoVenta            = 'P'
        %control-Unidad        = if_abap_behv=>mk-on
        %control-Moneda        = if_abap_behv=>mk-on
        %control-EstadoVenta   = if_abap_behv=>mk-on
      ) ).
  ENDMETHOD.

  METHOD validate_cliente.
    DATA lv_exists TYPE abap_bool.

    READ ENTITIES OF zsmb_r_ventastp IN LOCAL MODE
      ENTITY Ventas FIELDS ( IDCliente )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_ventas).

    LOOP AT lt_ventas INTO DATA(lv_venta).

      SELECT SINGLE @abap_true FROM I_Customer
        WHERE Customer = @lv_venta-IDCliente
        INTO @lv_exists.

      DATA(lv_msg) = COND #(
        WHEN lv_venta-IDCliente IS INITIAL
          THEN 'El cliente es obligatorio'
        WHEN lv_exists = abap_false
          THEN 'El cliente no existe'
      ).
      IF lv_msg IS NOT INITIAL.
        APPEND VALUE #(
          %tky        = lv_venta-%tky
          %state_area = 'VALIDATE_CLIENTE'
          %msg        = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = lv_msg )
        ) TO reported-ventas.
        APPEND VALUE #( %tky = lv_venta-%tky ) TO failed-ventas.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD aprobar_venta.
    MODIFY ENTITIES OF zsmb_r_ventastp IN LOCAL MODE
      ENTITY Ventas UPDATE FIELDS ( EstadoVenta )
      WITH VALUE #( FOR key IN keys (
        %tky                 = key-%tky
        EstadoVenta          = 'A'
        %control-EstadoVenta = if_abap_behv=>mk-on
      ) ).

    READ ENTITIES OF zsmb_r_ventastp IN LOCAL MODE
      ENTITY Ventas ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_ventas).

    result = VALUE #( FOR lv_venta IN lt_ventas (
      %tky   = lv_venta-%tky
      %param = lv_venta
    ) ).
  ENDMETHOD.

ENDCLASS.
