define(
  [
    "app/collections/repositories"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Collections
    Utils.loadModules Collections, modules
)
