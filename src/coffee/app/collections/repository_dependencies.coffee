define(
  [
    "backbone"
    "app/models/repository/repository"
    "app/models/repository/repository_dependency"
  ]
  (
    Backbone
    Repository
    RepositoryDependency
  )->
    class RepositoryDependencies extends Backbone.Collection
      model: RepositoryDependency

      set_default_options: ->
        @options.repo_name ||= ""

      url: ->
        @set_default_options()
        "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories/#{@options.repo_name}/dependencies"

      initialize: (models, new_options)->
        @options = new_options
        @options ||= {}
)
