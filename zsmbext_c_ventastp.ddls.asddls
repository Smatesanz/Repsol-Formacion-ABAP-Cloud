extend view entity ZSMB_C_VENTASTP with
{
  @EndUserText.label: 'Prioridad'
  @UI.lineItem:       [{ position: 90, importance: #HIGH, label: 'Prioridad' }]
  @UI.fieldGroup:     [{ qualifier: 'DatosBasicos', position: 80, label: 'Prioridad' }]
  ZSMB_R_VENTASTP.ZZPrioridad

}
