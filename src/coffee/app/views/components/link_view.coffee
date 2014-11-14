define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class LinkView extends Marionette.ItemView
      tagName: "li"
      template: "#template-link-view"
)
