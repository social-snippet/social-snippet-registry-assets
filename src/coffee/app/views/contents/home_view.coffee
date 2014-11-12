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
        '<section class="region main-region col-sm-8"></section>'
        '<section class="region sub-region col-sm-4"></section>'
      ].join("")

      className: "row"

      regions:
        mainRegion: ".main-region"
        subRegion: ".sub-region"

      initialize: ->
        @
)
