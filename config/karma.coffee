# Karma configuration
# Generated on Tue Jan 06 2015 17:13:01 GMT+0900 (JST)

module.exports = (config) ->

  config.set

    basePath: "../"

    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ["mocha", "chai"]

    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors:
      "spec/**/*.coffee": ["webpack"]
      "tmp/html/**/*.html": ["html2js"]

    webpack: require("./webpack")

    webpackMiddleware:
      noInfo: true

    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ["spec"]

    # web server port
    port: 9876

    client:
      mocha:
        reporter: "html"
        ui: "bdd"

    # enable / disable colors in the output (reporters and logs)
    colors: true

    logLevel: config.LOG_INFO

    autoWatch: false

    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: [
      "PhantomJS"
    ]

    singleRun: true
