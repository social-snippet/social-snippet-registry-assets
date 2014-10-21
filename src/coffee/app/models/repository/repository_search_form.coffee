define(
  [
    "backbone"
    "app/models/element/input_element"
  ]
  (
    Backbone
    InputElement
  )->
    class RepositorySearchForm extends Backbone.Model
      defaults: ->

        query: new InputElement
          type: "text"
          name: "q"

        submit: new InputElement
          type: "submit"
          val: "Go"

)
