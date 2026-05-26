extend view entity ZSMB_I_ANALISISVENTAS with
association [1..1] to ZSMB_I_PRIORIDADTEXT as _ZZPrioridadText on $projection.ZZPrioridad = _ZZPrioridadText.ZZPrioridad
{
  ZSMB_I_VENTAS.ZZPrioridad,
  _ZZPrioridadText.ZZPrioridadTexto,
  _ZZPrioridadText
}
