define(
  [
    "app/models/application"
    "app/models/repository/repository_search"
    "app/models/repository/repository"
  ]
  ->
    class Models
    Utils.loadModules.bind(@, Models).apply @, arguments
)
