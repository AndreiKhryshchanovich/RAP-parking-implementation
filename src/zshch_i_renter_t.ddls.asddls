@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Renter (text) view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_RENTER_T
  as select from zshch_d_renter_t as RenterTxt

  association to parent ZSHCH_I_RENTER as _Renter on $projection.RenterUuid = _Renter.RenterUuid

{
  key renter_txt_uuid                             as RenterTxtUuid,
      renter_uuid                                 as RenterUuid,
      langu                                       as Langu,
      @Semantics.text: true
      first_name                                  as FirstName,
      @Semantics.text: true
      last_name                                   as LastName,
      @Semantics.text: true
      concat_with_space(last_name, first_name, 1) as FullName,
      @EndUserText.label: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                             as LastChangedAt,
      _Renter
} where langu = $session.system_language
