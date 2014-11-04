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
    class IndexController extends Marionette.Controller
      index: ->
        index_view = new Views::IndexView
        app.main.show index_view

        index_view.menu.show new Views::LinksView(
          collection: new Backbone.Collection [
            {
              text: "Add"
              href: "/repositories/new"
            }
            {
              text: "Search"
              href: "/search"
            }
          ]
        )
)
