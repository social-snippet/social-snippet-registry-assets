define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class HomeView extends Marionette.LayoutView
      template: _.template [
        '<section class="main"></section>'
      ].join("")

      regions:
        mainRegion: ".main"

      initialize: ->
        @
)
