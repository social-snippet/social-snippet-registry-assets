define(
  [
    "underscore"
    "marionette"
  ]
  (
    _
    Marionette
  )->
    class NewRepositoryView extends Marionette.LayoutView
      template: _.template [
        '<section class="region by-url-region"></section>'
        '<section class="region by-github-region"></section>'
      ].join("")

      regions:
        byUrlRegion: ".by-url-region"
        byGitHubRegion: ".by-github-region"

      initialize: ->
        @
)
