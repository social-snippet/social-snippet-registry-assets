define(
  [
    "backbone.marionette"
    "app/views/contents/user/user_login_view"
    "app/views/contents/user/user_dashboard_view"
    "app/views/components/github_login_form_view"
    "app/views/components/user_repositories_view"
    "app/collections/user_repositories"
  ]
  (
    Marionette

    UserLoginView
    UserDashboardView
    GitHubLoginFormView
    UserRepositoriesView

    UserRepositories
  )->
    class UserController extends Marionette.Controller
      dashboard: ->
        user_dashboard_view = new UserDashboardView
        app.layout.currentView.contentsRegion.show user_dashboard_view

        repos = new UserRepositories()
        repos.fetch().done ->
          user_dashboard_view.reposRegion.show new UserRepositoriesView
            collection: repos
            childViewContainer: ".repositories"

      login: ->
        user_login_view = new UserLoginView
        app.layout.currentView.contentsRegion.show user_login_view
        user_login_view.githubLoginRegion.show new GitHubLoginFormView
)

