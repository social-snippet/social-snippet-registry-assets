define(
  [
    "marionette"
  ]
  (
    Marionette
  )->
    class RepositoriesRouter extends Marionette.AppRouter
      appRoutes:
        "repositories": "all"
        "repositories/:repo_id": "show"
)
