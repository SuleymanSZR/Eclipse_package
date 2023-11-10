@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Malzeme Detay'

define view entity zr_rap_bill_004
  as select from zrap_bill_003 as Malzeme
  
  association to parent zr_rap_bill_003 as _Malzeme on $projection.Matnr = _Malzeme.Matnr
{
  key matnr      as Matnr,
      maktx      as Maktx,
      birimfiyat as Birimfiyat,
      
      _Malzeme

}
