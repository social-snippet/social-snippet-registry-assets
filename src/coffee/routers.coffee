define(
  [
    "app/routers/home_router"
    "app/routers/new_router"
    "app/routers/search_router"
    "app/routers/repositories_router"
    "app/routers/user_router"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Routers
    Utils.loadModules Routers, modules
)
