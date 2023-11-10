@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Faturalama Teslimat'

define view entity zr_rap_fat_002
  as select from zrap_likp as likp

  association        to parent zr_rap_fat_001 as _Fatura on  $projection.Vgbel = _Fatura.Vgbel
                                                         and $projection.Vgpos = _Fatura.Vgpos

  // and $projection.Fatura = _Fatura.Vbeln

  association [0..*] to zr_rap_bill_likp      as _lips   on  likp.vbeln = _lips.Vbeln
{
  key likp.vbeln  as Vbeln_tes,
      likp.erdat  as Erdat,
      likp.ernam  as Ernam,
      likp.vstel  as Vstel,
      likp.vkorg  as Vkorg,
      likp.lfart  as Lfart,

      _lips.Posnr as Posnr,
      _lips.Matnr as Matnr,
      _lips.Vgbel as Vgbel,
      _lips.Vgpos as Vgpos,

      _Fatura
      // _Fatura.Vbeln as Fatura

}
