_ = require "lodash"

_(global).extend
  gulp              : require "gulp"
  gulp_util         : require "gulp-util"
  main_bower_files  : require "main-bower-files"
  bower             : require "bower"
  uglify            : require "gulp-uglify"
  cond              : require "gulp-if"
  coffee            : require "gulp-coffee"
  concat            : require "gulp-concat"
  del               : require "del"
  mocha_phantom_js  : require "gulp-mocha-phantomjs"
  webserver         : require "gulp-webserver"
  amd_optimize      : require "amd-optimize"
  shell             : require "gulp-shell"
  watch             : require "gulp-watch"
  sass              : require "gulp-ruby-sass"

_(global).extend
  isRelease         : ! gulp_util.env.release?

# load test tasks
require "./gulp_tasks/test"

# gulp build/watch
gulp.task "build/watch", ->
  gulp.watch(
    # watched files
    ["src/**/*.coffee"]
    # fired tasks
    ["build/concurrent/coffee"]
  )
  gulp.watch(
    # watched files
    ["src/sass/**/*.sass"]
    # fired tasks
    ["sass"]
  )
  return undefined

# gulp build/concurrent/coffee
gulp.task "build/concurrent/coffee", [
  "coffee"
  "requirejs"
  "copy/main"
]

# gulp sass
gulp.task "sass", ->
  gulp.src(["src/coffee/**/*.sass"])
    .pipe sass(
      'sourcemap=none': true
    )
    .pipe concat "main.css"
    .pipe gulp.dest "dist/css/"

# gulp bower
gulp.task "bower", (done)->
  bower.commands.install().on "end", ->
    gulp.src main_bower_files()
      # .pipe cond isRelease, uglify({preserveComments: "some"})
      .pipe gulp.dest "tmp/js/lib"
      .on "end", ->
        done()
  return undefined

# gulp coffee
gulp.task "coffee", ->
  gulp.src(["src/coffee/**/*.coffee"])
    .pipe coffee()
    .pipe gulp.dest "tmp/js/app"

# gulp copy/requirejs
gulp.task "copy/requirejs", ["bower"], ->
  gulp.src(["bower_components/requirejs/require.js"])
    .pipe gulp.dest "dist/js/"

# gulp requirejs
gulp.task "requirejs", ["coffee", "bower", "copy/requirejs"], ->
  gulp.src(["tmp/js/app/**/*.js"])
    .pipe amd_optimize(
      "app/app_router"
      {
        configFile: gulp.src("assets_config.coffee").pipe(coffee())
      }
    )
    .pipe concat "app.js"
    .pipe gulp.dest "dist/js/"

# gulp copy/main
gulp.task "copy/main", ["coffee"], ->
  gulp.src(["tmp/js/app/main.js"])
    .pipe gulp.dest "dist/js/"

# gulp clean
gulp.task "clean", del.bind null, [
  "tmp/"
]

# gulp build
gulp.task "build", [
  "bower"
  "coffee"
  "requirejs"
  "copy/main"
  "sass"
]

# gulp
gulp.task "default", [
  "build"
]

