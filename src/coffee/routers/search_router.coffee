define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class SearchRouter extends Marionette.AppRouter
      appRoutes:
        "search?q=:query": "result"
        "search": "form"
)
