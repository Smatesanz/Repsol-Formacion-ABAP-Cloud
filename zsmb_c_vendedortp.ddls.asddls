@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'DT2 Transactional APP - CDS Projection'
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZSMB_C_VENDEDORTP
  provider contract transactional_query
  as projection on ZSMB_R_VENDEDORTP
{
  key IDVendedor,
      @Search.defaultSearchElement: true  
      Nombre,
      Email,
      Activo
}
