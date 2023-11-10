@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Faturalama Consumption'
@Metadata.allowExtensions: true

define root view entity zc_rap_bill_001
  as projection on zr_rap_bill_001 as Fatura
{
  key Sirketkodu,
      Belnr,
      Matnr,
      Parabirimi,
      Toplamtutar,
      Olusturmatarih,
      /* Associations */
      _Malzeme,
      _MalzemeDetay,
//      _MalzemeDetay.Maktx,
      _sirket: redirected to composition child zc_rap_bill_002
}
