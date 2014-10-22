#
# constant
#
@WEB_API_HOST = location.host
@WEB_API_VERSION = "v0"

#
# require.js
#
@requirejs_paths = {
  "jquery": "/tmp/js/lib/jquery"
  "backbone": "/tmp/js/lib/backbone"
  "underscore": "/tmp/js/lib/underscore"
  "bootstrap": "/tmp/js/lib/bootstrap"
}

@requirejs_shim = {
}

requirejs.config(
  baseUrl: "/src/coffee"
  paths: @requirejs_paths
  shim: @requirejs_shim
)
