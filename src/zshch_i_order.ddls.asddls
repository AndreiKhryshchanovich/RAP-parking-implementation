@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rent order view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_ORDER
  as select from zshch_d_rorder_a

  association        to parent ZSHCH_I_RENTER  as _Renter              on $projection.RenterUuid = _Renter.RenterUuid
  association [0..1] to I_Currency             as _Currency            on $projection.CurrencyCode = _Currency.Currency
  association [1..1] to ZSHCH_I_SPACE          as _Space               on $projection.SpaceId = _Space.SpaceId
  association [1..1] to ZSHCH_I_PAY_STAT       as _PaymentStatus       on $projection.PaymentStatus = _PaymentStatus.StatusId
  association [1..1] to ZSHCH_SH_PARK_NAME     as _ParkingName         on $projection.parkingname = _ParkingName.ParkingNameId
  association [1..1] to ZSHCH_SH_BICYCLE_AVAIL as _BicycleAvailability on $projection.bicycleavailability = _BicycleAvailability.BicycleAvailabilityId
{
  key rent_order_uuid as RentOrderUuid,
      rent_order_id   as RentOrderId,
      space_id        as SpaceId,
      renter_id       as RenterId,
      renter_uuid     as RenterUuid,
      rent_beg_date   as RentBegDate,
      rent_beg_time   as RentBegTime,
      rent_end_date   as RentEndDate,
      rent_end_time   as RentEndTime,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      rental_total    as RentalTotal,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      rental_discount as RentalDiscount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      rental_final    as RentalFinal,
      currency_code   as CurrencyCode,
      payment_status  as PaymentStatus,
      case payment_status
        when '1' then 3 -- 'paid'    | 3: green colour
        when '2' then 2 -- 'unpaid'  | 2: red colour
        else          0 -- 'nothing' | 0: unknown
      end             as PaymentStatusCriticality,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @EndUserText.label: 'Created At'
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @EndUserText.label: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Space._SpaceType._ParkingType.ParkingName,
      _Space._SpaceType._ParkingType.BicycleAvailability,
      concat_with_space(_Space._Owner._OwnerTxt.FirstName, _Space._Owner._OwnerTxt.LastName, 1) as OwnerName,

      _Renter,
      _Currency,
      _PaymentStatus,
      _Space,
      _ParkingName,
      _BicycleAvailability

}
