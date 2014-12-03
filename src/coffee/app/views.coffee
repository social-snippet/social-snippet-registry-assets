define(
  [
    "app/views/layouts/app_layout_view"

    "app/views/commons/header_view"
    "app/views/commons/footer_view"
    "app/views/commons/sidebar_view"

    "app/views/contents/home_view"
    "app/views/contents/home/home_main_region_view"
    "app/views/contents/home/home_sub_region_view"
    "app/views/contents/new_repository_view"
    "app/views/contents/search/search_results_view"
    "app/views/contents/repositories/all_repositories_view"

    "app/views/components/link_view"
    "app/views/components/links_view"
    "app/views/components/panel_view"
    "app/views/components/add_repository_by_url_view"
    "app/views/components/add_repository_by_github_view"
    "app/views/components/github_login_form_view"
    "app/views/components/repository_panel_view"
    "app/views/components/repository_detail_panel_view"
  ]
  ->
    modules = Array::splice.call(arguments, 0)
    class Views
    Utils.loadModules Views, modules
)
