define(
  [
    "marionette"
  ]
  (
    Marionette
  )->
    class HomeView extends Marionette.LayoutView
      template: "#template-home-view"

      className: "row"

      regions:
        mainRegion: ".main-region"
        subRegion: ".sub-region"

      initialize: ->
        @
)
