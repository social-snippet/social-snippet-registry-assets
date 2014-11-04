describe "Links View", ->

  load_modules(
    "backbone"
    "app/views/links_view"
  )

  context "create collection", ->

    before ->
      @collection = new Backbone.Collection [
        {
          text: "hello"
          href: "http://url/to/hello"
        }
        {
          text: "world"
          href: "http://url/to/world"
        }
      ]

    context "create links view", ->

      before ->
        @view = new LinksView(
          collection: @collection
        )

      context "render", ->

        before -> @view.render()

        context "view element", ->

          it "is ul tag", ->
            expect(@view.el.tagName).to.match /ul/i

          it "has two items", ->
            expect(@view.$("li").size()).to.eq 2

          it "contains hello", ->
            expect(@view.$("a:contains('hello')")).to.be.ok

          it "contains world", ->
            expect(@view.$("a:contains('world')")).to.be.ok

