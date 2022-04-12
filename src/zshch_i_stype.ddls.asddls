@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parking space type view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_STYPE
  as select from zshch_d_stype_a

  association [1..1] to ZSHCH_I_PTYPE as _ParkingType on $projection.ParkingTypeId = _ParkingType.ParkingTypeId
  association [0..1] to I_Currency    as _Currency    on $projection.CurrencyCode = _Currency.Currency

{
  key space_type_id       as SpaceTypeId,
      parking_type_id     as ParkingTypeId,
      space_size          as SpaceSize,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      rental_day          as RentalDay,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      administration_fee  as AdministrationFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      current_space_price as CurrentSpacePrice,
      currency_code       as CurrencyCode,

      _ParkingType,
      _Currency
}
