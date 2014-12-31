describe "Repository", ->

  # prepare modules
  load_modules(
    "app/models/repository"
  )

  prepare_fake_server()

  context "create instance", ->

    before ->
      @repo = new Repository(
        name: "my-repo",
      )

    context "fetch", ->

      before ->
        @deferred = @repo.fetch()
        @web_server.respond()
        @deferred

      context "check repo", ->
        it "name", -> expect(@repo.get("name")).to.eq "my-repo"
        it "desc", -> expect(@repo.get("desc")).to.eq "This is my repository"
        it "url", -> expect(@repo.get("url")).to.eq "git://github.com/user/my-repo"
        it "website", -> expect(@repo.get("website")).to.eq "http://url/to/website"
    
