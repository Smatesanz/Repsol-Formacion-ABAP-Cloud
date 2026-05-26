@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'DT1 Query APP - CDS Consumption Ventas'
@Metadata.allowExtensions: true
@Search.searchable: true
@VDM.viewType: #CONSUMPTION

define view entity ZSMB_C_ANALISISVENTAS
  as select from ZSMB_I_ANALISISVENTAS
{
  key VentaUUID,
      IDVenta,
      @ObjectModel.text.element: ['NombreCliente']
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Customer', element: 'Customer' } }]
      IDCliente,
      NombreCliente,
      @ObjectModel.text.element: ['NombreProducto']
      IDProducto,
      NombreProducto,

      IDVendedor,
      FechaVenta,
      AntiguedadDias,
      @ObjectModel.text.element: ['TipoVentaTexto']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSMB_I_TIPOVENTATEXT', element: 'TipoVenta' } }]
      TipoVenta,
      TipoVentaTexto,
      @ObjectModel.text.element: ['EstadoVentaTexto']
      EstadoVenta,
      EstadoVentaTexto,
      EstadoVentaCriticidad,

      Cantidad,
      Unidad,
      Importe,
      ImporteIVA,
      Moneda,
      PorcentajeTotal,
      RankingVentas,

      CreadoPor,
      CreadoEl,
      UltimoCambioPor,
      UltimoCambioEl,
      UltimoCambioLocalEl     
}
