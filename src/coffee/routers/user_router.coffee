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
        "user/dashboard": "dashboard"
        "user/repos/:owner_id/:repo_id": "repos"
)
