define(
  [
    "backbone"
    "marionette"
    "models"
    "views"
    "collections"
  ]
  (
    Backbone
    Marionette
    Models
    Views
    Collections
  )->
    class RepositoriesController extends Marionette.Controller

      initialize: ->
        @app = require("app")

      showAll: ->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "All Repositories"

        repos = new Collections::Repositories
        all_repos_view = new Views::Contents::Repositories::AllRepositoriesView
          collection: repos
        @app.layout.currentView.contentsRegion.show all_repos_view
        repos.fetch()

      show: (repo_id)->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "#{repo_id} - Snippet Library"

        repo = new Models::Repository
          name: repo_id

        repo.fetch()
          .then =>
            repo_view = new Views::Components::RepositoryDetailPanelView
              model: repo
            @app.layout.currentView.contentsRegion.show repo_view
          .then null, (error)->
            console.error "error: repository not found?"

      create: ->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "Add New Repository URL"

        new_repo_view = new Views::Contents::NewRepositoryView
        @app.layout.currentView.contentsRegion.show new_repo_view
        new_repo_view.byUrlRegion.show new Views::Components::AddRepositoryByUrlView
        new_repo_view.byGitHubRegion.show new Views::Components::AddRepositoryByGitHubView


)
