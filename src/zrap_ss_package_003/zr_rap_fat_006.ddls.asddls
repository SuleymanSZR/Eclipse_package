@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sipariş Detay'
define root view entity ZR_RAP_FAT_006
  as select from zrap_vbap as vbap
  composition [0..*] of ZR_RAP_FAT_007 as _Fatura
  composition [0..*] of ZR_RAP_FAT_008 as _Teslimat
{
  key vbeln as Vbeln,
  key posnr as Posnr,
      matnr as Matnr,
      matkl as Matkl,
      arktx as Arktx,
      pstyv as Pstyv,


      _Fatura,
      _Teslimat
}
