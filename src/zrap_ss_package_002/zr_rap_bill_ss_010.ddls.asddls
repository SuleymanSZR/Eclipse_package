@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Faturalama Deneme'
@Metadata.allowExtensions: true
define root view entity zr_rap_bill_ss_010
  as select from zrap_bill_ss_001 as fatura

  association [0..*] to zrap_bill_ss_002 as _Sirket      on $projection.SirketKodu = _Sirket.sirket_kodu

  association [0..*] to zrap_bill_ss_003 as _MatnrMiktar on $projection.Matnr = _MatnrMiktar.matnr

  association [0..*] to zrap_bill_ss_004 as _MatnrDetay  on $projection.Matnr = _MatnrDetay.matnr
{
  key fatura.belnr            as Belnr,
  key fatura.matnr            as Matnr,
  key fatura.sirket_kodu      as SirketKodu,
      fatura.para_birimi      as ParaBirimi,
      fatura.toplam_tutar     as ToplamTutar,
      fatura.olusturma_tarihi as OlusturmaTarihi,

      /* Association */
      _Sirket,
      _MatnrMiktar,
      _MatnrDetay,
      _Sirket.sirket_adi,
      _MatnrDetay.maktx
}
