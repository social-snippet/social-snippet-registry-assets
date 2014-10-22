describe "BaseView", ->
  
  load_modules(
    "app/views"
  )

  describe "toSnake()", ->

    context "create instance", ->
      
      before ->
        @instance = new Views::BaseView

      context "call toSnake()", ->
        
        before ->
          @result = @instance.toSnake()

        it "is base-view", ->
          expect(@result).to.eq "base-view"

