define(
  [
    "backbone"
    "backbone.marionette"
    "app/views"
    "app/collections"
  ]
  (
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

      new: ->
        app.main.show new Views::NewRepositoryView(
          model: new Backbone.Model
            action: "#{WEB_API_PROTOCOL}://#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories"
        )

)
