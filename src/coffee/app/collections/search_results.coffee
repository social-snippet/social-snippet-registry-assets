define(
  [
    "underscore"
    "app/collections/repositories"
  ]
  (
    _
    Repositories
  )->
    class SearchResults extends Repositories
      set_default_options: ->
        super()
        _(@options).defaults
          query: ""

      url: ->
        "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories?q=#{@options.query}"
)
