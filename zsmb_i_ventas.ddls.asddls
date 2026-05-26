@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DT1 Query APP - CDS Basic Ventas'
@VDM.viewType: #BASIC

define view entity ZSMB_I_VENTAS
  as select from zsmb_ventas
  association [1..1] to I_Customer as _Cliente  on $projection.IDCliente = _Cliente.Customer
  association [1..1] to I_Product  as _Producto on $projection.IDProducto = _Producto.Product
{
  key venta_uuid            as VentaUUID,
      idventa               as IDVenta,
      idcliente             as IDCliente,
      idproducto            as IDProducto,

      idvendedor            as IDVendedor,
      fecha                 as FechaVenta,
      tipoventa             as TipoVenta,
      status                as EstadoVenta,

      cantidad              as Cantidad,
      unidad                as Unidad,
      importe               as Importe,
      moneda                as Moneda,

      created_by            as CreadoPor,
      created_at            as CreadoEl,
      last_changed_by       as UltimoCambioPor,
      last_changed_at       as UltimoCambioEl,
      local_last_changed_at as UltimoCambioLocalEl,
      
      _Cliente,
      _Producto
}
