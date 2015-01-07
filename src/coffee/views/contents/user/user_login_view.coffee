define(
  [
    "marionette"
  ]
  (
    Marionette
  )->
    class UserLoginView extends Marionette.LayoutView
      template: "#template-user-login-view"

      regions:
        githubLoginRegion: ".region.github-login-region"

      initialize: ->
        @
)
