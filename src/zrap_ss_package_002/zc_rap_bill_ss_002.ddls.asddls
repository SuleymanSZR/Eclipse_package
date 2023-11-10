@EndUserText.label: 'Şirket Detayları Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_RAP_BILL_SS_002
  as projection on zr_rap_bill_ss_002 as Sirket
{
  key SirketKodu,
      Belnr,
      Matnr,
      SirketAdi,
      
      /* Associations */
      _Fatura : redirected to parent ZC_RAP_BILL_SS_001
}
