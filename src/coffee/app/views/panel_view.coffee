define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class PanelView extends Marionette.LayoutView
      tagName: "div"

      template: _.template [
        '<div class="panel-heading"></div>'
        '<div class="panel-body"></div>'
      ].join("")

      regions:
        headRegion: ".panel-heading"
        bodyRegion: ".panel-body"

      className: "panel panel-default"
)
