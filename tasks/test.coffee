gulp = require("gulp")
shell = require("gulp-shell")

gulp.task "template.html", ["bower"], ->
  run = require("gulp-run")
  concat = require("gulp-concat")
  streamify = require("gulp-streamify")

  slimSrc = "./bower_components/social-snippet-registry-views/lib/social_snippet/registry_views/views/**/*.slim"
  slimData =
    csrf_token: "dummy"
    assets_host: "api.test"
    is_logged_in: false

  gulp.src slimSrc
    .pipe run("bundle exec slimrb -s -l '#{JSON.stringify(slimData)}'", verbosity: 1)
    .pipe streamify(concat "template.html")
    .pipe gulp.dest("tmp/html")

gulp.task "sinon.js", ["bower"], shell.task(
  [
    "cd ./bower_components/sinon"
    "if [ ! -f ./pkg/sinon.js ]; then npm install && bundle exec ./build; fi"
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
  "tmp/html/**/*.html"
]

gulp.task "test", ["bower", "sinon.js", "template.html"], (done)->
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

