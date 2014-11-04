gulp    = require "gulp"
concat  = require "gulp-concat"
coffee  = require "gulp-coffee"
amd_optimize  = require "amd-optimize"

gulp.task "app-full.js", ["coffee", "bower"], ->
  gulp.src(["tmp/js/app/**/*.js"])
    .pipe amd_optimize(
      "app/app"
      {
        configFile: gulp.src("assets_config.coffee").pipe(coffee())
      }
    )
    .pipe concat "app-full.js"
    .pipe gulp.dest "tmp/js"

gulp.task "assets-full.js", ["app-full.js"], ->
  gulp.src ["tmp/js/lib/require.js", "tmp/js/app/utils.js", "tmp/js/app-full.js"]
    .pipe concat "assets-full.js"
    .pipe gulp.dest "tmp/js"

gulp.task "main.js", ->
  gulp.src ["lib/assets/**/*.coffee"]
    .pipe coffee()
    .pipe concat "main.js"
    .pipe gulp.dest "tmp/web_server/"

gulp.task "web_server", ["assets-full.js", "main.js"], ->
  gulp.src ["tmp/js/assets-full.js"]
    .pipe concat "assets.js"
    .pipe gulp.dest "tmp/web_server/"
