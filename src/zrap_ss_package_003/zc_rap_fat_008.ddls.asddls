@EndUserText.label: 'Teslimat Detay'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_RAP_FAT_008
  as projection on ZR_RAP_FAT_008
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
      _Siparis : redirected to parent ZC_RAP_FAT_006
}
