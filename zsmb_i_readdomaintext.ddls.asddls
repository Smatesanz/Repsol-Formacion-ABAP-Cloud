@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SE116245 SMB - CDS Text Domains'
@VDM.viewType: #BASIC

define view entity ZSMB_I_READDOMAINTEXT
  with parameters
    p_domain_name : sxco_ad_object_name
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: $parameters.p_domain_name )
  association [0..1] to DDCDS_CUSTOMER_DOMAIN_VALUE_T as _Text on  $projection.DomainName    = _Text.domain_name
                                                               and $projection.ValuePosition = _Text.value_position
                                                               and _Text.language             = $session.system_language
{
  key domain_name                                            as DomainName,
  key value_position                                         as ValuePosition,
      @ObjectModel.text.element: ['Texto']
      value_low                                              as Value,
      @Semantics.text: true
      _Text( p_domain_name: $parameters.p_domain_name ).text as Texto,

      _Text
}
