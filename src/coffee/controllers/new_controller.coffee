define(
  [
    "marionette"
    "views"
  ]
  (
    Marionette
    Views
  )->
    class NewController extends Marionette.Controller

      initialize: ->
        @app = require("app")

      repository: ->
        new_repo_view = new Views::Contents::NewRepositoryView
        @app.layout.currentView.contentsRegion.show new_repo_view
        new_repo_view.byUrlRegion.show new Views::Components::AddRepositoryByUrlView
        new_repo_view.byGitHubRegion.show new Views::Components::AddRepositoryByGitHubView
)

