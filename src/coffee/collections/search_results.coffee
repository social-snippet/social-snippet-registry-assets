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
        "//#{SSPM_WEBAPI_HOST}/api/#{SSPM_WEBAPI_VERSION}/repositories?q=#{options.query}"
)
