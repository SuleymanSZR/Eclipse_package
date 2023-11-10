@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Şipariş Detay'
@Metadata.allowExtensions: true

define root view entity zc_rap_fat_003
  provider contract transactional_query
  as projection on zr_rap_fat_003 as Siparis

{
  key Vbeln,
  key Posnr,
      Matnr,
      Matkl,
      Arktx,
      Pstyv,


      /* Associations */
      _Fatura : redirected to composition child zc_rap_fat_004 ,
      _Teslimat : redirected to composition child Zc_RAP_FAT_005
}
