@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VBRK Tablosu'
define root view entity zr_rap_bill_vbrk
  as select from zrap_vbrk as vbrk
  //composition of target_data_source_name as _association_name

//  inner join zrap_vbrp as vbrp on vbrk.vbeln = vbrp.vbeln
//  left outer join zrap_vbrp as vbrp on vbrk.vbeln = vbrp.vbeln
  association [0..*] to zrap_vbrp as _vbrp on vbrk.vbeln = _vbrp.vbeln
{
  key vbrk.vbeln as Vbeln,
      vbrk.waerk as Waerk,
      vbrk.vkorg as Vkorg,
      vbrk.vtweg as Vtweg,
      vbrk.fkdat as Fkdat,
      vbrk.zterm as Zterm,
//      vbrp.posnr as Posnr,
//      vbrp.fkimg as Fkimg,
//      vbrp.vrkme as Vrkme,
//      vbrp.vgbel as Vgbel,
//      vbrp.vgpos as Vgpos,

      _vbrp
//      _vbrp.posnr as Posnr,
//      _vbrp.fkimg as Fkimg,
//      _vbrp.vrkme as Vrkme,
//      _vbrp.vgbel as Vgbel,
//      _vbrp.vgpos as Vgpos
      // _association_name // Make association public
}
