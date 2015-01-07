define(
  [
    "marionette"
  ]
  (
    Marionette
  )->
    class FooterView extends Marionette.LayoutView
      template: "#template-footer-view"

      className: "container"

      initialize: ->
        @
)
