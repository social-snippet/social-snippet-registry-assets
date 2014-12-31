define(
  [
    "app/collections/repositories"
    "app/collections/search_results"
    "app/collections/user_repositories"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Collections
    Utils.loadModules Collections, modules
)
