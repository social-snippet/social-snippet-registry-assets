global = @

requirejs(
  [
    "jquery"
    "backbone"
    "underscore"
    "app/app"
    "app/models"
    "/backbone.localStorage.js"
  ]
  (
    jQuery
    Backbone
    _
    App
    Models
  )->
    # use localstorage instead of database
    _(Models::Repository::).extend(
      defaults:
        "name": "repo"
        "desc": "desc desc"
      localStorage: new Backbone.LocalStorage("repository")
    )

    #
    jQuery ->
      global.app = new App(
        regions:
          main: "#container"
      )
      Object.freeze(global.app)
      app.start()
)
