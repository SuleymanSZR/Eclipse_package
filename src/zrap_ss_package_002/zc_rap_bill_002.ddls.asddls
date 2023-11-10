@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Şirket Consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define view entity zc_rap_bill_002
  as projection on zr_rap_bill_002
{
  key sirketKodu,
  key Matnr,
      sirketadi,
      Belnr,
      /* Associations */
      _Fatura : redirected to parent zc_rap_bill_001,
      _Matnr
}
