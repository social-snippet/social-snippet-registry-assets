# Examples:
#     $ bundle exec thin -a 127.0.0.1 -p 19292 start
#     -> http://127.0.0.1:19292/js/main.js
#
#     $ SSPM_DEBUG=true bundle exec rackup
#
#     $ SSPM_WEBPACK_DEV_SERVER=true bundle exec rackup

require "bundler/setup"
require "sprockets"
require "padrino"
require "rack/reverse_proxy"

#
# JavaScript
#
map "/js" do
  if ENV["SSPM_WEBPACK_DEV_SERVER"] === "true"
    logger.info "Enable Webpack Dev Server"
    use Rack::ReverseProxy do
      reverse_proxy /^\/(.*)/, "http://localhost:18181/$1"
    end
  else
    logger.info "Disable Webpack Dev Server"
    env = Sprockets::Environment.new
    env.append_path "dist/js"
    run env
  end
end

#
# CSS / Others
#
map "/css" do
  env = Sprockets::Environment.new
  env.append_path "src/sass/"
  env.append_path "src/css/"
  env.append_path "lib/assets/css/"
  run env
end

#
# Mock
#
map "/mock" do
  require_relative "lib/mock/app"
  run Mock::App
end

map "/mock/js" do
  env = Sprockets::Environment.new

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

#
# Fake Apps
#

# pass host name into views
use(
  Class.new do
    def initialize(app)
      @app = app
    end

    def call(env)
      $env_http_host = env["HTTP_HOST"]
      @app.call(env)
    end
  end
)

# global
$debug_logged_in = false

Padrino.configure_apps do
  logger.info "Configure [Assets]: #{self}"

  set :sspm_session, false
  @app_no_config = true

  set :sspm_debug, ENV["SSPM_DEBUG"] === "true"
  logger.info "Enable Debug Mode: #{self}" if settings.sspm_debug

  helpers do
    # fake session
    def logged_in?
      $debug_logged_in
    end

    def assets_host
      if $env_http_host.nil?
        ""
      else
        "//#{$env_http_host}"
      end
    end
  end
end

map "/" do
  require "social_snippet/registry/app/app"
  run SocialSnippet::Registry::App
end

map "/user" do
  require "social_snippet/registry/user_pages/app"
  run SocialSnippet::Registry::UserPages
end

# Fake Authentication (it works on local debug mode)
map "/user/auth/github" do
  class FakeLogin < Padrino::Application
    get :index do
      $debug_logged_in = (not $debug_logged_in) if settings.sspm_debug
      redirect "/user/dashboard"
    end
  end
  run FakeLogin
end

map "/user/logout" do
  class FakeLogout < Padrino::Application
    get :index do
      $debug_logged_in = false if settings.sspm_debug
      redirect "/user/login"
    end
  end
  run FakeLogout
end

map "/api" do
  class FakeAPI < Padrino::Application
    before { sleep 3 } # fake wait

    get "*" do
      "ok"
    end

    post "*" do
      "ok"
    end
  end
  run FakeAPI
end

