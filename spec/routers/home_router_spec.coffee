describe "Routers::HomeRouter", ->

  Backbone = require("backbone")
  Controllers = require("controllers")
  Routers = require("routers")

  context "prepare sinon.sandbox", ->

    SpecHelpers.prepare_sinon_sandbox()

    context "prepare backbone.history", ->

      SpecHelpers.prepare_backbone_history()

      context "create controller", ->

        before ->
          @controller = new Controllers::HomeController

        context "setup mock", ->

          # setup mock
          before ->
            @stub = @sandbox.stub @controller, "index"

          context "create router", ->

            before ->
              @router = new Routers::HomeRouter(
                controller: @controller
              )

            context "load /", ->

              before ->
                Backbone.history.loadUrl "/"

              describe "HomeController#index", ->

                it "is called once", ->
                  expect(@stub.calledOnce).to.be.true

                it "is called with no args", ->
                  expect(@stub.calledWith()).to.be.true

