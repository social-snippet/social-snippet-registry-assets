global = @
requirejs(
  [
    "jquery"
    "app/app"
  ]
  (
    jQuery
    App
  )->
    jQuery ->
      global.app = new App(
        regions:
          main: "#container"
      )
      Object.freeze(global.app)
      app.start()
)
