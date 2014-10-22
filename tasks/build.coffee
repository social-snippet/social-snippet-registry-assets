ASSETS_SCRIPT_NAME = "assets.js"
ASSETS_STYLE_NAME  = "assets.css"

# gulp build/watch
gulp.task "build/watch", ->
  # coffee
  gulp.watch(
    # watched files
    ["src/**/*.coffee"]
    # fired tasks
    ["build/concurrent/assets.js"]
  )

  # sass
  gulp.watch(
    # watched files
    ["src/sass/**/*.sass"]
    # fired tasks
    ["assets.css"]
  )
  return undefined

# gulp assets.css
gulp.task "assets.css", ->
  gulp.src(["src/sass/**/*.sass"])
    .pipe sass(
      'sourcemap=none': true
    )
    .pipe concat ASSETS_STYLE_NAME
    .pipe gulp.dest "dist/"

# gulp bower
gulp.task "bower", (done)->
  bower.commands.install().on "end", ->
    gulp.src main_bower_files()
      .pipe gulp.dest "tmp/js/lib"
      .on "end", ->
        done()
  return undefined

# gulp coffee
gulp.task "coffee", ->
  gulp.src(["src/coffee/**/*.coffee"])
    .pipe coffee()
    .pipe gulp.dest "tmp/js/app/"

# gulp assets.js
gulp.task "assets.js", ["coffee", "bower"], ->
  gulp.src(["tmp/js/app/**/*.js"])
    .pipe amd_optimize(
      "app/app_router"
      {
        configFile: gulp.src("assets_config.coffee").pipe(coffee())

        # to not include ext libs
        exclude: [
          "jquery"
          "backbone"
          "underscore"
          "bootstrap"
        ]
      }
    )
    .pipe concat ASSETS_SCRIPT_NAME
    .pipe gulp.dest "dist/"

# gulp build/concurrent/assets.js
gulp.task "build/concurrent/assets.js", [
  "coffee"
  "assets.js"
]

# gulp build
gulp.task "build", [
  "bower"
  "build/concurrent/assets.js"
  "assets.css"
]


