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
      template: _.template [
        '<div class="form">'
        '<h3>Add GitHub Repository</h3>'

        '<div class="row">'
        '<div class="col-sm-5"><input type="text" class="form-control input-lg" class="new-repo-user" placeholder="Enter the user name"></div>'
        '<div class="col-sm-5"><input type="text" class="form-control input-lg" class="new-repo-name" placeholder="Enter the repo name"></div>'
        '<div class="col-sm-2"><button class="btn btn-lg btn-primary add" type="button">Add</button></div>'
        '</div>'

        '</div>'
      ].join("")

      events:
        "click .add": ->
          new_repo = new Models::Repository(url: @$("#new-repo-url").val())
          new_repo.save()

      className: "well"

      initialize: ->
)
