define ->
  class Views
    class @::Layouts
      @::AppLayoutView = "views/layouts/app_layout_view"
    class @::Commons
      @::HeaderView = require "views/commons/header_view"
      @::FooterView = require "views/commons/footer_view"
      @::SidebarView = require "views/commons/sidebar_view"
    class @::Contents
      class @::Home
        @::HomeView = require "views/contents/home/home_view"
        @::HomeMainRegionView = require "views/contents/home/home_main_region_view"
        @::HomeSubRegionView = require "views/contents/home/home_sub_region_view"
      @::NewRepositoryView = require "views/contents/new_repository_view"
      @::SearchResultsView = "views/contents/search/search_results_view"
      @::AllRepositoriesView = "views/contents/repositories/all_repositories_view"
    class @::Components
      @::LinkView = "views/components/link_view"
      @::LinksView = "views/components/links_view"
      @::PanelView = "views/components/panel_view"
      @::AddRepositoryByUrlView = "views/components/add_repository_by_url_view"
      @::AddRepositoryByGitHubView = "views/components/add_repository_by_github_view"
      @::GitHubLoginFormView = "views/components/github_login_form_view"
      @::RepositoryPanelView = "views/components/repository_panel_view"
      @::RepositoryDetailPanelView = "views/components/repository_detail_panel_view"
