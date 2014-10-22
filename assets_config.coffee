#
# require.js
#
@requirejs_paths = {
  "jquery": "tmp/js/lib/jquery"
  "underscore": "tmp/js/lib/underscore"
  "backbone": "tmp/js/lib/backbone"
  "backbone.marionette": "tmp/js/lib/backbone.marionette"
  "backbone.wreqr": "tmp/js/lib/backbone.wreqr"
  "backbone.babysitter": "tmp/js/lib/backbone.babysitter"
  "bootstrap": "tmp/js/lib/bootstrap"
}

@requirejs_shim = {
}

requirejs.config(
  baseUrl: "src/coffee"
  paths: @requirejs_paths
  shim: @requirejs_shim
)
