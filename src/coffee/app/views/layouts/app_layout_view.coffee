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
      template: _.template [
        '<header class="region"></header>'
        '<div class="container-fluid">'
        '  <section class="region sidebar-region col-sm-3"></section>'
        '  <section class="region contents-region col-sm-9"></section>'
        '</div>'
        '<footer class="region"></footer>'
      ].join("")

      regions:
        headerRegion: "header"
        sidebarRegion: ".sidebar-region"
        contentsRegion: ".contents-region"
        footerRegion: "footer"

      initialize: ->
        @
)
