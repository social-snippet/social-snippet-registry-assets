define(
  [
    "app/collections/repositories"
    "app/collections/search_results"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Collections
    Utils.loadModules Collections, modules
)
