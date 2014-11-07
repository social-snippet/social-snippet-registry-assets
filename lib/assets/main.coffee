global = @

requirejs(
  [
    "jquery"
    "backbone"
    "underscore"
    "bootstrap"
    "app/app"
    "app/models"
    "/js/bower/backbone.localStorage/backbone.localStorage.js"
  ]
  (
    jQuery
    Backbone
    _
    __bootstrap__
    App
    Models
    __backbone_localstorage__
  )->

    # use localstorage instead of database
    _(Models::Repository::).extend(
      localStorage: new Backbone.LocalStorage("repository")
    )

    # TODO: create mock models

    #
    jQuery ->
      global.app = new App(
        regions:
          main: "#container"
      )
      Object.freeze(global.app)
      app.start()
)
