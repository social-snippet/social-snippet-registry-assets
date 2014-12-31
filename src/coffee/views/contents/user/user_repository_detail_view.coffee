define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class UserRepositoryDetailView extends Marionette.LayoutView
      template: "#template-user-repository-detail-view"
      className: "panel panel-default"

      events:
        "click .action-update": "update"
        "click .action-disable": "disable"

      update: ->
        console.debug "update #{@model.get("name")}"

      disable: ->
        console.debug "disable #{@model.get("name")}"
)
