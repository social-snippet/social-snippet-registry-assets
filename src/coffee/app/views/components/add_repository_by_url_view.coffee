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
    class AddRepositoryByUrlView extends Marionette.ItemView
      template: "#template-add-repository-by-url-view"

      events:
        "click .add": ->
          new_repo = new Models::Repository(url: @$(".new-repo-url").val())
          new_repo.save()

      className: "well"

      initialize: ->
)
