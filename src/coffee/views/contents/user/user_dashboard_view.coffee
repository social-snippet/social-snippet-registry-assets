define(
  [
    "marionette"
  ]
  (
    Marionette
  )->
    class UserDashboardView extends Marionette.LayoutView
      template: "#template-user-dashboard-view"

      regions:
        operationsRegion: ".operations-region"
        reposRegion: ".repos-region"

      events:
        "click .sync": "sync"

      sync: ->
        @reposRegion.currentView.collection.fetch(type: "PUT")
          .then ->
            console.log "success"

)
