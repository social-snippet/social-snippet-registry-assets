global = @

requirejs(
  [
    "jquery"
    "backbone"
    "underscore"
    "bootstrap"
    "app/app"
    "app/models"
    "/bower/backbone.localStorage/backbone.localStorage.js"
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

    if WITH_LOCAL_STORAGE
      console.log "enable local storage"
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
