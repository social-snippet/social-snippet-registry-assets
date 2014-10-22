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
    class Views
    Utils.loadModules.bind(@, Views).apply @, arguments
)
