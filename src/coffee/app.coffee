define(
  [
    "backbone"
    "marionette"
    "controllers"
    "routers"
    "views"
  ]
  (
    Backbone
    Marionette
    Controllers
    Routers
    Views
  )->
    # NOTE: returns instance of App
    new class App extends Marionette.Application

      regions:
        layout: "#app-root"

      initialize: (options)->

        channel = Backbone.Wreqr.radio.channel("global")

        @on "start", ->

          #
          # views
          #
          layout_view = new Views::Layouts::AppLayoutView()
          header_view = new Views::Commons::HeaderView()
          footer_view = new Views::Commons::FooterView()
          sidebar_view = new Views::Commons::SidebarView()

          @layout.show layout_view.render()
          layout_view.headerRegion.show header_view
          layout_view.footerRegion.show footer_view
          layout_view.sidebarRegion.show sidebar_view

          #
          # routers
          #
          new Routers::HomeRouter
            controller: new Controllers::HomeController

          new Routers::SearchRouter
            controller: new Controllers::SearchController

          # repositories
          repos_router = new Routers::RepositoriesRouter
            controller: new Controllers::RepositoriesController

          channel.vent.on "router:repositories:navigate", (repo_name)->
            repos_router.navigate "repos/r/#{repo_name}", trigger: true

          user_router = new Routers::UserRouter
            controller: new Controllers::UserController

          channel.vent.on "login:github", ->
            location.href = "/user/auth/github"

          Backbone.history.start(
            root: "/"
            pushState: true
          )
)
