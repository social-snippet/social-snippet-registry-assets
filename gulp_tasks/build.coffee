# gulp build/watch
gulp.task "build/watch", ->
  # coffee
  gulp.watch(
    # watched files
    ["src/**/*.coffee"]
    # fired tasks
    ["build/concurrent/coffee"]
  )

  # sass
  gulp.watch(
    # watched files
    ["src/sass/**/*.sass"]
    # fired tasks
    ["build/sass"]
  )
  return undefined

# gulp build/sass
gulp.task "build/sass", ->
  gulp.src(["src/sass/**/*.sass"])
    .pipe sass(
      'sourcemap=none': true
    )
    .pipe concat "main.css"
    .pipe gulp.dest "dist/"

# gulp bower
gulp.task "build/bower", (done)->
  bower.commands.install().on "end", ->
    gulp.src main_bower_files()
      .pipe gulp.dest "tmp/js/lib"
      .on "end", ->
        done()
  return undefined

# gulp coffee
gulp.task "build/coffee", ->
  gulp.src(["src/coffee/**/*.coffee"])
    .pipe coffee()
    .pipe gulp.dest "tmp/js/app/"

# gulp build/requirejs
gulp.task "build/requirejs", ["build/coffee", "build/bower"], ->
  gulp.src(["tmp/js/app/**/*.js"])
    .pipe amd_optimize(
      "app/app_router"
      {
        configFile: gulp.src("assets_config.coffee").pipe(coffee())
      }
    )
    .pipe concat "main.js"
    .pipe gulp.dest "dist/"

# gulp build/concurrent/coffee
gulp.task "build/concurrent/coffee", [
  "build/coffee"
  "build/requirejs"
]

# gulp build
gulp.task "build", [
  "build/bower"
  "build/concurrent/coffee"
  "build/sass"
]


