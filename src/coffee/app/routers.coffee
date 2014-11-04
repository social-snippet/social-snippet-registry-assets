define(
  [
    "app/routers/app_router"
    "app/routers/index_router"
    "app/routers/search_repository_router"
    "app/routers/repositories_router"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Routers
    Utils.loadModules Routers, modules
)
