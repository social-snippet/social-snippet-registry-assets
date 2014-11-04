define(
  [
    "backbone"
    "backbone.marionette"
    "app/views"
  ]
  (
    Backbone
    Marionette
    Views
  )->
    class RepositoriesController extends Marionette.Controller
      all: ->

      show: (repo_id)->

      new: ->
        app.main.show new Views::NewRepositoryView(
          model: new Backbone.Model
            action: "#{WEB_API_PROTOCOL}://#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories"
        )

)
