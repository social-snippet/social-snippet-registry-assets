define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class UserRepository extends Backbone.Model
      urlRoot: "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/user/repositories"
)
