define(
  [
    "marionette"
    "views/contents/user/user_login_view"
    "views/contents/user/user_dashboard_view"
    "views/contents/user/user_repository_detail_view"
    "views/components/github_login_form_view"
    "views/components/user_repositories_view"
    "collections/user_repositories"
    "models/user_repository"
  ]
  (
    Marionette

    # views
    UserLoginView
    UserDashboardView
    UserRepositoryDetailView
    GitHubLoginFormView
    UserRepositoriesView

    # collections
    UserRepositories

    # models
    UserRepository
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

      repos: (owner_id, repo_id)->
        user_repo = new UserRepository
          name: "#{owner_id}/#{repo_id}"
        user_repos_view = new UserRepositoryDetailView
          model: user_repo
        app.layout.currentView.contentsRegion.show user_repos_view
        user_repo.fetch().done =>

      login: ->
        user_login_view = new UserLoginView
        app.layout.currentView.contentsRegion.show user_login_view
        user_login_view.githubLoginRegion.show new GitHubLoginFormView
)

