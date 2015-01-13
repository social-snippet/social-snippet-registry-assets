gulp = require("gulp")
gutil = require("gulp-util")

gulp.task "bower", (done)->
  bower = require("bower")
  bower.commands.install().on "end", ->
    done()
  undefined

gulp.task "build", ["bower"], ->
  gulpWebpack = require("gulp-webpack")
  webpackConfig = require("../config/webpack")

  gulp.src "src/coffee/**/*.coffee"
    .pipe gulpWebpack(webpackConfig)
    .pipe gulp.dest("dist/js/")

gulp.task "server", ["bower"], ->
  webpackCompiler = require("webpack")
  webpackConfig = require("../config/webpack")
  WebpackDevServer = require("webpack-dev-server")

  server = new WebpackDevServer(
    webpackCompiler(webpackConfig)
    {
      hot: true
      quiet: true
      noInfo: true
      publicPath: webpackConfig.output.publicPath
    }
  )

  gutil.log "Starting webpack dev server..."
  server.listen 18181, "localhost", (err)->
    throw gutil.PluginError "webpack-dev-server" if err

  undefined
