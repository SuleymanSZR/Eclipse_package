@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Faturalama Deneme'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zr_rap_bill_test_002
  as select from zrap_bill_002 as Sirket

  association to parent zr_rap_bill_test_001 as _Fatura on  $projection.Sirketkodu = _Fatura.Sirketkodu
                                                        and $projection.belnr      = _Fatura.Belnr
//                                                        and $projection.matnr      = _Fatura.Matnr
{
  key sirketkodu    as Sirketkodu,
      sirketadi     as Sirketadi,

      _Fatura,
      _Fatura.Belnr as belnr
//      _Fatura.Matnr as matnr
}
