define(
  [
    "marionette"
    "views/components/link_view"
  ]
  (
    Marionette
    LinkView
  )->
    class LinksView extends Marionette.CollectionView
      tagName: "ul"
      childView: LinkView
)
