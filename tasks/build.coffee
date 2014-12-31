gulp    = require "gulp"
bower   = require "bower"
coffee  = require "gulp-coffee"
sass    = require "gulp-ruby-sass"
concat  = require "gulp-concat"
debug   = require "gulp-debug"
glob    = require "glob"
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

gulp.task "sass", ->
  gulp.src(["src/sass/**/*.sass"])
    .pipe sass(
      'sourcemap=none': true
    )
    .pipe gulp.dest "tmp/css/app/"

gulp.task "css", ->
  gulp.src(["src/css/**/*.css"])
    .pipe gulp.dest "tmp/css/app/"

# gulp assets.css
gulp.task "assets.css", ["sass", "css", "bower/css"], ->
  gulp.src(["tmp/css/app/**/*.css"])
    .pipe concat "assets.css"
    .pipe gulp.dest "dist/"

# gulp bower
gulp.task "bower", (done)->
  bower.commands.install().on "end", ->
    gulp.src main_bower_files()
      .pipe gulp.dest "tmp/bower"
      .on "end", ->
        done()
  return undefined

gulp.task "bower/js", ["bower"], ->
  gulp.src ["tmp/bower/**/*.js"]
    .pipe gulp.dest "tmp/js/lib/"

gulp.task "bower/css", ["bower"], ->
  gulp.src ["tmp/bower/**/*.css"]
    .pipe gulp.dest "tmp/css/lib/"

# gulp coffee
gulp.task "coffee", ->
  gulp.src(["src/coffee/**/*.coffee"])
    .pipe coffee()
    .pipe gulp.dest "tmp/js/app/"

# gulp app.js
gulp.task "app.js", ["coffee", "bower/js"], ->
  amd_paths =
    "lib": "./tmp/js/lib"
    "app": "./tmp/js/app"

  amd_exclude = []
  libs = glob.sync("tmp/js/lib/*.js")
    .map (lib_path)->
      lib_path
        .replace /^tmp\/js\/lib\//, ""
        .replace /\.js/, ""
    .forEach (lib_name)->
      amd_paths[lib_name] = "./tmp/js/lib/#{lib_name}"
      amd_exclude.push "#{lib_name}"
      amd_exclude.push "lib/#{lib_name}"

  amd_optimize_options =
    paths: amd_paths
    exclude: amd_exclude

  gulp.src(["tmp/js/**/*.js"])
    .pipe amd_optimize "app/app", amd_optimize_options
    .pipe concat "app.js"
    .pipe gulp.dest "tmp/js"

gulp.task "assets.js", ["coffee", "app.js"], ->
  gulp.src ["tmp/js/app/utils.js", "tmp/js/app.js"]
    .pipe concat "assets.js"
    .pipe gulp.dest "dist/"

# gulp build
gulp.task "build", [
  "assets.js"
  "assets.css"
]


