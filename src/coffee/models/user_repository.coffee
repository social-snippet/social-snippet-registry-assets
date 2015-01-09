define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class UserRepository extends Backbone.Model
      idAttribute: "name"
      urlRoot: "//#{SSPM_WEBAPI_HOST}/api/#{SSPM_WEBAPI_VERSION}/user/repositories"
)
