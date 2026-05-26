extend view entity ZSMB_C_ANALISISVENTAS with
{
  @EndUserText.label: 'Prioridad'
  @ObjectModel.text.element: ['ZZPrioridadTexto']
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSMB_I_PRIORIDADTEXT', element: 'ZZPrioridad' } }]
  @UI.lineItem:       [{ position: 80, importance: #HIGH, label: 'Prioridad' }]
  @UI.identification: [{ position: 80 }]
  @UI.fieldGroup:     [{ qualifier: 'DatosBasicos', position: 60, label: 'Prioridad' }]
  ZSMB_I_ANALISISVENTAS.ZZPrioridad,

  @UI.hidden: true
  ZSMB_I_ANALISISVENTAS.ZZPrioridadTexto

}
