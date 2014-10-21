define(
  [
    "app/views/base_view"
    "app/views/element/list_element_view"
    "app/collections/element/list_item_elements"
    "app/models/element/link_element"
    "app/views/element/link_element_view"
  ]
  (
    BaseView
    ListElementView
    ListItemElements
    LinkElement
    LinkElementView
  )->
    class RepositorySearchResultView extends BaseView
      className: -> "#{@toSnake()} #{super}"
      tagName: "li"

      initialize: ->
      
      render: =>
        el_list_items = new ListItemElements([])
        el_list_items.add_item(
          new LinkElementView(
            model: new LinkElement(
              url: "/repositories/#{@model.get("name")}"
              text: @model.get("name")
            )
          ).render().el
        )
        el_list_items.add_item @model.get("desc")

        el_list = new ListElementView(
          collection: el_list_items
        )

        @$el
          .empty()
          .append el_list.render().el

        return @
)
