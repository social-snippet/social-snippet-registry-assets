global = @

requirejs(
  [
    "jquery"
    "backbone"
    "underscore"
    "bootstrap"
    "app/app"
    "app/models"
    "app/collections"
    "/bower/backbone.localStorage/backbone.localStorage.js"
  ]
  (
    jQuery
    Backbone
    _
    __bootstrap__
    App
    Models
    Collections
    __backbone_localstorage__
  )->
    entry_func = ->
      jQuery ->
        global.app = new App(
          regions:
            layout: "#container"
        )
        Object.freeze(global.app)

        console.log "start app"
        global.app.start()

    if WITH_LOCAL_STORAGE
      console.log "enable local storage"
      # use localstorage instead of database
      _(Models::Repository::).extend(
        localStorage: new Backbone.LocalStorage("repository")
      )
      _(Collections::Repositories::).extend(
        localStorage: new Backbone.LocalStorage("repository")
      )

      repos = new Collections::Repositories []

      repo_1 = new Models::Repository
      repo_1.save
        name: "repo-1"
        desc: "this is repo 1"
      repos.add repo_1

      repo_2 = new Models::Repository
      repo_2.save
        name: "repo-2"
        desc: "this is repo 2"
      repos.add repo_2

      entry_func()

    else
      entry_func()
)
