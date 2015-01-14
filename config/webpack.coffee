webpack = require("webpack")
path = require("path")

webpackPlugins = []

webpackPlugins.push new webpack.ResolverPlugin [
  new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
]

webpackPlugins.push new webpack.DefinePlugin
  SSPM_WEBAPI_HOST: JSON.stringify(process.env.SSPM_WEBAPI_HOST || "sspm.herokuapp.com")
  SSPM_WEBAPI_VERSION: JSON.stringify(process.env.SSPM_WEBAPI_VERSION || "v0")
  SSPM_WEBAPI_PROTOCOL: JSON.stringify(process.env.SSPM_WEBAPI_PROTOCOL || "https")
  SSPM_LOCAL_STORAGE: process.env.SSPM_LOCAL_STORAGE == "true"

if process.env.SSPM_DISABLE_UGLIFYJS == "true"
  console.log "webpack: disable uglifyjs"
else
  console.log "webpack: enable uglifyjs"
  webpackPlugins.push new webpack.optimize.UglifyJsPlugin
    compress:
      warnings: false

module.exports =

  entry: [
    path.join(__dirname, "..", "src/coffee/main.coffee")
  ]

  resolve:
    root: [
      path.join(__dirname, "..", "bower_components")
      path.join(__dirname, "..", "src/coffee")
    ]

    extensions: [
      ""
      ".coffee"
      ".js"
    ]

  externals:
    "jquery": "jQuery"

  output:
    filename: "[name].js"
    path: path.join(__dirname, "..", "dist/js/")
    publicPath: "/js/"

  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
    ]
 
  plugins: webpackPlugins
