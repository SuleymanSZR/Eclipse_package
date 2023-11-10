@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_RAP_BILL_006'
@ObjectModel.semanticKey: [ 'Belnr' ]
define root view entity ZC_RAP_BILL_006
  provider contract transactional_query
  as projection on ZR_RAP_BILL_006
{
  key Belnr,
  Matnr,
  ParaBirimi,
  ToplamTutar,
  OlusturmaTarih,
  SirketKodu,
  LocalLastChangedAt
  
}
