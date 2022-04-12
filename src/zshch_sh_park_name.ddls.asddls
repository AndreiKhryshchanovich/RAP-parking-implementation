@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search help for Parking type name'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_SH_PARK_NAME
  as select from zshch_c_parkname
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'ParkingNameTxt' ]
  key parking_name_id  as ParkingNameId,
      parking_name_txt as ParkingNameTxt
}
