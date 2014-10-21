define(
  [
    "jquery"
    "app/views/base_view"
    "./repository_search_results_view"
    "./repository_search_form_view"
  ]
  (
    $
    BaseView
    RepositorySearchResultsView
    RepositorySearchFormView
  )->
    class RepositorySearchView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->
        query = @model.get("query")

        repositories = @model.get("repositories")
        @repos_view = new RepositorySearchResultsView(
          collection: repositories
        )

      render: =>
        query = @model.get("query")
        @$el.empty()

        form = new RepositorySearchFormView(
          model: @model.get("search_form")
        )

        if query == ""
          @$el
            .append form.render().el

        else
          @$el
            .append form.render().el
            .append @repos_view.render().el

        return @
)
