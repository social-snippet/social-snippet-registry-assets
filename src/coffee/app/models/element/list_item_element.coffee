define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class ListItemElement extends Backbone.Model
      defaults: ->
        item: ""
)
