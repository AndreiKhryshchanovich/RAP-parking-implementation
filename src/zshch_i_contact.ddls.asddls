@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Contact view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_CONTACT
  as select from zshch_d_cont_a
{
  key contact_id   as ContactId,
      phone_number as PhoneNumber,
      email        as Email,
      address      as Address
}
