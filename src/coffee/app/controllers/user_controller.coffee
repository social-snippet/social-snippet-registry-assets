define(
  [
    "underscore"
    "backbone"
    "backbone.marionette"
    "app/views/contents/user/user_login_view"
    "app/views/components/github_login_form_view"
  ]
  (
    _
    Backbone
    Marionette
    UserLoginView
    GitHubLoginFormView
  )->
    class UserController extends Marionette.Controller
      login: ->
        user_login_view = new UserLoginView
        app.layout.currentView.contentsRegion.show user_login_view
        user_login_view.githubLoginRegion.show new GitHubLoginFormView
)

