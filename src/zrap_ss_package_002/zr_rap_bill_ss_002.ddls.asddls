@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sirket Detayları'

define view entity zr_rap_bill_ss_002
  as select from zr_rap_bill_ss_010 as Sirket

  association to parent zr_rap_bill_ss_001 as _Fatura on  $projection.SirketKodu = _Fatura.SirketKodu
                                                     and $projection.Belnr      = _Fatura.Belnr
                                                     and $projection.Matnr      = _Fatura.Matnr
  //
  //  association [1..*] to zr_rap_bill_ss_010        as _asso   on  $projection.Matnr = _asso.Matnr
  //                                                             and $projection.belnr = _asso.Belnr


  //  association [1..*] to zr_rap_bill_ss_003        as _MatnrMiktar on  $projection.Matnr = _MatnrMiktar.Matnr

{
  key Sirket.SirketKodu         as SirketKodu,
      Sirket.Belnr              as Belnr,
      Sirket.Matnr              as Matnr,
      Sirket._Sirket.sirket_adi as SirketAdi,

      /* Association */
      _Fatura
      //      _fatura.belnr,
      //            _Fatura.Belnr      as Belnr,
      //
      //      _MatnrMiktar,
      //      _MatnrMiktar.Matnr as Matnr
      //      _asso,
      //      _asso.Belnr,
      //      _asso._MatnrDetay.matnr as matnr
}
