@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DT1 Query APP - CDS Text Prioridad'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT

define view entity ZSMB_I_PRIORIDADTEXT
  as select from I_Language
{
      @ObjectModel.text.element: [ 'ZZPrioridadTexto' ]
  key cast( '1' as abap.char(1) )     as ZZPrioridad,
      cast( 'Alta' as abap.char(10) ) as ZZPrioridadTexto
}
where
  Language = $session.system_language

union all select from I_Language
{
  key cast( '2' as abap.char(1) )      as ZZPrioridad,
      cast( 'Media' as abap.char(10) ) as ZZPrioridadTexto
}
where
  Language = $session.system_language

union all select from I_Language
{
  key cast( '3' as abap.char(1) )     as ZZPrioridad,
      cast( 'Baja' as abap.char(10) ) as ZZPrioridadTexto
}
where
  Language = $session.system_language
