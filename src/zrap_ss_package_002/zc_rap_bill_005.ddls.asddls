@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_RAP_BILL_005'
@ObjectModel.semanticKey: [ 'Belnr' ]
define root view entity ZC_RAP_BILL_005
  provider contract transactional_query
  as projection on ZR_RAP_BILL_005
{
  key Belnr,
  Matnr,
  Parabirimi,
  Toplamtutar,
  Olusturmatarih,
  Sirketkodu,
  LocalLastChangedAt
  
}
