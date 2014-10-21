define(
  [
    "backbone"
    "app/models/element/list_item_element"
  ]
  (
    Backbone
    ListItemElement
  )->
    class ListItemElements extends Backbone.Collection
      model: ListItemElement

      add_item: (item)->
        @add new ListItemElement(
          item: item
        )
)
