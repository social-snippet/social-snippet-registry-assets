define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class AppLayoutView extends Marionette.LayoutView
      template: "#template-app-layout-view"

      regions:
        headerRegion: "header"
        sidebarRegion: ".sidebar-region"
        contentsRegion: ".contents-region"
        footerRegion: "footer"

      initialize: ->
        @
)
