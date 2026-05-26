CLASS zcl_smb_generate_data_ventas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_smb_generate_data_ventas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_ventas   TYPE TABLE OF zsmb_ventas.
    DATA lv_timestamp TYPE timestampl.

    " 1. Limpiar datos antiguos
    DELETE FROM zsmb_ventas.

    TRY.
        DATA(lv_uuid1) = cl_system_uuid=>create_uuid_x16_static( ).
        DATA(lv_uuid2) = cl_system_uuid=>create_uuid_x16_static( ).
        DATA(lv_uuid3) = cl_system_uuid=>create_uuid_x16_static( ).
        DATA(lv_uuid4) = cl_system_uuid=>create_uuid_x16_static( ).
        DATA(lv_uuid5) = cl_system_uuid=>create_uuid_x16_static( ).
        DATA(lv_uuid6) = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error INTO DATA(lx_error).
        out->write( lx_error->get_text( ) ).
        RETURN.
    ENDTRY.

    GET TIME STAMP FIELD lv_timestamp.
    DATA(lv_user)      = cl_abap_context_info=>get_user_technical_name( ).

    " 2. Preparar datos de prueba
    lt_ventas = VALUE #(
      ( mandt = sy-mandt venta_uuid = lv_uuid1 idventa = 'V001' idcliente = '0024100002' idproducto = 'CM-FL-V00' idvendedor = lv_user
        fecha = '20260401' tipoventa = 'P' status = 'A' cantidad = '10' unidad = 'ST' importe = '1500.00' moneda = 'EUR'
        created_by = lv_user created_at = lv_timestamp last_changed_by = lv_user last_changed_at = lv_timestamp local_last_changed_at = lv_timestamp
        zzprioridad = '1' )
      ( mandt = sy-mandt venta_uuid = lv_uuid2 idventa = 'V002' idcliente = '0024100002' idproducto = 'EWMS4-PAL01' idvendedor = lv_user
        fecha = '20260402' tipoventa = 'P' status = 'P' cantidad = '5'  unidad = 'ST' importe = '750.50'  moneda = 'EUR'
        created_by = lv_user created_at = lv_timestamp last_changed_by = lv_user last_changed_at = lv_timestamp local_last_changed_at = lv_timestamp
        zzprioridad = '2' )
      ( mandt = sy-mandt venta_uuid = lv_uuid3 idventa = 'V003' idcliente = '0024100004' idproducto = 'FGIPD001' idvendedor = lv_user
        fecha = '20260405' tipoventa = 'P' status = 'C' cantidad = '2'  unidad = 'ST' importe = '300.00'  moneda = 'EUR'
        created_by = lv_user created_at = lv_timestamp last_changed_by = lv_user last_changed_at = lv_timestamp local_last_changed_at = lv_timestamp
        zzprioridad = '3' )
      ( mandt = sy-mandt venta_uuid = lv_uuid4 idventa = 'V004' idcliente = '0024100004' idproducto = 'NL001' idvendedor = 'R901848'
        fecha = '20260410' tipoventa = 'O' status = 'A' cantidad = '20' unidad = 'ST' importe = '4000.00' moneda = 'USD'
        created_by = lv_user created_at = lv_timestamp last_changed_by = lv_user last_changed_at = lv_timestamp local_last_changed_at = lv_timestamp
        zzprioridad = '1' )
      ( mandt = sy-mandt venta_uuid = lv_uuid5 idventa = 'V005' idcliente = '0024100007' idproducto = 'SF-FL-TIRE-CUSH' idvendedor = 'R901848'
        fecha = '20260412' tipoventa = 'O' status = 'P' cantidad = '1'  unidad = 'ST' importe = '155.00'  moneda = 'USD'
        created_by = lv_user created_at = lv_timestamp last_changed_by = lv_user last_changed_at = lv_timestamp local_last_changed_at = lv_timestamp
        zzprioridad = '2' )
      ( mandt = sy-mandt venta_uuid = lv_uuid6 idventa = 'V006' idcliente = '0024100007' idproducto = 'SG-CFP' idvendedor = 'R901848'
        fecha = '20260415' tipoventa = 'O' status = 'C' cantidad = '12' unidad = 'EA' importe = '1800.00' moneda = 'USD'
        created_by = lv_user created_at = lv_timestamp last_changed_by = lv_user last_changed_at = lv_timestamp local_last_changed_at = lv_timestamp
        zzprioridad = '3' )
    ).

    " 3. Insertar en la tabla
    INSERT zsmb_ventas FROM TABLE @lt_ventas.

    IF sy-subrc = 0.
      out->write( '¡Éxito! Los datos de ventas han sido cargados.' ).
    ELSE.
      out->write( 'Error al insertar los datos.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
