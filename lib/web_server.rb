require "sinatra/base"
require "slim"

# to check routing, views, and etc... on browser
class WebServer < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "../tmp/web_server") }

  get "/" do
    slim :index
  end

end

