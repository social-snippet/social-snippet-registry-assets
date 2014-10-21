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
  mocha_phantom_js  : require "gulp-mocha-phantomjs"
  amd_optimize      : require "amd-optimize"
  shell             : require "gulp-shell"
  watch             : require "gulp-watch"
  sass              : require "gulp-ruby-sass"

_(global).extend
  isRelease         : ! gulp_util.env.release?

# Load test tasks
# run:    gulp test
# watch:  gulp test/watch
require "./gulp_tasks/test"

# Load build tasks
# run:    gulp build
# watch:  gulp build/watch
require "./gulp_tasks/build"

# Default task
# gulp = gulp build
gulp.task "default", [
  "build"
]

