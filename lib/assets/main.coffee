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
      app.start()
)
