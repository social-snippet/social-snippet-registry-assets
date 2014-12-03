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
          new_repo = new Models::Repository()
          new_repo.save(
            url: "https://github.com/#{@$(".new-repo-user").val()}/#{@$(".new-repo-name").val()}"
          )

      className: "well"

      initialize: ->
)
