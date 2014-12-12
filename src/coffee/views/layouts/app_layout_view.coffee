define(
  [
    "underscore"
    "jquery"
    "backbone.marionette"
  ]
  (
    _
    $
    Marionette
  )->
    class AppLayoutView extends Marionette.LayoutView
      template: "#template-app-layout-view"

      events:
        "click .link": (event)->
          event.preventDefault()
          location.href = $(event.target).attr("href")
          false

      regions:
        headerRegion: "header"
        sidebarRegion: ".sidebar-region"
        contentsRegion: ".contents-region"
        footerRegion: "footer"

      initialize: ->
        @
)
