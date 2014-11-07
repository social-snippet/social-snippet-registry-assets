require_relative "lib/web_server"
require "sprockets"

#
# js
#
map "/js/assets" do
  env = Sprockets::Environment.new

  # entry / config scripts
  env.append_path "lib/assets/"

  run env
end

map "/js/app" do
  env = Sprockets::Environment.new

  # app
  env.append_path "src/coffee/app/"

  run env
end

map "/js/bower" do
  env = Sprockets::Environment.new
  env.append_path "bower_components/"
  run env
end

map "/js" do
  env = Sprockets::Environment.new

  # bower components
  env.append_path "tmp/js/lib/"

  # utils
  env.append_path "src/coffee/"

  run env
end

#
# css
#
map "/css" do
  env = Sprockets::Environment.new

  #
  env.append_path "src/sass"

  run env
end

#
# root
#
map "/" do
  run WebServer
end
