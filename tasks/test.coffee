gulp = require("gulp")
shell = require("gulp-shell")

gulp.task "sinon.js", ["bower"], shell.task(
  [
    "cd ./bower_components/sinon"
    "npm install"
    "[ -f ./bower_components/sinon/pkg/sinon.js ] || bundle exec ./build"
  ].join(" && ")
)

setTestEnv = ->
  process.env.SSPM_WEBAPI_HOST = "api.test"
  process.env.SSPM_WEBAPI_PROTOCOL = "http"
  process.env.SSPM_WEBAPI_VERSION = "v0"

testScripts = [
  "bower_components/jquery/dist/jquery.js"
  "bower_components/sinon/pkg/sinon.js"
  "spec/spec_helper.coffee"
  "spec/**/*_spec.coffee"
  "spec/fixtures/**/*.html"
]

gulp.task "test", ["bower", "sinon.js"], (done)->
  karma = require("gulp-karma")
  path = require("path")
  setTestEnv()
  gulp.src testScripts
    .pipe karma
      configFile: path.join(__dirname, "../config/karma.coffee")

gulp.task "test/watch", ["bower", "sinon.js"], (done)->
  karma = require("gulp-karma")
  path = require("path")
  setTestEnv()
  gulp.src testScripts
    .pipe karma
      configFile: path.join(__dirname, "../config/karma.coffee")
      action: "watch"

