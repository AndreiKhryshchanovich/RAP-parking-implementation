@EndUserText.label: 'Rent order projection view for ALP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZSHCH_C_ORDER_ALP
  provider contract transactional_query
  as projection on ZSHCH_I_ORDER
{
  key RentOrderUuid,
      RentOrderId,
      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.5
      }
      @EndUserText.label: 'Space number'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_SPACE_EMPTY', element: 'SpaceId' }} ]
      SpaceId,
      @Consumption.valueHelpDefinition: [{ entity: { name:    'ZSHCH_SH_RENTER', 
                                                     element: 'RenterId' } }]                                          
      @ObjectModel.text.element: ['RenterName']
      RenterId,
      _Renter._RenterT.FullName as RenterName,
      RenterUuid,
      RentBegDate,
      RentBegTime,
      RentEndDate,
      RentEndTime,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'SUM Rental'
      RentalTotal,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      RentalDiscount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Rental'
      @Aggregation.default: #SUM
      RentalFinal,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['PaymentStatusTxt']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_I_PAY_STAT', element: 'StatusId' } }]
      PaymentStatus,
      _PaymentStatus.StatusTxt as PaymentStatusTxt,
      PaymentStatusCriticality,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_I_PTYPE', element: 'Address' }} ]
      _Space._ParkingType.Address,
      _Space._SpaceType.SpaceSize,
      _Space._SpaceType.RentalDay,
      OwnerName,
      _Space._Owner._Contact.PhoneNumber,
      _Space._Owner._Contact.Email,
      @ObjectModel.text.element: ['ParkingNameTxt']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_PARK_NAME', element: 'ParkingNameId' } }]
      ParkingName,
      _ParkingName.ParkingNameTxt as ParkingNameTxt,
      @ObjectModel.text.element: ['BicycleAvailabilityTxt']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSHCH_SH_BICYCLE_AVAIL', element: 'BicycleAvailabilityId' } }]
      BicycleAvailability,
      _BicycleAvailability.BicycleAvailabilityTxt as BicycleAvailabilityTxt,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Currency,
      _PaymentStatus,
      _Space,
      _ParkingName,
      _BicycleAvailability,
      _Renter : redirected to ZSHCH_C_RENTER
}
