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

        home_view.mainRegion.show new Views::HomeMainRegionView
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

        sub_region_view = new Views::HomeSubRegionView
        home_view.subRegion.show sub_region_view
        sub_region_view.githubLoginRegion.show new Views::GitHubLoginFormView

)
