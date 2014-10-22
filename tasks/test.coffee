phantomochajs = require "phantomochajs"

# gulp sinon
gulp.task "sinon.js", ["bower"], shell.task(
  [
    "cd ./bower_components/sinon"
    "npm install"
    "[ -f ./bower_components/sinon/pkg/sinon.js ] || bundle exec ./build"
  ].join(" && ")
)

# gulp test/watch
gulp.task "test/watch", ["sinon.js"], ->
  gulp.watch(
    [
      "src/coffee/**/*.coffee"
      "spec/**/*.coffee"
    ]
    [
      "test/phantomochajs"
    ]
  )
  return undefined

# gulp test/phantomochajs
gulp.task "test/phantomochajs", ->
  gulp.src ["spec/spec_config.coffee", "spec/spec_helper.coffee", "spec/**/*_spec.coffee"]
    .pipe phantomochajs()

gulp.task "test", [
  "test/sinon"
  "test/phantomochajs"
]

