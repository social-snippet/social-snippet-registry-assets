define(
  [
    "app/controllers/index_controller"
    "app/controllers/search_repository_controller"
    "app/controllers/repositories_controller"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Controllers
    Utils.loadModules Controllers, modules
)
