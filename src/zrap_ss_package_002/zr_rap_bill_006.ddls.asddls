@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZRAP_BILL_006'
define root view entity ZR_RAP_BILL_006
  as select from zrap_bill_006 as Fatura
{
  key belnr as Belnr,
  matnr as Matnr,
  para_birimi as ParaBirimi,
  toplam_tutar as ToplamTutar,
  olusturma_tarih as OlusturmaTarih,
  sirket_kodu as SirketKodu,
  
  
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
