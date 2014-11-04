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
      initialize: (options)->
        @addRegions(
          "main": "#main-container"
        )

        @addInitializer ->
          router = new Routers::IndexRouter(
            controller: new Controllers::IndexController(
            )
          )

        @addInitializer ->
          router = new Routers::SearchRepositoryRouter(
            controller: new Controllers::SearchRepositoryController(
            )
          )

        @addInitializer ->
          Backbone.history.start(
            pushState: true
          )
)
