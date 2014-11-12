define(
  [
    "underscore"
    "backbone.marionette"
    "app/views/components/link_view"
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
