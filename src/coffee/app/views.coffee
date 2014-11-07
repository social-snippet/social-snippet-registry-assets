define(
  [
    "app/views/index_view"
    "app/views/links_view"
    "app/views/new_repository_view"
    "app/views/repositories_view"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Views
    Utils.loadModules Views, modules
)
