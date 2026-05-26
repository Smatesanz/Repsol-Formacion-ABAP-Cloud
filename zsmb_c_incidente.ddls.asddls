@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZSMB_INCIDENTE'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZSMB_C_INCIDENTE
  provider contract transactional_query
  as projection on ZSMB_R_INCIDENTETP
  association [1..1] to ZSMB_R_INCIDENTETP as _BaseEntity on $projection.IncidenteUUID = _BaseEntity.IncidenteUUID
{
  key IncidenteUUID,
  Descripcion,
  FechaApertura,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LastChangedAt,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
