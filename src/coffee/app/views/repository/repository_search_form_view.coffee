define(
  [
    "app/views/element/form_element_view"
    "app/views/element/text_input_element_view"
    "app/views/element/submit_input_element_view"
  ]
  (
    FormElementView
    TextInputElementView
    SubmitInputElementView
  )->
    class RepositorySearchFormView extends FormElementView
      className: -> "#{@toSnake()} #{super}"

      render: ->
        @$el 
          .attr "action", ""
          .attr "method", "get"

        el_query = new TextInputElementView(
          model: @model.get("query")
        )

        el_submit = new SubmitInputElementView(
          model: @model.get("submit")
        )

        @$el
          .empty()
          .append "Search: "
          .append el_query.render().el
          .append el_submit.render().el
        return @
)
