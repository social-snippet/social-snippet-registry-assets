describe "Routers::NewRouter", ->

  load_modules(
    "backbone"
    "app/controllers"
    "app/routers"
  )

  context "prepare sinon.sandbox", ->

    prepare_sinon_sandbox()

    context "prepare backbone.history", ->

      prepare_backbone_history()

      context "create controller", ->

        before ->
          @controller = new Controllers::NewController

        context "setup mock", ->

          # setup mock
          before ->
            @stub = @sandbox.stub @controller, "repository"

          context "create router", ->

            before ->
              @router = new Routers::NewRouter(
                controller: @controller
              )

            context "load /new", ->

              before ->
                Backbone.history.loadUrl "/new/repository"

              describe "NewController#repository", ->

                it "is called once", ->
                  expect(@stub.calledOnce).to.be.true

                it "is called with no args", ->
                  expect(@stub.calledWith()).to.be.true

