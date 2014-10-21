#
# constant
#
process.env["WEB_API_HOST"] ||= "sspm.herokuapp.com"
process.env["WEB_API_VERSION"] ||= "v0"
@WEB_API_HOST = process.env["API_HOST"]
@WEB_API_VERSION = process.env["WEB_API_VERSION"]

#
# require.js
#
@requirejs_paths = {
  "app": "tmp/js/app/app"
  "jquery": "bower_components/jquery/dist/jquery"
  "underscore": "bower_components/underscore/underscore"
  "backbone": "bower_components/backbone/backbone"
}

@requirejs_shim = {
}

requirejs.config(
  paths: @requirejs_paths
  shim: @requirejs_shim
)
