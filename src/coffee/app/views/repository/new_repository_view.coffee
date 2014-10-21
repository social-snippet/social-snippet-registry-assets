define(
  [
    "jquery"
    "app/views/base_view"
  ]
  (
    $
    BaseView
  )->
    class NewRepositoryView extends BaseView
      className: -> "#{@toSnake()} #{super}"

      intialize: ->

      events:
        "click button.add": "add"

      add: =>
        send_data = {
          url: @$el.find("input.url").val()
        }
        deferred = $.ajax(
          type: "post"
          url: "/api/v0/repositories"
          dataType: "json"
          contentType: "application/json"
          data: JSON.stringify(send_data)
        )
      
      render: ->
        @$el
          .empty()
          .append [
            "<h2>Add new repository</h2>"
            "<div>"
            "<p>"
            "URL: <input type=\"text\" class=\"url\">"
            "<button class=\"add\">add</button>"
            "</p>"
            "</div>"
          ].join("")
        return @
)
