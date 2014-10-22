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
gulp.task "test/watch", ->
  gulp.watch(
    [
      "src/coffee/**/*.coffee"
      "spec/**/*.coffee"
    ]
    [
      "test"
    ]
  )
  return undefined

# gulp test
gulp.task "test", ->
  gulp.src ["spec/spec_config.coffee", "spec/spec_helper.coffee", "spec/**/*_spec.coffee"]
    .pipe phantomochajs(
      dependencies: [
        "./bower_components/requirejs/require.js"
        "./tmp/js/app/utils.js"
      ]
      test_dependencies: [
        "./bower_components/mocha/mocha.js"
        "./bower_components/chai/chai.js"
        "./bower_components/sinon/pkg/sinon.js"
      ]
    )

