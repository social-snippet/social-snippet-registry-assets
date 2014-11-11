define(
  [
    "app/views/app_layout_view"

    "app/views/header_view"
    "app/views/footer_view"
    "app/views/sidebar_view"

    "app/views/home_view"
    "app/views/links_view"
    "app/views/new_repository_view"
    "app/views/repositories_view"

    "app/views/panel_view"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Views
    Utils.loadModules Views, modules
)
