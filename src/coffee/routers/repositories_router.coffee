define(
  [
    "marionette"
  ]
  (
    Marionette
  )->
    class RepositoriesRouter extends Marionette.AppRouter
      appRoutes:
        "repos": "showAll"
        "repos/new": "create"
        "repos/r/:repo_name": "show"
)
