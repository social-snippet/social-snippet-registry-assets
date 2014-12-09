# Usage:
#     $ bundle exec thin -a 127.0.0.1 -p 19292 start
#     -> http://127.0.0.1:19292/js/main.js

require "bundler/setup"
require "padrino"
require "social_snippet/registry_core"
::Padrino.configure_apps do
  set :sspm_session, false
  extend ::SocialSnippet::RegistryCore::ConfigHelpers

  helpers do
    # fake session
    def logged_in?
      false
    end
  end
end

require "sprockets"

# pass host name into views
use(
  ::Class.new do
    def initialize(app)
      @app = app
    end

    def call(env)
      $env_http_host = env["HTTP_HOST"]
      @app.call(env)
    end
  end
)

# returns compiled scripts
map "/js/app" do
  env = ::Sprockets::Environment.new
  env.append_path "src/coffee/"
  run env
end

map "/js" do
  env = ::Sprockets::Environment.new

  env.context_class.class_eval do
    def assets_host
      if $env_http_host.nil?
        ""
      else
        "//#{$env_http_host}"
      end
    end
  end

  env.append_path "lib/assets/js/"
  env.append_path "tmp/js/lib/"
  env.append_path "src/coffee/"

  run env
end

map "/bower" do
  env = ::Sprockets::Environment.new
  env.append_path "bower_components/"
  run env
end

map "/css" do
  env = ::Sprockets::Environment.new
  env.append_path "src/sass/"
  env.append_path "src/css/"
  env.append_path "lib/assets/css/"
  env.append_path "tmp/css/lib/"
  run env
end

map "/fonts" do
  env = ::Sprockets::Environment.new
  env.append_path "bower_components/bootstrap/fonts"
  env.append_path "bower_components/font-awesome/fonts"
  run env
end

map "/mock" do
  require_relative "lib/mock/app"
  run Mock::App
end

map "/mock/js" do
  env = ::Sprockets::Environment.new

  env.context_class.class_eval do
    def assets_host
      if $env_http_host.nil?
        ""
      else
        "//#{$env_http_host}"
      end
    end
  end

  env.append_path "lib/mock/assets/coffee/"
  env.append_path "tmp/js/lib/"
  env.append_path "tmp/js/app/"

  run env
end

map "/" do
  require "social_snippet/registry/app/app"
  run ::SocialSnippet::Registry::App
end

map "/user" do
  require "social_snippet/registry/user_pages/app"
  run ::SocialSnippet::Registry::UserPages
end

