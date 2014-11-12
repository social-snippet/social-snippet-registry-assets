define(
  [
    "underscore"
    "backbone.marionette"
    "./link_view"
  ]
  (
    _
    Marionette
    LinkView
  )->
    class LinksView extends Marionette.CollectionView
      tagName: "ul"
      childView: LinkView
)
