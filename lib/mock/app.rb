require "sinatra/base"
require "slim"
require "social_snippet/registry"

module Mock
  class App < Sinatra::Base
    # fake helpers
    helpers do
      def csrf_token
        "dummy"
      end

      def logged_in?
        false
      end

      def assets_host
        "/mock"
      end
    end

    get "/" do
      slim :home, :layout => :application, :layout_options => {
        :views => ::SocialSnippet::Registry::App.layout_path("")
      }
    end
  end
end
