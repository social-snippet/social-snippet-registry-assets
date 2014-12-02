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

)
