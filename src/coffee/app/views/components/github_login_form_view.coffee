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
      template: _.template [
        '<a class="btn btn-block btn-social btn-github"><i class="fa fa-github"></i> Sign in with GitHub</a>'
      ].join()
)
