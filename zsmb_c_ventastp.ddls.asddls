@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'DT2 Transactional APP - CDS Projection'
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZSMB_C_VENTASTP
  provider contract transactional_query
  as projection on ZSMB_R_VENTASTP
{
  key VentaUUID,
      IDVenta,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Customer', element: 'Customer' } }]
      IDCliente,
      IDProducto,

      IDVendedor,
      FechaVenta,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSMB_I_TIPOVENTATEXT', element: 'TipoVenta' } }]      
      TipoVenta,
      EstadoVenta,

      Cantidad,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_UnitOfMeasure', element: 'UnitOfMeasure' } }]
      Unidad,
      Importe,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]      
      Moneda,

      CreadoPor,
      CreadoEl,
      UltimoCambioPor,
      UltimoCambioEl,
      UltimoCambioLocalEl,
      
      _Cliente,
      _Producto      
}
