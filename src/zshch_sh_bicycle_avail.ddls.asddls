@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search help for Bicycle availability'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_SH_BICYCLE_AVAIL
  as select from zshch_c_bicycle
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'BicycleAvailabilityTxt' ]
  key bicycle_availability_id  as BicycleAvailabilityId,
      bicycle_availability_txt as BicycleAvailabilityTxt
}
