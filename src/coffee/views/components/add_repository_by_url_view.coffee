define(
  [
    "marionette"
    "models"
  ]
  (
    Marionette
    Models
  )->
    class AddRepositoryByUrlView extends Marionette.ItemView
      template: "#template-add-repository-by-url-view"

      events:
        "click .add": ->
          new_repo = new Models::Repository()
          new_repo.save(
            url: @$(".new-repo-url").val()
          )

      className: "well"

      initialize: ->
)
