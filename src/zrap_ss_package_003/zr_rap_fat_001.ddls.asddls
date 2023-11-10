@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Faturalama'

define root view entity zr_rap_fat_001
  as select from zr_rap_bill_vbrk as vbrk
   composition of zr_rap_fat_002 as _Teslimat
{
      // key vbrk.Vbeln,
      // vbrk.Waerk,
      // vbrk.Vkorg,
      // vbrk.Vtweg,
      // vbrk.Fkdat,
      // vbrk.Zterm,
      // /* Associations */
      // vbrk._vbrp,


  key _vbrp.vgbel as Vgbel,
  key _vbrp.vgpos as Vgpos,
      vbrk.Vbeln  as Vbeln,
      vbrk.Waerk  as Waerk,
      vbrk.Vkorg  as Vkorg,
      vbrk.Vtweg  as Vtweg,

      /* Associations */
       _Teslimat
      // _association_name // Make association public
}
