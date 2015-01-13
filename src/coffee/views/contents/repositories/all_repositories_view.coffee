define(
  [
    "marionette"
    "views/components/repository_panel_view"
  ]
  (
    Marionette
    RepositoryPanelView
  )->
    class AllRepositoriesView extends Marionette.CollectionView
      tagName: "div"
      childView: RepositoryPanelView
)
