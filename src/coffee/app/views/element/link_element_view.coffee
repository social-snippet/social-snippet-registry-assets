define(
  [
    "app/views/base_view"
  ]
  (
    BaseView
  )->
    class LinkElementView extends BaseView
      className: -> "#{@toSnake()} #{super}"
      tagName: "a"

      render: ->
        @$el
          .empty()
          .text @model.get("text")
          .attr "href", @model.get("url")
        return @
)
