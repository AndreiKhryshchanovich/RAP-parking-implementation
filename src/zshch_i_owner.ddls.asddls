@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Owner view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_OWNER
  as select from zshch_d_owner_a
  
  association [0..1] to ZSHCH_I_OWNER_T as _OwnerTxt on _OwnerTxt.Langu = $session.system_language
                                                     and $projection.OwnerId = _OwnerTxt.OwnerId
  association [0..1] to ZSHCH_I_CONTACT as _Contact on $projection.ContactId = _Contact.ContactId
{
  key owner_id   as OwnerId,
      contact_id as ContactId,
      birth_date as BirthDate,
      _OwnerTxt,
      _Contact
}
