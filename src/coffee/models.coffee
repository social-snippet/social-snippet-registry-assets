define(
  [
    "app/models/repository"
    "app/models/user_repository"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Models
    Utils.loadModules Models, modules
)
