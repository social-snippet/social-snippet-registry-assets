define(
  [
    "underscore"
    "backbone.marionette"
    "app/models"
  ]
  (
    _
    Marionette
    Models
  )->
    class NewRepositoryView extends Marionette.ItemView
      template: _.template [
        '<div class="form-group">'
        '<input type="text" class="form-control url">'
        '<button class="btn btn-primary add">Add</button>'
        '</div>'
      ].join("")

      events:
        "click .add": ->
          new_repo = new Models::Repository(url: @$(".url").val())
          new_repo.save()

      className: "form-inline"

      initialize: ->
)
