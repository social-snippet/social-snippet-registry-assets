require "sinatra/base"
require "slim"

# to check routing, views, and etc... on browser
class WebServer < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "../tmp/web_server") }

  get "/" do
    slim :empty
  end

  get "/repositories" do
    slim :empty
  end

  get "/repositories/:repo_id" do
    slim :empty
  end

  get "/search" do
    slim :empty
  end

  get "/search-result" do
    slim :empty
  end

end

