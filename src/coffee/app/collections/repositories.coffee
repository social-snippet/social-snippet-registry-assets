define(
  [
    "backbone"
    "app/models/repository"
  ]
  (
    Backbone
    Repository
  )->
    class Repositories extends Backbone.Collection
      model: Repository

      set_default_options: ->
        @options.query ||= ""

      url: ->
        if @options.query == ""
          "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories"
        else
          "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories?q=#{@options.query}"

      initialize: (models, new_options)->
        @options = new_options
        @options ||= {}
        @set_default_options()

      search: (query)->
        @options.query = query
        @fetch()
)
