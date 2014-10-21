define(
  [ 
    "app/views/base_view"
    "app/views/element/list_item_element_view"
  ]
  (
    BaseView
    ListItemElementView
  )->
    class ListElementView extends BaseView
      className: -> "#{@toSnake()} #{super}"
      tagName: "ul"

      render: ->
        @$el.empty()
        @collection
          .map (item)->
            return new ListItemElementView(
              model: item
            )
          .forEach (item_view)=>
            @$el.append item_view.render().el
        return @
)
