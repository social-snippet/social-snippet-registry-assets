define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class RepositoryView extends Marionette.ItemView
      tagName: "div"

      template: _.template [
        '<p>name: <%- name %></p>'
        '<p>desc: <%- desc %></p>'
      ].join("")

    class RepositoriesView extends Marionette.CollectionView
      tagName: "div"
      childView: RepositoryView
      initialize: ->
)
