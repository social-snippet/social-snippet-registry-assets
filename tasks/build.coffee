gulp = require("gulp")

gulp.task "bower", (done)->
  bower = require("bower")
  bower.commands.install().on "end", ->
    done()
  undefined

gulp.task "build", ["bower"], ->
  gulpWebpack = require("gulp-webpack")
  webpackConfig = require("../config/webpack")

  gulp.src "src/coffee/**/*.coffee"
    .pipe gulpWebpack(webpackConfig)
    .pipe gulp.dest("dist/")
