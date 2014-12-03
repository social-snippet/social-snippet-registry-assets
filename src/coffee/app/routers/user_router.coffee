define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class UserRouter extends Marionette.AppRouter
      appRoutes:
        "user/login": "login"
)
