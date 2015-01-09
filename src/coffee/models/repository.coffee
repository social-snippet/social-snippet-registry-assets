define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class Repository extends Backbone.Model
      defaults: ->
        latest_version: undefined
        github_link: undefined

      idAttribute: "name"

      urlRoot: "//#{SSPM_WEBAPI_HOST}/api/#{SSPM_WEBAPI_VERSION}/repositories"

      initialize: ->
        @initGitHubLink()

      initGitHubLink: ->
        repoUrl = @get("url")
        # TODO: improve here
        if /:\/\/github\.com/.test(repoUrl)
          @set "github_link", " - <a href=\"#{repoUrl}\"><i class=\"fa fa-github\" /></a>"

)
