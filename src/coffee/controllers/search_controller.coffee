define(
  [
    "backbone"
    "marionette"
    "views"
    "collections"
  ]
  (
    Backbone
    Marionette
    Views
    Collections
  )->
    class SearchController extends Marionette.Controller

      initialize: ->
        @app = require("app")

      form: ->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "Find Snippets"

        search_form_panel_view = new Views::Components::SearchFormPanelView
        @app.layout.currentView.contentsRegion.show search_form_panel_view

      result: (keyword)->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "#{keyword} - Search Results"

        search_results = new Collections::SearchResults([], {query: keyword})
        search_results.fetch().done =>
          search_resutlts_view = new Views::Contents::Search::SearchResultsView(collection: search_results)
          @app.layout.currentView.contentsRegion.show search_resutlts_view

)
