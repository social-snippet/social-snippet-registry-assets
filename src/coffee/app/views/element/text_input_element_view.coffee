define(
  [
    "app/views/base_view"
  ]
  (
    BaseView
  )->
    class TextInputElementView extends BaseView
      className: -> "#{@toSnake()} #{super}"
      tagName: "input"

      render: ->
        @$el
          .attr "type", "text"
          .attr "name", @model.get("name")
          .val @model.get("val")
        return @
)
