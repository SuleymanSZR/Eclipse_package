@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZRAP_BILL_005'
define root view entity ZR_RAP_BILL_005
  as select from zrap_bill_005 as Fatura
{
  key belnr as Belnr,
  matnr as Matnr,
  parabirimi as Parabirimi,
  toplamtutar as Toplamtutar,
  olusturmatarih as Olusturmatarih,
  sirketkodu as Sirketkodu,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
