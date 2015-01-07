define(
  [
    "marionette"
  ]
  (
    Marionette
  )->
    class SidebarView extends Marionette.LayoutView
      template: "#template-sidebar-view"

      className: "view sidebar"

      regions:
        navigationRegion: ".navigation-region"

      initialize: ->
        @
)
