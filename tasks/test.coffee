gulp = require("gulp")
shell = require("gulp-shell")

gulp.task "sinon.js", ["bower"], shell.task(
  [
    "cd ./bower_components/sinon"
    "npm install"
    "[ -f ./bower_components/sinon/pkg/sinon.js ] || bundle exec ./build"
  ].join(" && ")
)

gulp.task "test", ["bower", "sinon.js"], (done)->
  karma = require("gulp-karma")
  path = require("path")
  testScripts = [
    "bower_components/jquery/dist/jquery.js"
    "bower_components/sinon/pkg/sinon.js"
    "spec/spec_helper.coffee"
    "spec/**/*_spec.coffee"
  ]
  gulp.src testScripts
    .pipe karma
      configFile: path.join(__dirname, "../config/karma.coffee")

