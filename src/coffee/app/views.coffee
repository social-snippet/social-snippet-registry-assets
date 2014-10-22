define(
  [
    "app/views/base_view"
    "app/views/application_view"
    "app/views/index_view"
    "app/views/repository/new_repository_view"
    "app/views/repository/repository_detail_view"
    "app/views/repository/repository_dependency_view"
    "app/views/repository/repository_search_view"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Views
    Utils.loadModules Views, modules
)