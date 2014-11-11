define(
  [
    "underscore"
    "backbone"
    "backbone.marionette"
  ]
  (
    _
    Backbone
    Marionette
  )->
    class SidebarView extends Marionette.LayoutView
      template: _.template [
        '<div class="contents">'
        '</div>'
      ].join("")

      regions:
        contentsRegion: ".contents"

      initialize: ->
        @
)
