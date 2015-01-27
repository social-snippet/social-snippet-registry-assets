gulp = require("gulp")
shell = require("gulp-shell")

gulp.task "test/html/clean", shell.task [
  "[ -f tmp/template.html ] && rm tmp/template.html"
]

gulp.task "test/html", ["test/html/clean", "bower"], ->
  slimSrc = "./bower_components/social-snippet-registry-views/lib/social_snippet/registry_views/views/**/*.slim"
  slimData =
    csrf_token: "dummy"
    assets_host: "api.test"
    is_logged_in: false
  gulp.src slimSrc, read: false
    .pipe shell [
      "echo slim: <%= file.path %>"
      "bundle exec slimrb -l '#{JSON.stringify(slimData)}' <%= file.path %> >> tmp/template.html"
    ]

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
  "tmp/template.html"
]

gulp.task "test", ["bower", "sinon.js", "test/html"], (done)->
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

