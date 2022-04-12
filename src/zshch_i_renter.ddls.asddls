@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Renter view'
define root view entity ZSHCH_I_RENTER
  as select from zshch_d_renter_a as Renter

  composition [0..*] of ZSHCH_I_ORDER    as _Order
  composition [0..*] of ZSHCH_I_RENTER_T as _RenterTxt
  association [0..1] to ZSHCH_I_RENTER_T as _RenterT on _RenterT.RenterUuid = $projection.RenterUuid


{
  key renter_uuid     as RenterUuid,
      renter_id       as RenterId,
      passport        as Passport,
      phone_number    as PhoneNumber,
      email           as Email,
      rent_number     as RentNumber,
      discount        as Discount,
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

      _Order,
      _RenterTxt,
      _RenterT

}
