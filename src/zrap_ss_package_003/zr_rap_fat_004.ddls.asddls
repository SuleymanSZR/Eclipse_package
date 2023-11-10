@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fatura Detay'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED
}
define view entity zr_rap_fat_004
  as select from zrap_vbrp as vbrp

  association to parent zr_rap_fat_003 as _Siparis on  $projection.Vgbel = _Siparis.Vbeln
                                                   and $projection.Vgpos = _Siparis.Posnr

{
  key vbrp.vbeln as Vbeln,
  key vbrp.posnr as Posnr,
      @Semantics.quantity.unitOfMeasure : 'Vrkme'
      vbrp.fkimg as Fkimg,
      vbrp.vrkme as Vrkme,
      vbrp.vgbel as Vgbel,
      vbrp.vgpos as Vgpos,


      _Siparis
}
