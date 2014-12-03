# require_relative "lib/web_server"
require "padrino"
require "social_snippet/registry/app/app"
require "sprockets"

#
# js
#

map "/js/app" do
  env = Sprockets::Environment.new

  # app
  env.append_path "src/coffee/app/"

  run env
end

map "/js" do
  env = Sprockets::Environment.new

  # asssts
  env.append_path "lib/assets/js/"

  # bower components
  env.append_path "tmp/js/lib/"

  # utils
  env.append_path "src/coffee/"

  run env
end

#
# bower
#
map "/bower" do
  env = Sprockets::Environment.new
  env.append_path "bower_components/"
  run env
end

#
# css
#
map "/css" do
  env = Sprockets::Environment.new

  #
  env.append_path "lib/assets/css/"
  env.append_path "bower_components/"
  env.append_path "src/sass/"
  env.append_path "src/css/"

  run env
end

#
# fonts
#
map "/fonts" do
  env = Sprockets::Environment.new

  env.append_path "bower_components/font-awesome/fonts/"

  run env
end

#
# root
#
map "/" do
  # GET /user/*
  SocialSnippet::Registry::App.get "/user/login" do; render :empty; end
  SocialSnippet::Registry::App.get "/user/dashboard" do; render :empty; end

  run SocialSnippet::Registry::App
end

