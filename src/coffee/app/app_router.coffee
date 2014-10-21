define(
  [
    "jquery"
    "backbone"
    "app/models/application"
    "app/views/application_view"
    "app/models/repository/repository_search"
    "app/views/repository/repository_search_view"
    "app/views/index_view"
    "app/views/repository/new_repository_view"
    "app/models/repository/repository"
    "app/views/repository/repository_detail_view"
    "app/collections/repository_dependencies"
    "app/views/repository/repository_dependency_view"
  ]
  (
    $
    Backbone
    Application
    ApplicationView
    RepositorySearch
    RepositorySearchView
    IndexView
    NewRepositoryView
    Repository
    RepositoryDetailView
    RepositoryDependencies
    RepositoryDependencyView
  )->
    class AppRouter extends Backbone.Router

      initialize: ->
        @app = new Application
        @app_view = new ApplicationView(
          model: @app
        )
        $("body").append @app_view.render().el

      routes:
        "": "show_index"

        # Search Repositories
        "search?q=:query": "show_search_result"
        "search": "show_search_form"

        # Show Repository Information
        "repositories": "show_repositories"
        "repositories/new": "show_new_repository"
        "repositories/:repo_name": "show_repository"

      show_new_repository: ->
        new_repo_view = new NewRepositoryView

        @app_view.$el.append new_repo_view.render().el

      show_repositories: ->
        @show_search()

      show_repository: (repo_name)->
        repo_model = new Repository(
          name: repo_name
        )

        repo_model.fetch().done =>
          repo_view = new RepositoryDetailView(
            model: repo_model
          )
          @app_view.$el.append repo_view.render().el

          # load deps
          repo_deps = new RepositoryDependencies(
            []
            {
              repo_name: repo_name
            }
          )

          repo_view.$el.append "<h2>dependencies</h2>"
          repo_deps.fetch().done ->
            repo_deps.each (repo_dep)->
              return if repo_dep.get("name") == repo_model.get("name")
              repo_dep_view = new RepositoryDependencyView(
                model: repo_dep
              )
              repo_view.$el.append repo_dep_view.render().el

      show_index: ->
        index_view = new IndexView(
          model: @app
        )
        @app_view.$el
          .append index_view.render().el

      show_search_form: ->
        repo_search = new RepositorySearch
        repo_search_view = new RepositorySearchView(
          model: repo_search
        )
        @app_view.$el
          .append repo_search_view.render().el

      show_search_result: (query)->
        repo_search_model = new RepositorySearch(
          query: query
        )

        repo_search_view = new RepositorySearchView(
          model: repo_search_model
        )

        @app_view.$el
          .append repo_search_view.render().el
)
