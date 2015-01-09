define(
  [
    "backbone"
    "models/user_repository"
  ]
  (
    Backbone
    UserRepository
  )->
    class UserRepositories extends Backbone.Collection
      model: UserRepository

      url: ->
        "//#{SSPM_WEBAPI_HOST}/api/#{SSPM_WEBAPI_VERSION}/user/repositories"
)
