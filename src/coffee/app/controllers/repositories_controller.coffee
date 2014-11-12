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
        view = new Views::RepositoriesView
          collection: repos
        app.main.show view
        repos.fetch()

      show: (repo_id)->

)
