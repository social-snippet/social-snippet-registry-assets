@expect = chai.expect
@sinon = sinon

# Load Modules
@load_modules = =>
  module_names = Array::splice.call(arguments, 0)

  before (done)=>
    requirejs module_names, =>
      module_classes = Array::splice.call(arguments, 0)
      module_classes.forEach (module_class)=>
        @[module_class.name] = module_class
      done()

# prepare fake web server
@prepare_fake_server = =>
  # prepare fake server
  before ->
    @web_server = sinon.fakeServer.create()

    my_repo_info = {
      "name": "my-repo",
      "desc": "This is my repository",
      "url": "git://github.com/user/my-repo",
      "website": "http://url/to/website"
    }

    # GET /api/v0/repositories/my-repo
    @web_server.respondWith(
      "GET"
      "http://#{WEB_API_HOST}/api/v0/repositories/my-repo"
      [
        # status
        200

        # headers
        {
          "Content-Type": "application/json"
        }

        # body
        JSON.stringify my_repo_info
      ]
    )

    # GET /api/v0/repositories
    @web_server.respondWith(
      "GET"
      "http://#{WEB_API_HOST}/api/v0/repositories"
      [
        # status
        200

        # headers
        {
          "Content-Type": "application/json"
        }

        # body
        JSON.stringify(
          [
            my_repo_info
            my_repo_info # must be ignored
            my_repo_info # must be ignored
          ]
        )
      ]
    )

  after ->
    # reset stub
    @web_server.restore()
    delete @web_server

# overwrite config
@WEB_API_HOST = "api.server"

