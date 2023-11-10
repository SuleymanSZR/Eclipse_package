@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Malzeme Detayları'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zr_rap_bill_ss_004
  as select from zrap_bill_ss_004
{
  key matnr      as Matnr,
      maktx      as Maktx,
      birimfiyat as Birimfiyat
}
