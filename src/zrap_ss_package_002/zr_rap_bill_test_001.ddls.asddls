@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Faturalama Deneme'
@Metadata.allowExtensions: true
define root view entity zr_rap_bill_test_001
  as select from zrap_bill_001 as fatura

  composition [0..*] of zr_rap_bill_test_002 as _Sirket

  //    join         zrap_bill_002 as sirket on fatura.sirketkodu = sirket.sirketkodu

{
      @Consumption.valueHelpDefinition: [{entity: {name: 'zr_rap_bill_test_002', element: 'Sirketkodu' }}]
  key fatura.sirketkodu     as Sirketkodu,
  key fatura.belnr          as Belnr,
      @Consumption.valueHelpDefinition: [{entity: {name: 'zr_rap_bill_004', element: 'MATNR' }}]
      fatura.matnr          as Matnr,
      fatura.parabirimi     as Parabirimi,
      fatura.toplamtutar    as Toplamtutar,
      fatura.olusturmatarih as Olusturmatarih,
      _Sirket
}
