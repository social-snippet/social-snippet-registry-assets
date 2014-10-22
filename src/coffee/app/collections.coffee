define(
  [
    "app/collections/repository_dependencies"
  ]
  ->
    class Collections
    Utils.loadModules.bind(@, Collections).apply @, arguments
)
