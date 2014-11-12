define(
  [
    "underscore"
    "backbone.marionette"
  ]
  (
    _
    Marionette
  )->
    class FooterView extends Marionette.LayoutView
      template: _.template [
        '<ul class="list-unstyled text-right">'
        '<li class="col-sm-4"><a href="https://social-snippet.github.io">Social Snippet</a></li>'
        '<li class="col-sm-4"><a href="https://social-snippet.github.io/blog">Blog</a></li>'
        '<li class="col-sm-4"><a href="https://github.com/social-snippet">GitHub</a></li>'
        '<li class="col-sm-4"><a href="https://github.com/social-snippet/social-snippet-registry/issues">Feedback</a></li>'
        '</ul>'
      ].join("")

      className: "container"

      initialize: ->
        @
)
