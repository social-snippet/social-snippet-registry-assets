define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class Repository extends Backbone.Model
      idAttribute: "name"

      urlRoot: "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories"

      initialize: ->
)
