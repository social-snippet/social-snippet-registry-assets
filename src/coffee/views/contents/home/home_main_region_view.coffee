define(
  [
    "backbone.marionette"
    "app/views/components/panel_view"
  ]
  (
    Marionette
    PanelView
  )->
    class HomeMainRegionView extends Marionette.CollectionView
      childView: PanelView
)
