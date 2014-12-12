define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class SearchFormPanelView extends Marionette.ItemView
      tagName: "tr"
      template: "#template-user-repository-view"
)
