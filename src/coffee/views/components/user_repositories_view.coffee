define(
  [
    "marionette"
    "views/components/user_repository_view"
  ]
  (
    Marionette
    UserRepositoryView
  )->
    class UserRepositoriesView extends Marionette.CompositeView
      template: "#template-user-repositories-view"
      childView: UserRepositoryView
      className: "panel panel-default"
)
