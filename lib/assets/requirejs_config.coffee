requirejs.config(
  baseUrl: "/js"
  shim:
    "backbone":
      deps: ["underscore", "jquery"]
      exports: "Backbone"
    "bootstrap":
      deps: ["jquery"]
)
