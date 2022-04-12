@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Payment statuses view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSHCH_I_PAY_STAT
  as select from zshch_c_pay_stat
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'StatusTxt' ]
  key status_id  as StatusId,
      status_txt as StatusTxt
}
