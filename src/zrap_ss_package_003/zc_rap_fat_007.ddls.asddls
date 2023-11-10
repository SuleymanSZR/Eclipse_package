@EndUserText.label: 'Fatura Detay'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZC_RAP_FAT_007
  as projection on ZR_RAP_FAT_007
{
  key Vbeln,
  key Posnr,
      Fkimg,
      Vrkme,
      Vgbel,
      Vgpos,
      /* Associations */
      _Siparis : redirected to parent ZC_RAP_FAT_006
}
