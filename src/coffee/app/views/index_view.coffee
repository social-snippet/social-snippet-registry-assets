define(
  [
    "jquery"
    "underscore"
    "app/views/base_view"
  ]
  (
    $
    _
    BaseView
  )->
    class IndexView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      initialize: ->

      render: ->
        @$el
          .empty()
          .append =>
            el_list = $(document.createElement("ul"))
            links = @model.get("links")
            _(links).each (link_text, link_url)=>
              el_list.append "<li><a href=\"#{link_url}\">#{link_text}</a></li>"
            return el_list

        return @
)
