define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class RepositoriesRouter extends Marionette.AppRouter
      appRoutes:
        "repositories": "all"
        "repositories/new": "new"
        "repositories/:repo_id": "show"
)
