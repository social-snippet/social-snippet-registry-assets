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
      template: _.template [
        '<div class="form">'
        '<h3>Add Repository by URL</h3>'

        '<div class="row">'
        '<div class="col-sm-10"><input type="text" class="form-control input-lg" class="new-repo-url" placeholder="Enter the URL of repository"></div>'
        '<div class="col-sm-2"><button class="btn btn-lg btn-primary add" type="button">Add</button></div>'
        '</div>'

        '</div>'
      ].join("")

      events:
        "click .add": ->
          new_repo = new Models::Repository(url: @$(".new-repo-url").val())
          new_repo.save()

      className: "well"

      initialize: ->
)
