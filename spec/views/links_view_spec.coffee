describe "Links View", ->

  load_modules(
    "jquery"
    "backbone"
    "app/views/components/links_view"
  )

  # prepare template
  before ->
    $("body").append [
      '<script id="template-link-view" type="text/html">'
      '<a href="<%= href %>"><%= text %></a>'
      '</script>'
    ].join("\n")

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
            expect(@view.$("a:contains('hello')").size()).to.eq 1

          it "contains world", ->
            expect(@view.$("a:contains('world')").size()).to.eq 1

