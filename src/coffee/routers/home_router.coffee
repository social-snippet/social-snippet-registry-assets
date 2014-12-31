define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class HomeRouter extends Marionette.AppRouter
      appRoutes:
        "": "index"
)
