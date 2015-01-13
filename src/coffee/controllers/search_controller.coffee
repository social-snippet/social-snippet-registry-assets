define(
  [
    "marionette"
    "views"
    "collections"
  ]
  (
    Marionette
    Views
    Collections
  )->
    class SearchController extends Marionette.Controller

      initialize: ->
        @app = require("app")

      form: ->
        search_form_panel_view = new Views::Components::SearchFormPanelView
        @app.layout.currentView.contentsRegion.show search_form_panel_view

      result: (repo)->
        search_results = new Collections::SearchResults([], {query: repo})
        search_results.fetch().done ->
          search_resutlts_view = new Views::Contents::Search::SearchResultsView(collection: search_results)
          @app.layout.currentView.contentsRegion.show search_resutlts_view

)
