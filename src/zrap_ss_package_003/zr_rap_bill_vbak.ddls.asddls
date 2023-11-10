@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VBAK Tablosu'
define root view entity zr_rap_bill_vbak
  as select from zrap_vbak_ss as vbak
  //composition of target_data_source_name as _association_name

  association [0..*] to zrap_vbap as _vbap on vbak.vbeln = _vbap.vbeln
{
  key vbak.vbeln  as Vbeln,
      vbak.erdat  as Erdat,
      vbak.ernam  as Ernam,
      vbak.auart  as Auart,
      vbak.netwr  as Netwr,
      vbak.waerk  as Waerk,
      vbak.vkorg  as Vkorg,
      vbak.vtweg  as Vtweg,
      _vbap.posnr as Posnr,
      _vbap.matnr as Matnr,
      _vbap.arktx as Arktx,
      _vbap.matkl as Matkl
      // _association_name // Make association public
}
