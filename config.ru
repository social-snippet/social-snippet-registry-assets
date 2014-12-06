# Usage:
#     $ bundle exec thin -a 127.0.0.1 -p 19292 start
#     -> http://127.0.0.1:19292/js/main.js

require "bundler/setup"
require "sprockets"

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

map "/js/app" do
  env = Sprockets::Environment.new
  env.append_path "src/coffee"
  run env
end

map "/js" do
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

  env.append_path "lib/assets/js/"
  env.append_path "tmp/js/lib/"
  env.append_path "src/coffee/"

  run env
end

map "/bower" do
  env = Sprockets::Environment.new
  env.append_path "bower_components/"
  run env
end

