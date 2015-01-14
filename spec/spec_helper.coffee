global.stage_element = document.createElement("div")
stage_element.id = "stage"
document.body.appendChild stage_element

class global.SpecHelpers

  Backbone = require("backbone")

  @prepare_sinon_sandbox: ->
    before ->
      @sandbox = sinon.sandbox.create()

    after ->
      @sandbox.restore()

  @prepare_backbone_history: ->
    before ->
      Backbone.history.start(
        pushState: true
      )

    after ->
      Backbone.history.started = null
      Backbone.history.stop()

  # prepare fake web server
  @prepare_fake_server: ->
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
        "#{SSPM_WEBAPI_PROTOCOL}://#{SSPM_WEBAPI_HOST}/api/#{SSPM_WEBAPI_VERSION}/repositories/my-repo"
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
        "#{SSPM_WEBAPI_PROTOCOL}://#{SSPM_WEBAPI_HOST}/api/#{SSPM_WEBAPI_VERSION}/repositories"
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

