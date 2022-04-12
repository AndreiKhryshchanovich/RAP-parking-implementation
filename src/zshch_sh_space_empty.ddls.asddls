@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search help for empty SPACE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_SH_SPACE_EMPTY
  as select from ZSHCH_I_SPACE   as space
    join         zshch_d_stype_a as stype on space.SpaceTypeId = stype.space_type_id
    join         zshch_d_ptype_a as ptype on stype.parking_type_id = ptype.parking_type_id
{
        @EndUserText.label: 'Space number'
  key   space.SpaceId       as SpaceId,
        ptype.address       as Address,
        stype.space_size    as SpaceSize,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        stype.rental_day    as RentalDay,
        stype.currency_code as CurrencyCode
}
where
  space.OccupationStatus = '1'
