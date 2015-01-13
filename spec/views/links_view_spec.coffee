describe "Links View", ->

  Backbone = require("backbone")
  Views = require("views")

  # prepare template
  before ->
    document.body.innerHTML = __html__["spec/fixtures/template_link_view.html"]

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
        @view = new Views::Components::LinksView(
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
            expect(@view.$("a:contains('hello')").size()).to.eq 1

          it "contains world", ->
            expect(@view.$("a:contains('world')").size()).to.eq 1

