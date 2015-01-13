define ->
  class Routers
    @::HomeRouter = require "routers/home_router"
    @::NewRouter = require "routers/new_router"
    @::SearchRouter = require "routers/search_router"
    @::RepositoriesRouter = require "routers/repositories_router"
    @::UserRouter = require "routers/user_router"

