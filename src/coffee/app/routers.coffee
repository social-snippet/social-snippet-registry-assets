define(
  [
    "app/routers/app_router"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Routers
    Utils.loadModules Routers, modules
)