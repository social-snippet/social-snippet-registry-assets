define(
  [
    "jquery"
    "backbone"
    "backbone.marionette"
    "bootstrap"
    "app/collections"
    "app/models"
    "app/views"
  ]
  (
    $
    Backbone
    Bootstrap
    Marionette
    Collections
    Models
    Views
  )->
    class AppRouter extends Backbone.Router

      initialize: ->
        @app = new Models::Application
        @app_view = new Views::ApplicationView(
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
        new_repo_view = new Views::NewRepositoryView

        @app_view.$el.append new_repo_view.render().el

      show_repositories: ->
        @show_search()

      show_repository: (repo_name)->
        repo_model = new Models::Repository(
          name: repo_name
        )

        repo_model.fetch().done =>
          repo_view = new Views::RepositoryDetailView(
            model: repo_model
          )
          @app_view.$el.append repo_view.render().el

          # load deps
          repo_deps = new Collections::RepositoryDependencies(
            []
            {
              repo_name: repo_name
            }
          )

          repo_view.$el.append "<h2>dependencies</h2>"
          repo_deps.fetch().done ->
            repo_deps.each (repo_dep)->
              return if repo_dep.get("name") == repo_model.get("name")
              repo_dep_view = new Views::RepositoryDependencyView(
                model: repo_dep
              )
              repo_view.$el.append repo_dep_view.render().el

      show_index: ->
        index_view = new Views::IndexView(
          model: @app
        )
        @app_view.$el
          .append index_view.render().el

      show_search_form: ->
        repo_search = new Models::RepositorySearch
        repo_search_view = new Views::RepositorySearchView(
          model: repo_search
        )
        @app_view.$el
          .append repo_search_view.render().el

      show_search_result: (query)->
        repo_search_model = new Models::RepositorySearch(
          query: query
        )

        repo_search_view = new Views::RepositorySearchView(
          model: repo_search_model
        )

        @app_view.$el
          .append repo_search_view.render().el
)
