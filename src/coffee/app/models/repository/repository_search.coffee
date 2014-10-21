define(
  [
    "app/collections/repositories"
    "./repository_search_form"
  ]
  (
    Repositories
    RepositorySearchForm
  )->
    class RepositorySearch extends Backbone.Model
      defaults: ->
        query: ""
        repositories: new Repositories
        search_form: new RepositorySearchForm

      initialize: ->
        query = @get("query")
        repositories = @get("repositories")

        repositories.on "sync", ->

        unless query
          query = ""

        unless query == ""
          repositories.search query
)
