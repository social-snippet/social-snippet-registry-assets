describe "RepositoryView", ->
  
  load_modules(
    "app/views/repository/repository_view"
    "app/models/repository/repository"
  )

  prepare_fake_server()

  context "create model", ->
    
    before ->
      @repo_model = new Repository(
        name: "my-repo",
      )
      deferred = @repo_model.fetch()
      @web_server.respond()
      return deferred

    context "create view", ->

      before ->
        @repo_view = new RepositoryView(
          model: @repo_model
        )
        return undefined

      context "render", ->

        before ->
          @repo_view.render()
          return undefined

        it "check view", ->
          expect(@repo_view.$el.text()).include "my-repo"

