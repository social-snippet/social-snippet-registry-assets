define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class Repository extends Backbone.Model
      defaults: ->
        githubLink: ""

      idAttribute: "name"

      urlRoot: "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories"

      initialize: ->
        @initGitHubLink()

      initGitHubLink: ->
        repoUrl = @get("url")
        # TODO: improve here
        if /:\/\/github\.com/.test(repoUrl)
          @set "githubLink", "<a href=\"#{repoUrl}\"><i class=\"fa fa-github\" /></a>"

)
