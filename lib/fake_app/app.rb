module FakeApp

  require "social_snippet/registry_views"
  require "padrino"

  class App < ::Padrino::Application

    register ::Padrino::Helpers

    set :protection, false
    set :protect_from_csrf, false
    disable :sessions
    use Rack::Session::Pool, :key => "rack.session", :path => '/', :expire_after => nil
    use Rack::Protection
    use Rack::Protection::AuthenticityToken, :authenticity_param => "_csrf_token"

    helpers do
      
      def assets_host
        ""
      end

      def csrf_token
        "dummy_token"
      end

      def is_logged_in
        session[:fake_login]
      end

    end

    set :views, ::SocialSnippet::RegistryViews::CommonViews.view_path("")
    layout :application_view

    get "/user/logout" do
      session.destroy
      redirect "/user/login"
    end

    get "/user/auth/github" do
      session[:fake_login] = true
      redirect "/user/dashboard"
    end
    
    get "*" do
      render :empty_view
    end

  end

end
