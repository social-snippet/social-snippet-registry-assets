describe "Routers::RepositoriesRouter", ->

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
          @controller = new Controllers::RepositoriesController

        context "setup stub", ->

          before ->
            @stub_all = @sandbox.stub @controller, "all"

          context "create router", ->

            before ->
              @router = new Routers::RepositoriesRouter(
                controller: @controller
              )

            context "load /repositories", ->

              before ->
                Backbone.history.loadUrl "/repositories"

              describe "RepositoriesController#all", ->

                it "is called once", ->
                  expect(@stub_all.calledOnce).to.be.true

                it "is called with no args", ->
                  expect(@stub_all.calledWith()).to.be.true
