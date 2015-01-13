define(
  [
    "backbone"
    "marionette"
  ]
  (
    Backbone
    Marionette
  )->
    class GitHubLoginFormView extends Marionette.ItemView
      template: "#template-github-login-form-view"

      events:
        "click .btn-github": "login"

      login: ->
        Backbone.Wreqr.radio.vent.trigger("global", "login:github")
)
