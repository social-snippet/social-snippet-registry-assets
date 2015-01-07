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
        "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories"

      initialize: (models, new_options)->
        @options = new_options
        @options ||= {}
        @set_default_options()
)
