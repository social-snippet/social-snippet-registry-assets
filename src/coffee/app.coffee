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

        @addInitializer ->
          layout_view = new Views::Layouts::AppLayoutView()
          header_view = new Views::Commons::HeaderView()
          footer_view = new Views::Commons::FooterView()
          sidebar_view = new Views::Commons::SidebarView()

          @layout.show layout_view.render()
          layout_view.headerRegion.show header_view
          layout_view.footerRegion.show footer_view
          layout_view.sidebarRegion.show sidebar_view

        @addInitializer ->
          new Routers::HomeRouter
            controller: new Controllers::HomeController

        @addInitializer ->
          new Routers::NewRouter
            controller: new Controllers::NewController

        @addInitializer ->
          new Routers::SearchRouter
            controller: new Controllers::SearchController

        @addInitializer ->
          router = new Routers::RepositoriesRouter
            controller: new Controllers::RepositoriesController

          channel.vent.on "router:repositories:navigate", (repo_name)->
            router.navigate "repositories/#{repo_name}", trigger: true

        @addInitializer =>
          user_router = new Routers::UserRouter
            controller: new Controllers::UserController

        channel.vent.on "login:github", ->
          location.href = "/user/auth/github"

        @on "start", ->
          Backbone.history.start(
            root: "/"
            pushState: true
          )
)
