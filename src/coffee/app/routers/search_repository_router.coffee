define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class SearchRepositoryRouter extends Marionette.AppRouter
      appRoutes:
        "search?q=:query": "result"
        "search": "form"
)
