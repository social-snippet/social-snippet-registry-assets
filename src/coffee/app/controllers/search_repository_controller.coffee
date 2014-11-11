define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class SearchRepositoryController extends Marionette.Controller
      form: ->
        app.layout.currentView.contentsRegion.show new Marionette.LayoutView
          template: _.template [
            '<div class="panel panel-default">'

            '<div class="panel-heading">'
            '<h4>Search Repositories</h4>'
            '</div>'

            '<div class="panel-body">'
            '<form class="form-inline" action="/search" method="get">'

            '<div class="form-group">'
            '<input type="text" name="q" class="form-control query">'
            '<input type="submit" class="btn btn-primary search pull-right" value="Go">'
            '</div>'

            '</form>'
            '</div>'
            '</div>'
          ].join("\n")

      result: (repo)->
        console.log "this is result"
)
