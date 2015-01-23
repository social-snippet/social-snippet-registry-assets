define(
  [
    "backbone"
    "marionette"
    "models"
  ]
  (
    Backbone
    Marionette
    Models
  )->
    class AddRepositoryByGitHubView extends Marionette.ItemView

      initialize: ->
        @App = require("app")

      template: "#template-add-repository-by-github-view"

      events:
        "click .add": "addRepository"

      addRepository: ->
        new_repo = new Models::Repository()
        deferred = new_repo.save
          url: "https://github.com/#{@$(".new-repo-user").val()}/#{@$(".new-repo-name").val()}"
        button = @$(".add")
        button.text "Doing..."
        button.prop "disabled", true
        deferred
          .then (repo)->
            button.text "Done"
            Backbone.Wreqr.radio.vent.trigger "global", "router:repositories:navigate", repo.name
          .then null, (error)->
            button.text "Fail"
            button.addClass "btn-danger"

      className: "well"

)
