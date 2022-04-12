@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parking type view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_PTYPE
  as select from zshch_d_ptype_a
{
  key parking_type_id      as ParkingTypeId,
      parking_name         as ParkingName,
      address              as Address,
      bicycle_availability as BicycleAvailability
}
