@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Şirket İnterface'

define view entity zr_rap_bill_002
  as select from zrap_bill_002 as Sirket

  association        to parent zr_rap_bill_001 as _Fatura on $projection.sirketKodu = _Fatura.Sirketkodu
//                                                         and $projection.Belnr = _Fatura.Belnr
  association [1..1] to zr_rap_bill_003        as _Matnr  on $projection.Matnr = _Matnr.Matnr
{
  key   sirketkodu    as sirketKodu,
  key   _Fatura.Matnr as Matnr,
        sirketadi,

        /* Associations */
        _Fatura,
        _Fatura.Belnr as Belnr,
        _Matnr
}
