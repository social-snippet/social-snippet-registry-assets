define(
  [
    "underscore"
    "backbone"
    "backbone.marionette"
    "app/views"
    "app/collections"
  ]
  (
    _
    Backbone
    Marionette
    Views
  )->
    class NewController extends Marionette.Controller
      repository: ->
        new_repo_view = new Views::NewRepositoryView
        app.layout.currentView.contentsRegion.show new_repo_view
        new_repo_view.byUrlRegion.show new Views::AddRepositoryByUrlView
        new_repo_view.byGitHubRegion.show new Views::AddRepositoryByGitHubView
)

