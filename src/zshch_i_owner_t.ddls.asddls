@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Owner (text) view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_OWNER_T
  as select from zshch_d_owner_t
{
      @Semantics.language: true
  key langu      as Langu,
  key owner_id   as OwnerId,
      @Semantics.text: true
      first_name as FirstName,
      @Semantics.text: true
      last_name  as LastName
}
