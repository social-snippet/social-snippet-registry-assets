define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class NewRouter extends Marionette.AppRouter
      appRoutes:
        "new/repository": "repository"
)
