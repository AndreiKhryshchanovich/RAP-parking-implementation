@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search help for Renter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_SH_RENTER
  as select from ZSHCH_I_RENTER
{
  key RenterId,
      @EndUserText.label: 'Full Name'
      concat_with_space(_RenterTxt.LastName, _RenterTxt.FirstName, 1) as FullName,
      Passport,
      RentNumber,
      Discount

}
