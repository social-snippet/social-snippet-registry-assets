define(
  [
    "underscore"
    "collections/repositories"
  ]
  (
    _
    Repositories
  )->
    class SearchResults extends Repositories
      initialize: (models, new_options)->
        @options = new_options
        @options ||= {}
        @set_default_options()

      set_default_options: ->
        super()
        _(@options).defaults
          query: ""

      url: ->
        "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories?q=#{@options.query}"
)
