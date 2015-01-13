describe "Collections::Repositories", ->

  Collections = require("collections")

  SpecHelpers.prepare_fake_server()

  context "create instance", ->

    before ->
      @repositories = new Collections::Repositories

    context "fetch all", ->

      before ->
        deferred = @repositories.fetch()
        @web_server.respond()
        deferred

      context "check result", ->
        it "length", -> expect(@repositories.length).to.eq 1

      context "get my-repo", ->

        before -> @my_repo = @repositories.get("my-repo")

        it "name", -> expect(@my_repo.get("name")).to.eq "my-repo"
        it "desc", -> expect(@my_repo.get("desc")).to.eq "This is my repository"
        it "url", -> expect(@my_repo.get("url")).to.eq "git://github.com/user/my-repo"
        it "website", -> expect(@my_repo.get("website")).to.eq "http://url/to/website"

    
