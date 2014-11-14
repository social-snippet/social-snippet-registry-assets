define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class FooterView extends Marionette.LayoutView
      template: "#template-footer-view"

      className: "container"

      initialize: ->
        @
)
