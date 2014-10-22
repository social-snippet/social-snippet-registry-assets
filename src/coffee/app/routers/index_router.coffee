define(
  [
    "backbone.marionette"
    "app/controllers"
  ]
  (
    Marionette
    Controllers
  )->
    class IndexRouter extends Marionette.AppRouter
      appRoutes:
        "": "index"
)
