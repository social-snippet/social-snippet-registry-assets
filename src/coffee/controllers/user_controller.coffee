define(
  [
    "marionette"
    "views"
    "collections"
    "models"
  ]
  (
    Marionette
    Views
    Collections
    Models
  )->
    class UserController extends Marionette.Controller

      initialize: ->
        @app = require("app")

      dashboard: ->
        user_dashboard_view = new Views::Contents::User::UserDashboardView
        @app.layout.currentView.contentsRegion.show user_dashboard_view

        repos = new Collections::UserRepositories()
        repos.fetch().done ->
          user_dashboard_view.reposRegion.show new Views::Components::UserRepositoriesView
            collection: repos
            childViewContainer: ".repositories"

      repos: (owner_id, repo_id)->
        user_repo = new Collections::UserRepository
          name: "#{owner_id}/#{repo_id}"
        user_repos_view = new Views::Components::UserRepositoryDetailView
          model: user_repo
        @app.layout.currentView.contentsRegion.show user_repos_view
        user_repo.fetch().done =>

      login: ->
        user_login_view = new Views::Contents::User::UserLoginView
        @app.layout.currentView.contentsRegion.show user_login_view
        user_login_view.githubLoginRegion.show new Views::Components::GitHubLoginFormView
)

