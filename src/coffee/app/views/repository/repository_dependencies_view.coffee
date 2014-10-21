define(
  [
    "app/views/base_view"
    "./repository_dependency_view"
  ]
  (
    BaseView
    RepositoryDependencyView
  )->
    class RepositoryDependenciesView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->

      render: ->
        @$el.empty()
        @collection.each (repo_dep)=>
          repo_dep_view = new RepositoryDependencyView(
            model: repo_dep
          )
          @$el.append repo_dep_view.render().el
        return @
)
