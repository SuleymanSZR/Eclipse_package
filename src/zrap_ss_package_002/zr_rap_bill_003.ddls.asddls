@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Malzeme'

define view entity zr_rap_bill_003
  as select from zrap_bill_004 as Malzeme

  association to parent zr_rap_bill_002 as _Sirket on  $projection.Matnr      = _Sirket.Matnr
                                                   and $projection.sirketkodu = _Sirket.sirketKodu
{
  key Malzeme.matnr  as Matnr,
      Malzeme.miktar as Miktar,

      /* Associations */
      _Sirket,
      _Sirket.sirketKodu
}
