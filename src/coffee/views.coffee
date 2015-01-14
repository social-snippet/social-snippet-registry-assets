define ->
  class Views
    class @::Layouts
      AppLayoutView: require "views/layouts/app_layout_view"

    class @::Commons
      HeaderView: require "views/commons/header_view"
      FooterView: require "views/commons/footer_view"
      SidebarView: require "views/commons/sidebar_view"

    class @::Contents
      class @::Home
        HomeView: require "views/contents/home/home_view"
        HomeMainRegionView: require "views/contents/home/home_main_region_view"
        HomeSubRegionView: require "views/contents/home/home_sub_region_view"
      class @::Search
        SearchResultsView: require "views/contents/search/search_results_view"
      class @::User
        UserDashboardView: require "views/contents/user/user_dashboard_view"
        UserLoginView: require "views/contents/user/user_login_view"
      NewRepositoryView: require "views/contents/new_repository_view"
      AllRepositoriesView: require "views/contents/repositories/all_repositories_view"

    class @::Components
      LinkView: require "views/components/link_view"
      LinksView: require "views/components/links_view"
      PanelView: require "views/components/panel_view"
      AddRepositoryByUrlView: require "views/components/add_repository_by_url_view"
      AddRepositoryByGitHubView: require "views/components/add_repository_by_github_view"
      GitHubLoginFormView: require "views/components/github_login_form_view"
      RepositoryPanelView: require "views/components/repository_panel_view"
      RepositoryDetailPanelView: require "views/components/repository_detail_panel_view"
      SearchFormPanelView: require "views/components/search_form_panel_view"
      UserRepositoriesView: require "views/components/user_repositories_view"
      UserRepositoryDetailView: require "views/components/user_repository_detail_view"

