define(
  [
    "backbone"
    "backbone.marionette"
    "app/views"
  ]
  (
    Backbone
    Marionette
    Views
  )->
    class HomeController extends Marionette.Controller
      index: ->
        home_view = new Views::HomeView
        app.layout.currentView.contentsRegion.show home_view

        welcome_panel = new Views::PanelView
        home_view.mainRegion.show welcome_panel

        welcome_panel.headRegion.show new Marionette.ItemView
          template: _.template [
            '<h4>Welcome to SSPM Registry</h4>'
          ].join("\n")

        welcome_panel.bodyRegion.show new Marionette.ItemView
          template: _.template [
            '$ sspm install {snippet-name}'
          ].join("\n")
)
