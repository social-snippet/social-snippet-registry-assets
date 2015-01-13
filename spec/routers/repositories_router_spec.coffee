describe "Routers::RepositoriesRouter", ->

  Backbone = require("backbone")
  Controllers = require("controllers")
  Routers = require("routers")

  context "prepare sinon.sandbox", ->

    SpecHelpers.prepare_sinon_sandbox()

    context "prepare backbone.history", ->

      SpecHelpers.prepare_backbone_history()

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

