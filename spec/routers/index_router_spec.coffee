describe "Routers::IndexRouter", ->

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
          @controller = new Controllers::IndexController

        context "setup mock", ->

          # setup mock
          before ->
            @stub = @sandbox.stub @controller, "index"

          context "create router", ->

            before ->
              @router = new Routers::IndexRouter(
                controller: @controller
              )

            context "load /", ->

              before ->
                Backbone.history.loadUrl "/"

              describe "IndexController#index", ->

                it "is called once", ->
                  expect(@stub.calledOnce).to.be.true

                it "is called with no args", ->
                  expect(@stub.calledWith()).to.be.true

