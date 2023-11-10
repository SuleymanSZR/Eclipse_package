@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Teslimat Detay'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED
}
define view entity zr_rap_fat_005
  as select from zrap_lips as lips

  association to parent zr_rap_fat_003 as _Siparis on  $projection.Vgbel = _Siparis.Vbeln
                                                   and $projection.Vgpos = _Siparis.Posnr

{
  key lips.vbeln as Vbeln,
  key lips.posnr as Posnr,
      lips.matnr as Matnr,
      lips.erdat as Erdat,
      lips.ernam as Ernam,
      lips.vgbel as Vgbel,
      lips.vgpos as Vgpos,


      _Siparis, 
      _Siparis.Arktx as Arktx
}
