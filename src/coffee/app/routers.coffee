define(
  [
    "app/routers/app_router"
  ]
  ->
    class Routers
    Utils.loadModules.bind(@, Routers).apply @, arguments
)
