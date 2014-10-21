define(
  [
    "app/views/base_view"
    "./repository_detail_view"
  ]
  (
    BaseView
    RepositoryDetailView
  )->
    class RepositoryDetailsView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->

      render: ->
        @$el.empty()

        @collection.each (repo_model)=>
          repo_view = new RepositoryDetailView(
            model: repo_model
          )
          @$el.append repo_view.render().el

        return @
)
