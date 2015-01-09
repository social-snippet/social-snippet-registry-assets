gulp = require("gulp")

gulp.task "test", ["bower"], (done)->
  karma = require("gulp-karma")
  path = require("path")
  gulp.src ["spec/**/*_spec.coffee"]
    .pipe karma
      configFile: path.join(__dirname, "../config/karma.coffee")

