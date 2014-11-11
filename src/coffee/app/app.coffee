define(
  [
    "app/collections"
    "app/controllers"
    "app/models"
    "app/routers"
    "app/views"
    "backbone"
    "backbone.marionette"
  ]
  (
    Collections
    Controllers
    Models
    Routers
    Views
    Backbone
    Marionette
  )->
    class App extends Marionette.Application
      regions:
        layout: "#main-container"

      initialize: (options)->

        @addInitializer ->
          layout_view = new Views::AppLayoutView()
          header_view = new Views::HeaderView()
          footer_view = new Views::FooterView()
          sidebar_view = new Views::SidebarView()

          @layout.show layout_view.render()
          layout_view.headerRegion.show header_view
          layout_view.footerRegion.show footer_view
          layout_view.sidebarRegion.show sidebar_view

          sidebar_view.contentsRegion.show new Views::LinksView(
            className: "nav"
            collection: new Backbone.Collection [
              {
                text: "Home"
                href: "/"
              }
              {
                text: "Add Repository"
                href: "/new"
              }
              {
                text: "Search"
                href: "/search"
              }
            ]
          )

        @addInitializer ->
          new Routers::HomeRouter(
            controller: new Controllers::HomeController(
            )
          )

        @addInitializer ->
          new Routers::SearchRepositoryRouter(
            controller: new Controllers::SearchRepositoryController(
            )
          )

        @addInitializer ->
          new Routers::RepositoriesRouter(
            controller: new Controllers::RepositoriesController(
            )
          )

        @on "start", ->
          Backbone.history.start(
            pushState: true
          )
)
