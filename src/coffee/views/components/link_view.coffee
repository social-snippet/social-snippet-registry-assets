define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class LinkView extends Marionette.ItemView
      tagName: "li"
      template: "#template-link-view"
)
