@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Faturalama Deneme'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define root view entity ZC_RAP_BILL_SS_001
  provider contract transactional_query
  as projection on zr_rap_bill_ss_001 as Fatura
{
      //zr_rap_bill_ss_001 CDS de oluşturulan alanlar çekilmiştir.
  key Belnr,

      @Consumption.valueHelpDefinition: [{entity: {name: 'zc_rap_bill_ss_002', element: 'Sirket_kodu' }}]
  key SirketKodu,

      @Consumption.valueHelpDefinition: [{entity: {name: 'zr_rap_bill_ss_004', element: 'MATNR' }}]
  key Matnr,
      ParaBirimi,
      ToplamTutar,
      OlusturmaTarihi,
      _Sirket: redirected to composition child ZC_RAP_BILL_SS_002
}
