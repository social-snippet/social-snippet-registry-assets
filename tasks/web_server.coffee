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

gulp.task "assets-full.js", ["coffee", "app-full.js"], ->
  gulp.src ["tmp/js/lib/require.js", "tmp/js/app/utils.js", "tmp/js/app-full.js"]
    .pipe concat "assets-full.js"
    .pipe gulp.dest "tmp/js"

gulp.task "config.js", ->
  gulp.src ["lib/assets/config.coffee"]
    .pipe coffee()
    .pipe concat "config.js"
    .pipe gulp.dest "tmp/web_server/"

gulp.task "main.js", ->
  gulp.src ["lib/assets/main.coffee"]
    .pipe coffee()
    .pipe concat "main.js"
    .pipe gulp.dest "tmp/web_server/"

gulp.task "assets-full.css", ["bower", "assets.css"], ->
  gulp.src ["tmp/js/lib/**/*.css", "dist/*.css"]
    .pipe concat "assets-full.css"
    .pipe gulp.dest "tmp/css/"

gulp.task "web-server/watch", ->
  gulp.watch(
    [
      "lib/assets/**/*.coffee"
    ]
    [
      "main.js"
      "config.js"
    ]
  )
  gulp.watch(
    [
      "src/coffee/**/*.coffee"
    ]
    [
      "web-server/assets.js"
    ]
  )

gulp.task "backbone.localStorage.js", ["bower"], ->
  gulp.src ["./bower_components/backbone.localStorage/backbone.localStorage.js"]
    .pipe gulp.dest "tmp/web_server/"

gulp.task "web-server/assets.js", ["backbone.localStorage.js", "config.js", "assets-full.js", "main.js", "sinon.js"], ->
  gulp.src ["bower_components/sinon/pkg/sinon.js", "tmp/js/assets-full.js"]
    .pipe concat "assets.js"
    .pipe gulp.dest "tmp/web_server/"

gulp.task "web-server/assets.css", ["assets-full.css"], ->
  gulp.src ["tmp/css/assets-full.css"]
    .pipe concat "assets.css"
    .pipe gulp.dest "tmp/web_server/"

gulp.task "web-server", [
  "web-server/assets.js"
  "web-server/assets.css"
]
