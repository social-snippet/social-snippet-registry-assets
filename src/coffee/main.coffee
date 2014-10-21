requirejs(
  [
    "jquery"
    "backbone"
    "./app/app_router"
  ]
  (
    jQuery
    Backbone
    AppRouter
  )->
    jQuery ->
      jQuery.ajaxSetup(
        headers:
          "X-CSRF-TOKEN": jQuery("meta[csrf_token]").attr("csrf_token")
      )
      router = new AppRouter
      Backbone.history.start(
        pushState: true
      )
)
