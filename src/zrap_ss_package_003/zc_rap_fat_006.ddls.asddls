@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Şipariş Detay'
@Metadata.allowExtensions: true

define root view entity ZC_RAP_FAT_006
  provider contract transactional_query
  as projection on ZR_RAP_FAT_006 as Siparis

{
  key Vbeln,
  key Posnr,
      Matnr,
      Matkl,
      Arktx,
      Pstyv,


      /* Associations */
      _Fatura : redirected to composition child ZC_RAP_FAT_007,
      _Teslimat : redirected to composition child ZC_RAP_FAT_008
}
