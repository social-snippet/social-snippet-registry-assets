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
    # need to run webpack dev server
    logger.info "Enable Webpack Dev Server"
    env = Sprockets::Environment.new
    use Rack::ReverseProxy do
      reverse_proxy /^\/(.*)/, "http://localhost:18181/$1"
    end
    run env
  else
    # need to run `$ gulp build`
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
  env.append_path "lib/fake_app/css/"
  run env
end

map "/" do
  require_relative "lib/fake_app/app"
  run ::FakeApp::App
end
