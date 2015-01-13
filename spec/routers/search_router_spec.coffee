describe "Routers::SearchRepositoryRouter", ->

  Backbone = require("backbone")
  Controllers = require("controllers")
  Routers = require("routers")

  context "prepare sinon.sandbox", ->

    SpecHelpers.prepare_sinon_sandbox()

    context "prepare backbone.history", ->

      SpecHelpers.prepare_backbone_history()

      context "create controller", ->

        before ->
          @controller = new Controllers::SearchController

        context "setup mock", ->

          # setup mock
          before ->
            @result_stub = @sandbox.stub @controller, "result"
            @form_stub = @sandbox.stub @controller, "form"

          context "create router", ->

            before ->
              @router = new Routers::SearchRouter(
                controller: @controller
              )

            context "load /search", ->
              
              before ->
                Backbone.history.loadUrl "search"

              describe "controller#form", ->

                it "is called once", ->
                  expect(@form_stub.calledOnce).to.be.true

                it "is called with no args", ->
                  expect(@form_stub.calledWith()).to.be.true

            context "load /search?q=repo", ->
              
              before ->
                Backbone.history.loadUrl "/search?q=repo"

              describe "controller#result", ->

                it "is callled once", ->
                  expect(@result_stub.calledOnce).to.be.true

                it "is called with repo", ->
                  expect(@result_stub.calledWith("repo")).to.be.true

