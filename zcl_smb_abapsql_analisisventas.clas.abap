CLASS zcl_smb_abapsql_analisisventas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_smb_abapsql_analisisventas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM zsmb_i_analisisventas
      FIELDS IDVenta,
             NombreCliente,
             IDProducto,
             NombreProducto,
             Importe,
             ImporteIVA,
             Moneda,
             CASE
               WHEN Importe > 1000 THEN 'VIP'
               WHEN Importe > 500  THEN 'Premium'
               ELSE 'Estándar'
             END AS SegmentoVenta,
             TipoVentaTexto,
             EstadoVentaTexto,
             division( Importe * 100, SUM( Importe ) OVER( ), 2 ) AS PorcentajeSobreTotal
      WHERE EstadoVenta = 'P'
      INTO TABLE @DATA(lt_analisisventas).

    IF sy-subrc = 0.
      out->write( lt_analisisventas ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
