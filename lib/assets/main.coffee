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
            main: "#container"
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

      # TODO: create mock models
      repos = new Collections::Repositories []

      destroy_all = ->
        deferred_when = new jQuery.Deferred
        repos.fetch().done ->
          deferreds_when = []
          destroy_repo = (repo)->
            deferred_repo = new jQuery.Deferred
            setTimeout ->
              console.log "destory: #{repo.id}"
              deferred_repo.resolve()
            deferred_repo
          repos.each (repo)->
            deferreds_when.push destroy_repo(repo)
          jQuery.when.apply(jQuery, deferreds_when).done ->
            deferred_when.resolve()
        deferred_when

      destroy_all().done ->
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
