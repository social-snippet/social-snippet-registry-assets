require "./tasks/test"
require "./tasks/build"
require "./tasks/web_server"

gulp = require "gulp"

# Default task
# gulp = gulp build
gulp.task "default", [
  "build"
]

