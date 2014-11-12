define(
  [
    "app/views/layouts/app_layout_view"

    "app/views/commons/header_view"
    "app/views/commons/footer_view"
    "app/views/commons/sidebar_view"

    "app/views/contents/home_view"
    "app/views/contents/new_repository_view"
    "app/views/contents/sidebar/navigation_region_view"

    "app/views/components/link_view"
    "app/views/components/links_view"
    "app/views/components/panel_view"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Views
    Utils.loadModules Views, modules
)
