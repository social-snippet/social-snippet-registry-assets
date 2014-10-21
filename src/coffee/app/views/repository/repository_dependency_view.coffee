define(
  [
    "app/views/base_view"
  ]
  (
    BaseView
  )->
    class RepositoryDependencyView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->

      render: ->
        @$el.empty()
        
        el_name = $(document.createElement('div'))
        el_name.append =>
          anchor = $(document.createElement('a'))
          anchor.attr "href", "/repositories/#{@model.get("name")}"
          anchor.text @model.get("name")
          return anchor

        @$el.append el_name

        return @
)
