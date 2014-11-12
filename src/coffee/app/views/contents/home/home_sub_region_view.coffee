define(
  [
    "backbone"
    "backbone.marionette"
  ]
  (
    Backbone
    Marionette
  )->
    class HomeSubRegionView extends Marionette.LayoutView
      template: _.template [
        '<section class="region github-login-region"></section>'
      ].join("\n")

      regions:
        githubLoginRegion: ".github-login-region"
)
