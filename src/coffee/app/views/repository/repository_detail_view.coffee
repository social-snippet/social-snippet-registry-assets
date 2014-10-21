define(
  [
    "app/views/base_view"
  ]
  (
    BaseView
  )->
    class RepositoryDetailView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->

      render: ->
        @$el.empty()
        
        el_name = $(document.createElement('div'))
        el_name.append @model.get("name")

        el_desc = $(document.createElement('div'))
        el_desc.append @model.get("desc")

        @$el.append el_name
        @$el.append el_desc

        return @
)
