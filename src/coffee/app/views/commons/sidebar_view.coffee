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
        '<section class="navigation region"></section>'
      ].join("")

      className: "view sidebar"

      regions:
        navigationRegion: ".navigation.region"

      initialize: ->
        @
)
