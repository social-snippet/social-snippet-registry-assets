define(
  [
    "backbone"
    "models/repository"
  ]
  (
    Backbone
    Repository
  )->
    class Repositories extends Backbone.Collection
      model: Repository

      set_default_options: ->

      url: ->
        "//#{SSPM_WEBAPI_HOST}/api/#{SSPM_WEBAPI_VERSION}/repositories"

      initialize: (models, new_options)->
        @options = new_options
        @options ||= {}
        @set_default_options()
)
