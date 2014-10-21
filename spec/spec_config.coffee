#
# constant
#
@WEB_API_HOST = location.host
@WEB_API_VERSION = "v0"

#
# require.js
#
@requirejs_paths = {
  "jquery": "//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min"
  "underscore": "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.7.0/underscore-min"
  "backbone": "//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone-min"
}

@requirejs_shim = {
}

requirejs.config(
  baseUrl: "/src/coffee"
  paths: @requirejs_paths
  shim: @requirejs_shim
)
