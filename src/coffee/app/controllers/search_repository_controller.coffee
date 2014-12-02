define(
  [
    "underscore"
    "backbone.marionette"

    # form deps
    "app/views/components/search_form_panel_view"

    # result deps
    "app/collections/search_results"
    "app/views/contents/search/search_results_view"
  ]
  (
    _
    Marionette

    SearchFormPanelView

    SearchResults
    SearchResultsView
  )->
    class SearchRepositoryController extends Marionette.Controller
      form: ->
        search_form_panel_view = new SearchFormPanelView
        app.layout.currentView.contentsRegion.show search_form_panel_view

      result: (repo)->
        search_results = new SearchResults([], {query: repo})
        search_results.fetch().done ->
          search_resutlts_view = new SearchResultsView(collection: search_results)
          app.layout.currentView.contentsRegion.show search_resutlts_view

)
