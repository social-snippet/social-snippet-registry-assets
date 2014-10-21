describe "AppRouter", ->

  load_modules(
    "app/app_router"
  )

  context "create instance", ->

    before ->
      @router = new AppRouter

    context "constructor", ->

      it "defined?", ->
        expect(@router.constructor.name).to.eq "AppRouter"

