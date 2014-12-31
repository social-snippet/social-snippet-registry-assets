require "./tasks/test"
require "./tasks/build"
require "./tasks/version"

gulp = require "gulp"

# Default task
# gulp = gulp build
gulp.task "default", [
  "build"
]

