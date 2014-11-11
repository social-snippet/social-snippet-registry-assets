define(
  [
    "app/collections"
    "app/controllers"
    "app/models"
    "app/routers"
    "app/views"
    "backbone"
    "backbone.marionette"
  ]
  (
    Collections
    Controllers
    Models
    Routers
    Views
    Backbone
    Marionette
  )->
    class App extends Marionette.Application
      regions:
        main: "#main-container"

      initialize: (options)->

        @addInitializer ->
          new Routers::HomeRouter(
            controller: new Controllers::HomeController(
            )
          )

        @addInitializer ->
          new Routers::SearchRepositoryRouter(
            controller: new Controllers::SearchRepositoryController(
            )
          )

        @addInitializer ->
          new Routers::RepositoriesRouter(
            controller: new Controllers::RepositoriesController(
            )
          )

        @on "start", ->
          Backbone.history.start(
            pushState: true
          )
)
