@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DT1 Query APP - CDS Basic TipoVentaText'
@ObjectModel.dataCategory: #TEXT
@VDM.viewType: #BASIC

define view entity ZSMB_I_TIPOVENTATEXT
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZSMB_DOM_TIPOVENTA' )
{
  key domain_name    as DomainName,
  key value_position as ValuePosition,
      @Semantics.language: true
  key language       as Language,
  key value_low      as TipoVenta,
      @Semantics.text: true
      text           as TipoVentaTexto
}
where
  language = $session.system_language
