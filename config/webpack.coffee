webpack = require("webpack")
path = require("path")

module.exports =

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

  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
    ]
 
  plugins: [
    new webpack.ResolverPlugin [
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
    ]

    new webpack.DefinePlugin
      SSPM_WEBAPI_HOST: JSON.stringify(process.env.SSPM_WEBAPI_HOST || "sspm.herokuapp.com")
      SSPM_WEBAPI_VERSION: JSON.stringify("v0")
      SSPM_WEBAPI_PROTOCOL: JSON.stringify("https")

    new webpack.optimize.UglifyJsPlugin
      compress:
        warnings: false
  ]
