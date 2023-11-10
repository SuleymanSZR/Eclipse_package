@EndUserText.label: 'Teslimat Detay'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_RAP_FAT_005
  as projection on zr_rap_fat_005
{
  key Vbeln,
  key Posnr,
      Matnr,
      Erdat,
      Ernam,
      Vgbel,
      Vgpos,
      Arktx,
      /* Associations */
      _Siparis : redirected to parent zc_rap_fat_003
}
