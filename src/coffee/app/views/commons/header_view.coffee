define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class HeaderView extends Marionette.LayoutView
      template: "#template-header-view"

      className: "navbar navbar-inverse navbar-fixed-top"

      initialize: ->
        @
)
