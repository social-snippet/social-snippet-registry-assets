#
# require.js
#
@requirejs_paths = {
  "jquery": "tmp/js/lib/jquery"
  "underscore": "tmp/js/lib/underscore"
  "backbone": "tmp/js/lib/backbone"
  "bootstrap": "tmp/js/lib/bootstrap"
}

@requirejs_shim = {
}

requirejs.config(
  baseUrl: "src/coffee"
  paths: @requirejs_paths
  shim: @requirejs_shim
)
