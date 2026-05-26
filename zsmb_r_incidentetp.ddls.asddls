@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZSMB_INCIDENTE'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZSMB_R_INCIDENTETP
  as select from zsmb_incidente as Incidente
{
  key incidente_uuid as IncidenteUUID,
  descripcion as Descripcion,
  fecha_apertura as FechaApertura,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
