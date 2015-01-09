require ["jquery", "app"], (jQuery, App)->

  jQuery ->
    # set csrf token
    jQuery.ajaxSetup(
      headers:
        "X-CSRF-TOKEN": jQuery("meta[csrf_token]").attr("csrf_token")
    )

    # start application
    App.start()
