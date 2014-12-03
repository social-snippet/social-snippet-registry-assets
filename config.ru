require "padrino"
require "sprockets"

# Padrino configuration [before loading classes]
Padrino.configure_apps do
  set :sspm_auth, false
  helpers do
    def sspm_auth; settings.sspm_auth; end
  end
end

require "social_snippet/registry/app/app"
require "social_snippet/registry/user_pages/app"

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
  env.append_path "bower_components/bootstrap/fonts/"

  run env
end

# app pages
map "/" do
  run SocialSnippet::Registry::App
end

# user pages
map "/user" do
  run SocialSnippet::Registry::UserPages
end

