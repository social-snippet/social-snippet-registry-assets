describe "AppRouter", ->

  load_modules(
    "app/routers"
  )

  context "create instance", ->

    before ->
      @router = new Routers::AppRouter

    context "constructor", ->

      it "defined?", ->
        expect(@router.constructor.name).to.eq "AppRouter"

