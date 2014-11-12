define(
  [
    "backbone"
    "backbone.marionette"
    "app/views/components/links_view"
  ]
  (
    Backbone
    Marionette
    LinksView
  )->
    class NavigationRegionView extends LinksView
      className: "nav"
      collection: new Backbone.Collection [
        {
          text: "Home"
          href: "/"
        }
        {
          text: "Add Repository"
          href: "/new/repository"
        }
        {
          text: "Search"
          href: "/search"
        }
      ]
)
