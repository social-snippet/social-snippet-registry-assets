require "./tasks/test"
require "./tasks/build"

gulp = require "gulp"

# Default task
# gulp = gulp build
gulp.task "default", [
  "build"
]

