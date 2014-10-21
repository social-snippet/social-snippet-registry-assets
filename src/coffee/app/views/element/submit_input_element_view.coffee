define(
  [
    "jquery"
    "app/views/base_view"
  ]
  (
    $
    BaseView
  )->
    class SubmitInputElementView extends BaseView
      className: -> "#{@toSnake()} #{super}"
      tagName: "input"

      render: ->
        @$el
          .attr "type", "submit"
          .val @model.get("val")
        return @
)
