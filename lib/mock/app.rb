require "sinatra/base"
require "slim"

module Mock
  class App < Sinatra::Base
    get "/" do
      slim :home
    end
  end
end
