define(
  [
    "backbone.marionette"
    "app/views/contents/user/user_login_view"
    "app/views/contents/user/user_dashboard_view"
    "app/views/contents/user/user_repository_detail_view"
    "app/views/components/github_login_form_view"
    "app/views/components/user_repositories_view"
    "app/collections/user_repositories"
    "app/models/user_repository"
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

