@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sipariş Detay'
define root view entity zr_rap_fat_003
  as select from zrap_vbap as vbap
  composition [0..*] of zr_rap_fat_004 as _Fatura
  composition [0..*] of zr_rap_fat_005 as _Teslimat
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
