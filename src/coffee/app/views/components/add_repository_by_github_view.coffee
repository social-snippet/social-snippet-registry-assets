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
    class AddRepositoryByGitHubView extends Marionette.ItemView
      template: "#template-add-repository-by-github-view"

      events:
        "click .add": ->
          new_repo = new Models::Repository(url: @$("#new-repo-url").val())
          new_repo.save()

      className: "well"

      initialize: ->
)
