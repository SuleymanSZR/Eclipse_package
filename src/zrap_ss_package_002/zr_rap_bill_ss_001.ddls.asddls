@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Faturalama Deneme'
@Metadata.allowExtensions: true
define root view entity zr_rap_bill_ss_001
  as select from zrap_bill_ss_001 as fatura

  composition [0..*] of zr_rap_bill_ss_002 as _Sirket

  //    join         zrap_bill_ss_002 as sirket on fatura.sirketkodu = sirket.sirketkodu

{
  key fatura.belnr            as Belnr,
  key fatura.sirket_kodu      as SirketKodu,
  key fatura.matnr            as Matnr,
      fatura.para_birimi      as ParaBirimi,
      fatura.toplam_tutar     as ToplamTutar,
      fatura.olusturma_tarihi as OlusturmaTarihi,

      /* Association */
      _Sirket
}
