CLASS zcl_smb_amdp_analisisventas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS get_analisis_ventas FOR TABLE FUNCTION zsmbtf_i_analisisventas.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_smb_amdp_analisisventas IMPLEMENTATION.

  METHOD get_analisis_ventas
      BY DATABASE FUNCTION FOR HDB
      LANGUAGE SQLSCRIPT
      USING zsmb_i_ventas.

    RETURN select
    session_context('CLIENT') AS client,
    VentaUUID,
    IDVenta,
    IDCliente,
    IDProducto,
    Importe,
    Moneda,

    -- 1. Porcentaje sobre el total de lo que se esta listando
    round( (Importe * 100) / sum(Importe) OVER(), 2 ) AS PorcentajeTotal,

    -- 2. Ranking de las ventas mas caras (de mayor a menor)
    RANK() OVER( ORDER BY Importe desc ) AS RankingVentas

    FROM zsmb_i_ventas
    WHERE mandt = session_context('CLIENT');

  ENDMETHOD.

ENDCLASS.
