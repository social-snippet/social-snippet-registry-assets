define(
  [
    "marionette"
    "views/components/repository_panel_view"
  ]
  (
    Marionette
    RepositoryPanelView
  )->
    class SearchResultsView extends Marionette.CollectionView
      tagName: "div"
      childView: RepositoryPanelView
)
