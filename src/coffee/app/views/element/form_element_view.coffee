define(
  [
    "app/views/base_view"
  ]
  (
    BaseView
  )->
    class FormElementView extends BaseView
      className: -> "#{@toSnake()} #{super}"
      tagName: "form"
)
