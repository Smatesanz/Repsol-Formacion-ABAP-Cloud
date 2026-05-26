@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'DT2 Transactional APP - CDS Root'

define root view entity ZSMB_R_VENTASTP
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
      
      /* Exponer Asociaciones */
      _Cliente,
      _Producto    
}
