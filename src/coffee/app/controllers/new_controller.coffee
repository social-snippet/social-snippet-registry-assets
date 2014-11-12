define(
  [
    "underscore"
    "backbone"
    "backbone.marionette"
    "app/views"
    "app/collections"
  ]
  (
    _
    Backbone
    Marionette
    Views
  )->
    class NewController extends Marionette.Controller
      repository: ->
        new_repo_view = new Views::NewRepositoryView
          model: new Backbone.Model
            action: "#{WEB_API_PROTOCOL}://#{WEB_API_HOST}/api/#{WEB_API_VERSION}/repositories"

        sub_layout = new Marionette.LayoutView
          template: _.template [
            '<div class="panel panel-default">'
            '<div class="panel-heading"><h4>Add URL</h4></div>'
            '<section class="panel-body add-by-url"></section>'
            '</div>'
            '<div class="panel panel-default">'
            '<div class="panel-heading"><h4>Add GitHub Repo<h4></div>'
            '<section class="panel-body add-by-github"></section>'
            '</div>'
          ].join("\n")

          regions:
            urlRegion: ".add-by-url"
            githubRegion: ".add-by-url"

        app.layout.currentView.contentsRegion.show sub_layout
        sub_layout.urlRegion.show new_repo_view

)

