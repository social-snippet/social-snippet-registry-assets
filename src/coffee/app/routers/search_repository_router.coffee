define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class SearchRepositoryRouter extends Marionette.AppRouter
      appRoutes:
        "search": "form"
        "search-result?q=:query": "result"
)
