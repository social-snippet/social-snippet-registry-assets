define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class SearchRepositoryController extends Marionette.Controller
      form: ->

      result: (repo)->
        console.log "this is result"
)
