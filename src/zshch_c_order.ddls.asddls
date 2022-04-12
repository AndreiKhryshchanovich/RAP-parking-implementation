@EndUserText.label: 'Renter order projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZSHCH_C_ORDER
  as projection on ZSHCH_I_ORDER
{
  key RentOrderUuid,
      RentOrderId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.50
      @EndUserText.label: 'Space number'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_SPACE_EMPTY', element: 'SpaceId' }} ]
      SpaceId,
      @Consumption.valueHelpDefinition: [{entity: { name: 'ZSHCH_SH_RENTER', element: 'RenterId' }}]
      RenterId,
      RenterUuid,
      RentBegDate,
      RentBegTime,
      RentEndDate,
      RentEndTime,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Rental'
      RentalTotal,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      RentalDiscount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Rental to pay'
      RentalFinal,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['PaymentStatusTxt']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_I_PAY_STAT', element: 'StatusId' } }]
      PaymentStatus,
      _PaymentStatus.StatusTxt as PaymentStatusTxt,
      PaymentStatusCriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      _Space.SpaceId as SpaceIdRead,
      _Space._ParkingType.Address,
      _Space._SpaceType.SpaceSize,
      _Space._SpaceType.RentalDay,
      OwnerName,
      _Space._Owner._Contact.PhoneNumber,
      _Space._Owner._Contact.Email,
      _Renter._RenterT.FullName,
      @ObjectModel.text.element: ['ParkingNameTxt']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_PARK_NAME', element: 'ParkingNameId' } }]
      ParkingName,
      _ParkingName.ParkingNameTxt as ParkingNameTxt,
      @ObjectModel.text.element: ['BicycleAvailabilityTxt']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_BICYCLE_AVAIL', element: 'BicycleAvailabilityId' } }]
      BicycleAvailability,
      _BicycleAvailability.BicycleAvailabilityTxt as BicycleAvailabilityTxt,
      _Currency,
      _PaymentStatus,
      _Space,
      _ParkingName,
      _BicycleAvailability,      
      _Renter : redirected to parent ZSHCH_C_RENTER
}
