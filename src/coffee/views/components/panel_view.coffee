define(
  [
    "underscore"
    "marionette"
  ]
  (
    _
    Marionette
  )->
    class PanelView extends Marionette.ItemView
      tagName: "div"

      template: _.template [
        '<div class="panel-heading"><%- head %></div>'
        '<div class="panel-body"><%- body %></div>'
      ].join("")

      className: "panel panel-default"
)
