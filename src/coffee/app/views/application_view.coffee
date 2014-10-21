define(
  [
    "jquery"
    "app/views/base_view"
  ]
  (
    $
    BaseView
  )->
    class ApplicationView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->

      render: ->
        el_title = $(document.createElement("h1"))
          .append @model.get("title")
        @$el
          .empty()
          .append el_title
        return @
)
