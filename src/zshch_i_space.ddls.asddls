@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parking space view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_SPACE
  as select from zshch_d_pspace_a

  association [1..1] to ZSHCH_I_OWNER    as _Owner         on $projection.OwnerId = _Owner.OwnerId
  association [1..1] to ZSHCH_I_STYPE    as _SpaceType     on $projection.SpaceTypeId = _SpaceType.SpaceTypeId
  association [1..1] to ZSHCH_I_PAY_STAT as _PaymentStatus on $projection.PaymentStatus = _PaymentStatus.StatusId
{
  key space_id          as SpaceId,
      space_type_id     as SpaceTypeId,
      owner_id          as OwnerId,
      occupation_status as OccupationStatus,
      payment_status    as PaymentStatus,
      case payment_status
        when '1' then 3 -- 'paid'    | 3: green colour
        when '2' then 2 -- 'unpaid'  | 2: red colour
        else          0 -- 'nothing' | 0: unknown
      end               as PaymentStatusCriticality,
      _Owner.OwnerId    as OwnerIdAssoc,
      _Owner.ContactId,
      _SpaceType.ParkingTypeId,

      _Owner,
      _Owner._OwnerTxt,
      _Owner._Contact,
      _SpaceType,
      _SpaceType._ParkingType,
      _PaymentStatus

}
