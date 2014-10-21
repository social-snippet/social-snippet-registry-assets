define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class LinkElement extends Backbone.Model
      defaults: ->
        text: ""
        url: ""
)
