define(
  [
    "backbone"
    "backbone.marionette"
    "app/views/components/panel_view"
  ]
  (
    Backbone
    Marionette
    PanelView
  )->
    class HomeMainRegionView extends Marionette.CollectionView
      childView: PanelView
)
