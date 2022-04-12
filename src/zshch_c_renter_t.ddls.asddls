@EndUserText.label: 'Renter (text) projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['FirstName', 'LastName']
define view entity ZSHCH_C_RENTER_T
  as projection on ZSHCH_I_RENTER_T as RenterTxt
{
  key RenterTxtUuid,
      RenterUuid,
      Langu,
      _Renter.RenterId,
      FirstName,
      LastName,
      FullName,
      _Renter.Passport,
      @EndUserText.label: 'Created At'
      _Renter.CreatedAt,
      LastChangedAt,
      /* Associations */
      _Renter : redirected to parent ZSHCH_C_RENTER
      
}
