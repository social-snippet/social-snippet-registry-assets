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

      events:
        "click .btn-github": "login"

      login: ->
        app.vent.trigger "login:github"
)
