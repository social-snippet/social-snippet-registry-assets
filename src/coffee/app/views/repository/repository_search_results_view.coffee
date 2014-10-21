define(
  [
    "app/views/element/list_element_view"
    "./repository_search_result_view"
  ]
  (
    ListElementView
    RepositorySearchResultView
  )->
    class RepositorySearchResultsView extends ListElementView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->
        @listenTo @collection, "sync", @render
      
      render: =>
        @$el.empty()
        @collection
          .map (result_repo)=>
            return new RepositorySearchResultView(
              model: result_repo
            )
          .forEach (result_view)=>
            @$el.append result_view.render().el
        return @
)
