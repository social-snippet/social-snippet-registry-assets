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
        '<header></header>'
        '<div class="container-fluid">'
        '  <section id="sidebar" class="col-sm-3"></section>'
        '  <section id="contents" class="col-sm-9"></section>'
        '</div>'
        '<footer></footer>'
      ].join("")

      regions:
        headerRegion: "header"
        sidebarRegion: "#sidebar"
        contentsRegion: "#contents"
        footerRegion: "footer"

      initialize: ->
        @
)
