define(
  [
    "backbone"
    "app/models/user_repository"
  ]
  (
    Backbone
    UserRepository
  )->
    class UserRepositories extends Backbone.Collection
      model: UserRepository

      url: ->
        "//#{WEB_API_HOST}/api/#{WEB_API_VERSION}/user/repositories"
)
