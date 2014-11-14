define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class GitHubLoginFormView extends Marionette.ItemView
      template: "#template-github-login-form-view"
)
