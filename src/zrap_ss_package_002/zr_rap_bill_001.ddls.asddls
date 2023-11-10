@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Faturalama'
define root view entity zr_rap_bill_001
  as select from zrap_bill_001 as Fatura

  composition [0..*] of zr_rap_bill_002 as _sirket

  association [0..1] to zr_rap_bill_003 as _Malzeme      on $projection.Matnr = _Malzeme.Matnr
  association [0..1] to zr_rap_bill_004 as _MalzemeDetay on $projection.Matnr = _MalzemeDetay.Matnr
{
  key Fatura.sirketkodu     as Sirketkodu,
      Fatura.belnr          as Belnr,
      Fatura.matnr          as Matnr,
      Fatura.parabirimi     as Parabirimi,
      Fatura.toplamtutar    as Toplamtutar,
      Fatura.olusturmatarih as Olusturmatarih,

      /* Associations */
      _sirket, // Make association public
      _Malzeme,
      _MalzemeDetay
}
