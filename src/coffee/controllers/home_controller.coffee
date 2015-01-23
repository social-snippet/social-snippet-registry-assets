define(
  [
    "backbone"
    "marionette"
    "views"
  ]
  (
    Backbone
    Marionette
    Views
  )->
    class HomeController extends Marionette.Controller

      initialize: ->
        @app = require("app")

      index: ->
        Backbone.Wreqr.radio.vent.trigger "global", "change:title", "Social Snippet Registry System"

        home_view = new Views::Contents::Home::HomeView

        @app.layout.currentView.contentsRegion.show home_view

        home_view.mainRegion.show new Views::Contents::Home::HomeMainRegionView
          collection: new Backbone.Collection [
            {
              head: "Welcome to SSPM Registry System"
              body: "$ sspm install {snippet-name}"
            }
            {
              head: "What's New"
              body: "xxxx xxxx"
            }
          ]

        sub_region_view = new Views::Contents::Home::HomeSubRegionView
        home_view.subRegion.show sub_region_view
        sub_region_view.githubLoginRegion.show new Views::Components::GitHubLoginFormView

)
