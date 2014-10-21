define(
  [
    "app/views/base_view"
  ]
  (
    BaseView
  )->
    class ListItemElementView extends BaseView
      className: -> "#{@toSnake()} #{super}"
      tagName: "li"

      render: ->
        @$el
          .empty()
          .html @model.get("item")
        return @
)
