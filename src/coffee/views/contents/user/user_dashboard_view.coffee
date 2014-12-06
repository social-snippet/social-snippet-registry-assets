define(
  [
    "backbone.marionette"
  ]
  (
    Marionette
  )->
    class UserDashboardView extends Marionette.LayoutView
      template: "#template-user-dashboard-view"

      regions:
        reposRegion: ".repos-region"
)
