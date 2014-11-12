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

      template: _.template [
        '<a href="<%- href %>"><%- text %></a>'
      ].join()
)
