define(
  [
    "app/models/application"
    "app/models/repository/repository_search"
    "app/models/repository/repository"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Models
    Utils.loadModules Models, modules
)
