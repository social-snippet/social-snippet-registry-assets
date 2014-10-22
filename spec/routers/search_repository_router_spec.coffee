describe "Routers::SearchRepositoryRouter", ->

  load_modules(
    "backbone"
    "app/controllers"
    "app/routers"
  )

  context "create sinon.sandbox", ->

    before ->
      @sandbox = sinon.sandbox.create()

    after ->
      @sandbox.restore()

    context "create controller", ->

      before ->
        @controller = new Controllers::SearchRepositoryController

      context "setup mock", ->

        # setup mock
        before ->
          # @result_stub = @sandbox.stub @controller, "result"
          @form_stub = @sandbox.stub @controller, "form"

        context "create router", ->

          before ->
            @router = new Routers::SearchRepositoryRouter(
              controller: @controller
            )

          context "load /search", ->
            
            before ->
              Backbone.history.start(
                pushState: true
              )
              Backbone.history.loadUrl "/search"

            describe "controller#form", ->

              it "is called once", ->
                expect(@form_stub.calledOnce).to.be.true

              it "is called with no args", ->
                expect(@form_stub.calledWith()).to.be.true

          context "load /search?q=repo", ->
            
            before ->
              Backbone.history.loadUrl "/search?q=repo"

            describe "controller#result", ->

              it "is callled once" # TODO

              it "is called with repo" # TODO

