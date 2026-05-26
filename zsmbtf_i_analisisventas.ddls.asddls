@EndUserText.label: 'DT1 Query APP - CDS TableFunction Ventas'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE

define table function ZSMBTF_I_ANALISISVENTAS
returns
{
  client          : abap.clnt;
  VentaUUID       : sysuuid_x16; 
  IDVenta         : abap.char(10);
  IDCliente       : abap.char(10);
  IDProducto      : abap.char(20);
  @Semantics.amount.currencyCode: 'Moneda'
  Importe         : abap.curr(15,2);
  Moneda          : abap.cuky;

  /* Campos calculados por BBDD HANA:  */
  PorcentajeTotal : abap.dec(5,2);
  RankingVentas   : abap.int4;

}
implemented by method
  zcl_smb_amdp_analisisventas=>get_analisis_ventas;
