define(
  [
    "marionette"
    "models"
    "views"
    "collections"
  ]
  (
    Marionette
    Models
    Views
    Collections
  )->
    class RepositoriesController extends Marionette.Controller

      initialize: ->
        @app = require("app")

      showAll: ->
        repos = new Collections::Repositories
        all_repos_view = new Views::Contents::Repositories::AllRepositoriesView
          collection: repos
        @app.layout.currentView.contentsRegion.show all_repos_view
        repos.fetch()

      show: (repo_id)->
        repo = new Models::Repository
          name: repo_id

        repo.fetch()
          .then =>
            repo_view = new Views::Components::RepositoryDetailPanelView
              model: repo
            @app.layout.currentView.contentsRegion.show repo_view
          .then null, (error)->
            console.error "error: repository not found?"


)
