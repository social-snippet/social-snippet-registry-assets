define(
  [
    "backbone.marionette"
    "app/controllers"
  ]
  (
    Marionette
    Controllers
  )->
    class HomeRouter extends Marionette.AppRouter
      appRoutes:
        "": "index"
)
