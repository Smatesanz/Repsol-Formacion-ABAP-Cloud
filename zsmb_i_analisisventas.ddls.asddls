@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DT1 Query APP - CDS Composite Ventas'
@VDM.viewType: #COMPOSITE

define view entity ZSMB_I_ANALISISVENTAS
  as select from ZSMB_I_VENTAS
  association [0..*] to ZSMB_I_TIPOVENTATEXT    as _TipoVentaText on  $projection.TipoVenta   = _TipoVentaText.TipoVenta
                                                                  and _TipoVentaText.Language = $session.system_language
  association [1..1] to ZSMBTF_I_ANALISISVENTAS as _TFAnalisis    on  $projection.VentaUUID = _TFAnalisis.VentaUUID
{
  key VentaUUID,
      IDVenta,
      IDCliente,
      _Cliente.CustomerName                                                                              as NombreCliente,
      IDProducto,
      _Producto._Text[ 1: Language = $session.system_language ].ProductName                              as NombreProducto,

      IDVendedor,
      FechaVenta,
      dats_days_between( FechaVenta, $session.system_date )                                              as AntiguedadDias,
      @ObjectModel.text.association: '_TipoVentaText'
      TipoVenta,
      _TipoVentaText[ 1: Language = $session.system_language ].TipoVentaTexto                            as TipoVentaTexto,
      EstadoVenta,
      case EstadoVenta
            when 'A' then 'Aprobado'
            when 'P' then 'Pendiente'
            when 'C' then 'Cancelado'
            else 'Desconocido'
          end                                                                                            as EstadoVentaTexto,
      case EstadoVenta
        when 'A' then 3 -- Verde (Aprobado)
        when 'P' then 2 -- Amarillo (Pendiente)
        when 'C' then 1 -- Rojo (Cancelado)
        else 0          -- Sin Color (Gris)
      end                                                                                                as EstadoVentaCriticidad,

      Cantidad,
      Unidad,
      Importe,
      @Semantics.amount.currencyCode: 'Moneda'
      cast( ( cast( Importe as abap.dec(15,2) ) * cast( '0.21' as abap.dec(3,2) ) ) as abap.curr(15,2) ) as ImporteIVA,
      Moneda,
      _TFAnalisis.PorcentajeTotal                                                                        as PorcentajeTotal,
      _TFAnalisis.RankingVentas                                                                          as RankingVentas,


      CreadoPor,
      CreadoEl,
      UltimoCambioPor,
      UltimoCambioEl,
      UltimoCambioLocalEl,

      /* Exponer Asociaciones */
      _Cliente,
      _Producto,
      _TipoVentaText
}
