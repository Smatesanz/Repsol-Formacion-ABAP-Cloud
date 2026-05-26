@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'DT2 Transactional APP - CDS Root'

define root view entity ZSMB_R_VENDEDORTP
  as select from zsmb_vendedor
{
  key idvendedor as IDVendedor,
      nombre     as Nombre,
      email      as Email,
      activo     as Activo
}
