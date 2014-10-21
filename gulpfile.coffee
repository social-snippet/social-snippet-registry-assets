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
require "./gulp_tasks/build"

# gulp
gulp.task "default", [
  "build"
]

