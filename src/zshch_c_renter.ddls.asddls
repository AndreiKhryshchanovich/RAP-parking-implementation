@EndUserText.label: 'Renter projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['FullName']
define root view entity ZSHCH_C_RENTER
  provider contract transactional_query
  as projection on ZSHCH_I_RENTER as Renter
{
  key RenterUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_RENTER', element: 'RenterId' } }]
      RenterId,
      @EndUserText.label: 'Full Name'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_RENTER', element: 'FullName' } }]
      _RenterT.FullName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      _RenterT.FirstName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      _RenterT.LastName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      Passport,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      PhoneNumber,
      Email,
      @EndUserText.label: 'Number of rents'
      RentNumber,
      @EndUserText.label: 'Discount, %'
      Discount,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      _RenterTxt : redirected to composition child ZSHCH_C_RENTER_T,
      _Order     : redirected to composition child ZSHCH_C_ORDER

}
