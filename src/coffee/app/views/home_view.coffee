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
        '<section class="menu"></section>'
      ].join("")

      regions:
        menu: ".menu"

      initialize: ->
        @
)
