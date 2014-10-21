#
# require.js
#
@requirejs_paths = {
  "jquery": "bower_components/jquery/dist/jquery"
  "underscore": "bower_components/underscore/underscore"
  "backbone": "bower_components/backbone/backbone"
}

@requirejs_shim = {
}

requirejs.config(
  baseUrl: "src/coffee"
  paths: @requirejs_paths
  shim: @requirejs_shim
)
