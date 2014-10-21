define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class InputElement extends Backbone.Model
      defaults: ->
        "type": "text"
        "name": ""
        "value": ""
)
