define(
  [
    "backbone"
    "marionette"
    "views"
    "collections"
    "models"
  ]
  (
    Backbone
    Marionette
    Views
    Collections
    Models
  )->
    class UserController extends Marionette.Controller

      initialize: ->
        @App = require("app")

      dashboard: ->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "User Dashboard"

        user_dashboard_view = new Views::Contents::User::UserDashboardView
        @App.layout.currentView.contentsRegion.show user_dashboard_view

        repos = new Collections::UserRepositories()
        repos.fetch().done ->
          user_dashboard_view.reposRegion.show new Views::Components::UserRepositoriesView
            collection: repos
            childViewContainer: ".repositories"

      repos: (owner_id, repo_id)->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "#{owner_id}/#{repo_id} - User Repository"

        user_repo = new Models::UserRepository
          name: "#{owner_id}/#{repo_id}"
        user_repos_view = new Views::Components::UserRepositoryDetailView
          model: user_repo
        @App.layout.currentView.contentsRegion.show user_repos_view
        user_repo.fetch().done =>

      login: ->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "Login"

        user_login_view = new Views::Contents::User::UserLoginView
        @App.layout.currentView.contentsRegion.show user_login_view
        user_login_view.githubLoginRegion.show new Views::Components::GitHubLoginFormView
)

