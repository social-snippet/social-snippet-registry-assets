define(
  [
    "underscore"
    "backbone"
    "models"
    "collections"
    "views"
    "backbone.localStorage"
  ]
  (
    _
    Backbone
    Models
    Collections
    Views
    __backbone_LocalStorage__
  )->
    add_model = (collection, model)->
      model.localStorage = collection.localStorage
      model.save()
      model

    create_fake_repos = ->
      repos = new Collections::Repositories []

      repo_1 = new Models::Repository
        name: "repo-1"
        desc: "this is repo 1"
        url: "https://github.com/user/repo-1"

      repo_2 = new Models::Repository
        name: "repo-2"
        desc: "this is repo 2"
        url: "https://github.com/user/repo-2"

      add_model repos, repo_1
      add_model repos, repo_2

    create_fake_user_repos = ->
      repos = new Collections::UserRepositories []

      repo_1 = repos.create
        name: "user/repo1"
        repos: [
          "repo-1"
          "other-repo-1"
        ]

      repo_2 = repos.create
        name: "user/repo2"
        repos: []

      repo_3 = repos.create
        name: "org/repo1"
        repos: [
          "repo-1"
        ]

      add_model repos, repo_1
      add_model repos, repo_2
      add_model repos, repo_3

      repo_1.save()
      repo_2.save()
      repo_3.save()

    initLocalStorage = ->
      console.debug "enable local storage"

      _(Collections::Repositories::).extend
        localStorage: new Backbone.LocalStorage("repos")
      _(Collections::SearchResults::).extend
        localStorage: new Backbone.LocalStorage("repos")
      _(Collections::UserRepositories::).extend
        localStorage: new Backbone.LocalStorage("user-repos")
      _(Models::Repository::).extend
        localStorage: new Backbone.LocalStorage("repos")
      _(Models::UserRepository::).extend
        localStorage: new Backbone.LocalStorage("user-repos")

      _(Views::Components::AddRepositoryByGitHubView::).extend
        addRepository: ->
          repo = new Models::Repository
          random_id = parseInt(Math.random() * 100, 10)
          repo.save
            name: "new-repo-#{random_id}"
            desc: "new repo ##{random_id}"
            url: "https://github.com/#{@$(".new-repo-user").val()}/#{@$(".new-repo-name").val()}"
          Backbone.Wreqr.radio.vent.trigger "global", "router:repositories:navigate", repo.get("name")

      _(Views::Components::AddRepositoryByUrlView::).extend
        addRepository: ->
          repo = new Models::Repository
          random_id = parseInt(Math.random() * 100, 10)
          repo.save
            name: "new-repo-#{random_id}"
            desc: "new repo ##{random_id}"
            url: @$(".new-repo-url").val()
          Backbone.Wreqr.radio.vent.trigger "global", "router:repositories:navigate", repo.get("name")

      # create fake repos
      create_fake_repos()
      create_fake_user_repos()
)
