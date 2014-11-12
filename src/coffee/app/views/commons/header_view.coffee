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
      template: _.template [
        '<a class="navbar-brand" href="/"><%- "SSPM Registry System" %></a>'
      ].join("")

      className: "navbar navbar-inverse navbar-fixed-top"

      initialize: ->
        @
)
