define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class Application extends Backbone.Model
      defaults: ->
        title: "SSPM"
        sub_title: "Social SniPpet Manager"
        links:
          "/repositories/new": "Add Repository"
          "/search": "Search Repository"

      initialize: ->
)
