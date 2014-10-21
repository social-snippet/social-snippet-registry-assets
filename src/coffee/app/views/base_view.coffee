define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class BaseView extends Backbone.View
      toSnake: ->
        name = @constructor.name
        name = name.replace /^([A-Z])/, ($1)->
          return $1.toLowerCase()
        name = name.replace /([A-Z])/g, ($1)->
          return "-#{$1.toLowerCase()}"

      className: ->
        "view"
)
