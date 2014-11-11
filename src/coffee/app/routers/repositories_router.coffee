define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class RepositoriesRouter extends Marionette.AppRouter
      appRoutes:
        "new": "new"

        "repositories": "all"
        "repositories/:repo_id": "show"
)
