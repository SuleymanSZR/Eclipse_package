@EndUserText.label: 'Fatura Detay'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity zc_rap_fat_004
  as projection on zr_rap_fat_004
{
  key Vbeln,
  key Posnr,
      Fkimg,
      Vrkme,
      Vgbel,
      Vgpos,
      /* Associations */
      _Siparis : redirected to parent zc_rap_fat_003
}
