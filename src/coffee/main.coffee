jquery = require("jquery")
App = require("app")

jQuery ->
  jQuery.ajaxSetup(
    headers:
      "X-CSRF-TOKEN": jQuery("meta[csrf_token]").attr("csrf_token")
  )

  require("init_local_storage")() if SSPM_LOCAL_STORAGE

  # start application
  App.start()
