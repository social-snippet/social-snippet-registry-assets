define(
  [
    "underscore"
    "backbone"
    "marionette"
    "models"
    "views"
    "collections"
  ]
  (
    _
    Backbone
    Marionette
    Models
    Views
    Collections
  )->
    class RepositoriesController extends Marionette.Controller
      all: ->
        repos = new Collections::Repositories
        all_repos_view = new Views::AllRepositoriesView
          collection: repos
        app.layout.currentView.contentsRegion.show all_repos_view
        repos.fetch()

      show: (repo_id)->
        repo = new Models::Repository
          name: repo_id

        repo
          .fetch()
          .done ->
            repo_view = new Views::RepositoryDetailPanelView
              model: repo
            app.layout.currentView.contentsRegion.show repo_view


)
