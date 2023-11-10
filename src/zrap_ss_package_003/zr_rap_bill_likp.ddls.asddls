@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Likp Tablosu'
define root view entity zr_rap_bill_likp
  as select from zrap_likp as likp
  //composition of target_data_source_name as _association_name
  association [0..*] to zrap_lips as _lips on likp.vbeln = _lips.vbeln
{
  key likp.vbeln  as Vbeln,
      likp.erdat  as Erdat,
      likp.ernam  as Ernam,
      likp.vstel  as Vstel,
      likp.vkorg  as Vkorg,
      likp.lfart  as Lfart,

      _lips.posnr as Posnr,
      _lips.matnr as Matnr,
      _lips.vgbel as Vgbel,
      _lips.vgpos as Vgpos

      // _association_name // Make association public
}
