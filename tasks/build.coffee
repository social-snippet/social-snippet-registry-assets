gulp    = require "gulp"
bower   = require "bower"
coffee  = require "gulp-coffee"
sass    = require "gulp-ruby-sass"
concat  = require "gulp-concat"
main_bower_files  = require "main-bower-files"
amd_optimize      = require "amd-optimize"

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
    .pipe concat "assets.css"
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

# gulp app.js
gulp.task "app.js", ["coffee", "bower"], ->
  gulp.src(["tmp/js/app/**/*.js"])
    .pipe amd_optimize(
      "app/app"
      {
        configFile: gulp.src("assets_config.coffee").pipe(coffee())

        # to not include ext libs
        exclude: [
          "jquery"
          "backbone"
          "backbone.marionette"
          "backbone.wreqr"
          "backbone.babysitter"
          "underscore"
          "bootstrap"
        ]
      }
    )
    .pipe concat "app.js"
    .pipe gulp.dest "tmp/js"

gulp.task "assets.js", ["coffee", "app.js"], ->
  gulp.src ["tmp/js/app/utils.js", "tmp/js/app.js"]
    .pipe concat "assets.js"
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


