(function() {
  this.Utils = (function() {
    function Utils() {}

    Utils.loadModules = function(class_obj, modules) {
      modules.forEach(function(module_class) {
        return class_obj.prototype[module_class.name] = module_class;
      });
      return class_obj;
    };

    return Utils;

  })();

}).call(this);

(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/models/repository', ['backbone'], function (Backbone) {
        var Repository;
        return Repository = function (_super) {
            __extends(Repository, _super);
            function Repository() {
                return Repository.__super__.constructor.apply(this, arguments);
            }
            Repository.prototype.idAttribute = 'name';
            Repository.prototype.urlRoot = '//' + WEB_API_HOST + '/api/' + WEB_API_VERSION + '/repositories';
            Repository.prototype.initialize = function () {
            };
            return Repository;
        }(Backbone.Model);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/collections/repositories', [
        'backbone',
        'app/models/repository'
    ], function (Backbone, Repository) {
        var Repositories;
        return Repositories = function (_super) {
            __extends(Repositories, _super);
            function Repositories() {
                return Repositories.__super__.constructor.apply(this, arguments);
            }
            Repositories.prototype.model = Repository;
            Repositories.prototype.set_default_options = function () {
                var _base;
                return (_base = this.options).query || (_base.query = '');
            };
            Repositories.prototype.url = function () {
                if (this.options.query === '') {
                    return '//' + WEB_API_HOST + '/api/' + WEB_API_VERSION + '/repositories';
                } else {
                    return '//' + WEB_API_HOST + '/api/' + WEB_API_VERSION + '/repositories?q=' + this.options.query;
                }
            };
            Repositories.prototype.initialize = function (models, new_options) {
                this.options = new_options;
                this.options || (this.options = {});
                return this.set_default_options();
            };
            Repositories.prototype.search = function (query) {
                this.options.query = query;
                return this.fetch();
            };
            return Repositories;
        }(Backbone.Collection);
    });
}.call(this));
(function () {
    define('app/collections', ['app/collections/repositories'], function () {
        var Collections, modules;
        modules = Array.prototype.splice.call(arguments, 0);
        Collections = function () {
            function Collections() {
            }
            return Collections;
        }();
        return Utils.loadModules(Collections, modules);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/app_layout_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var AppLayoutView;
        return AppLayoutView = function (_super) {
            __extends(AppLayoutView, _super);
            function AppLayoutView() {
                return AppLayoutView.__super__.constructor.apply(this, arguments);
            }
            AppLayoutView.prototype.template = _.template([
                '<header></header>',
                '<div class="container-fluid">',
                '  <section id="sidebar" class="col-sm-3"></section>',
                '  <section id="contents" class="col-sm-9"></section>',
                '</div>',
                '<footer></footer>'
            ].join(''));
            AppLayoutView.prototype.regions = {
                headerRegion: 'header',
                sidebarRegion: '#sidebar',
                contentsRegion: '#contents',
                footerRegion: 'footer'
            };
            AppLayoutView.prototype.initialize = function () {
                return this;
            };
            return AppLayoutView;
        }(Marionette.LayoutView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/header_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var HeaderView;
        return HeaderView = function (_super) {
            __extends(HeaderView, _super);
            function HeaderView() {
                return HeaderView.__super__.constructor.apply(this, arguments);
            }
            HeaderView.prototype.template = _.template(['<a class="navbar-brand" href="/"><%- "SSPM Registry System" %></a>'].join(''));
            HeaderView.prototype.className = 'navbar navbar-inverse navbar-fixed-top';
            HeaderView.prototype.initialize = function () {
                return this;
            };
            return HeaderView;
        }(Marionette.LayoutView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/footer_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var FooterView;
        return FooterView = function (_super) {
            __extends(FooterView, _super);
            function FooterView() {
                return FooterView.__super__.constructor.apply(this, arguments);
            }
            FooterView.prototype.template = _.template([
                '<ul class="list-unstyled text-right">',
                '<li class="col-sm-4"><a href="https://github.com/social-snippet">GitHub</a></li>',
                '<li class="col-sm-4"><a href="https://github.com/social-snippet/social-snippet-registry/issues">Feedback</a></li>',
                '</ul>'
            ].join(''));
            FooterView.prototype.className = 'container';
            FooterView.prototype.initialize = function () {
                return this;
            };
            return FooterView;
        }(Marionette.LayoutView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/sidebar_view', [
        'underscore',
        'backbone',
        'backbone.marionette'
    ], function (_, Backbone, Marionette) {
        var SidebarView;
        return SidebarView = function (_super) {
            __extends(SidebarView, _super);
            function SidebarView() {
                return SidebarView.__super__.constructor.apply(this, arguments);
            }
            SidebarView.prototype.template = _.template([
                '<div class="contents">',
                '</div>'
            ].join(''));
            SidebarView.prototype.regions = { contentsRegion: '.contents' };
            SidebarView.prototype.initialize = function () {
                return this;
            };
            return SidebarView;
        }(Marionette.LayoutView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/home_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var HomeView;
        return HomeView = function (_super) {
            __extends(HomeView, _super);
            function HomeView() {
                return HomeView.__super__.constructor.apply(this, arguments);
            }
            HomeView.prototype.template = _.template(['<section class="main"></section>'].join(''));
            HomeView.prototype.regions = { mainRegion: '.main' };
            HomeView.prototype.initialize = function () {
                return this;
            };
            return HomeView;
        }(Marionette.LayoutView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/links_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var LinkView, LinksView;
        LinkView = function (_super) {
            __extends(LinkView, _super);
            function LinkView() {
                return LinkView.__super__.constructor.apply(this, arguments);
            }
            LinkView.prototype.tagName = 'li';
            LinkView.prototype.template = _.template(['<a href="<%- href %>"><%- text %></a>'].join());
            return LinkView;
        }(Marionette.ItemView);
        return LinksView = function (_super) {
            __extends(LinksView, _super);
            function LinksView() {
                return LinksView.__super__.constructor.apply(this, arguments);
            }
            LinksView.prototype.tagName = 'ul';
            LinksView.prototype.childView = LinkView;
            return LinksView;
        }(Marionette.CollectionView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/models/application', ['backbone'], function (Backbone) {
        var Application;
        return Application = function (_super) {
            __extends(Application, _super);
            function Application() {
                return Application.__super__.constructor.apply(this, arguments);
            }
            Application.prototype.defaults = function () {
                return {
                    title: 'SSPM',
                    sub_title: 'Social SniPpet Manager',
                    links: {
                        '/repositories/new': 'Add Repository',
                        '/search': 'Search Repository'
                    }
                };
            };
            Application.prototype.initialize = function () {
            };
            return Application;
        }(Backbone.Model);
    });
}.call(this));
(function () {
    define('app/models', [
        'app/models/application',
        'app/models/repository'
    ], function () {
        var Models, modules;
        modules = Array.prototype.splice.call(arguments, 0);
        Models = function () {
            function Models() {
            }
            return Models;
        }();
        return Utils.loadModules(Models, modules);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/new_repository_view', [
        'underscore',
        'backbone.marionette',
        'app/models'
    ], function (_, Marionette, Models) {
        var NewRepositoryView;
        return NewRepositoryView = function (_super) {
            __extends(NewRepositoryView, _super);
            function NewRepositoryView() {
                return NewRepositoryView.__super__.constructor.apply(this, arguments);
            }
            NewRepositoryView.prototype.template = _.template([
                '<div class="form-group">',
                '<input type="text" class="form-control url">',
                '<button class="btn btn-primary add">Add</button>',
                '</div>'
            ].join(''));
            NewRepositoryView.prototype.events = {
                'click .add': function () {
                    var new_repo;
                    new_repo = new Models.prototype.Repository({ url: this.$('.url').val() });
                    return new_repo.save();
                }
            };
            NewRepositoryView.prototype.className = 'form-inline';
            NewRepositoryView.prototype.initialize = function () {
            };
            return NewRepositoryView;
        }(Marionette.ItemView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/repositories_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var RepositoriesView, RepositoryView;
        RepositoryView = function (_super) {
            __extends(RepositoryView, _super);
            function RepositoryView() {
                return RepositoryView.__super__.constructor.apply(this, arguments);
            }
            RepositoryView.prototype.tagName = 'div';
            RepositoryView.prototype.template = _.template([
                '<p>name: <%- name %></p>',
                '<p>desc: <%- desc %></p>'
            ].join(''));
            return RepositoryView;
        }(Marionette.ItemView);
        return RepositoriesView = function (_super) {
            __extends(RepositoriesView, _super);
            function RepositoriesView() {
                return RepositoriesView.__super__.constructor.apply(this, arguments);
            }
            RepositoriesView.prototype.tagName = 'div';
            RepositoriesView.prototype.childView = RepositoryView;
            RepositoriesView.prototype.initialize = function () {
            };
            return RepositoriesView;
        }(Marionette.CollectionView);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/views/panel_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var PanelView;
        return PanelView = function (_super) {
            __extends(PanelView, _super);
            function PanelView() {
                return PanelView.__super__.constructor.apply(this, arguments);
            }
            PanelView.prototype.tagName = 'div';
            PanelView.prototype.template = _.template([
                '<div class="panel-heading"></div>',
                '<div class="panel-body"></div>'
            ].join(''));
            PanelView.prototype.regions = {
                headRegion: '.panel-heading',
                bodyRegion: '.panel-body'
            };
            PanelView.prototype.className = 'panel panel-default';
            return PanelView;
        }(Marionette.LayoutView);
    });
}.call(this));
(function () {
    define('app/views', [
        'app/views/app_layout_view',
        'app/views/header_view',
        'app/views/footer_view',
        'app/views/sidebar_view',
        'app/views/home_view',
        'app/views/links_view',
        'app/views/new_repository_view',
        'app/views/repositories_view',
        'app/views/panel_view'
    ], function () {
        var Views, modules;
        modules = Array.prototype.splice.call(arguments, 0);
        Views = function () {
            function Views() {
            }
            return Views;
        }();
        return Utils.loadModules(Views, modules);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/controllers/home_controller', [
        'backbone',
        'backbone.marionette',
        'app/views'
    ], function (Backbone, Marionette, Views) {
        var HomeController;
        return HomeController = function (_super) {
            __extends(HomeController, _super);
            function HomeController() {
                return HomeController.__super__.constructor.apply(this, arguments);
            }
            HomeController.prototype.index = function () {
                var home_view, welcome_panel;
                home_view = new Views.prototype.HomeView();
                app.layout.currentView.contentsRegion.show(home_view);
                welcome_panel = new Views.prototype.PanelView();
                home_view.mainRegion.show(welcome_panel);
                welcome_panel.headRegion.show(new Marionette.ItemView({ template: _.template(['<h4>Welcome to SSPM Registry</h4>'].join('\n')) }));
                return welcome_panel.bodyRegion.show(new Marionette.ItemView({ template: _.template(['$ sspm install {snippet-name}'].join('\n')) }));
            };
            return HomeController;
        }(Marionette.Controller);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/controllers/search_repository_controller', ['backbone.marionette'], function (Marionette) {
        var SearchRepositoryController;
        return SearchRepositoryController = function (_super) {
            __extends(SearchRepositoryController, _super);
            function SearchRepositoryController() {
                return SearchRepositoryController.__super__.constructor.apply(this, arguments);
            }
            SearchRepositoryController.prototype.form = function () {
            };
            SearchRepositoryController.prototype.result = function (repo) {
                return console.log('this is result');
            };
            return SearchRepositoryController;
        }(Marionette.Controller);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/controllers/repositories_controller', [
        'underscore',
        'backbone',
        'backbone.marionette',
        'app/views',
        'app/collections'
    ], function (_, Backbone, Marionette, Views, Collections) {
        var RepositoriesController;
        return RepositoriesController = function (_super) {
            __extends(RepositoriesController, _super);
            function RepositoriesController() {
                return RepositoriesController.__super__.constructor.apply(this, arguments);
            }
            RepositoriesController.prototype.all = function () {
                var repos, view;
                repos = new Collections.prototype.Repositories();
                view = new Views.prototype.RepositoriesView({ collection: repos });
                app.main.show(view);
                return repos.fetch();
            };
            RepositoriesController.prototype.show = function (repo_id) {
            };
            RepositoriesController.prototype['new'] = function () {
                var new_repo_view, sub_layout;
                new_repo_view = new Views.prototype.NewRepositoryView({ model: new Backbone.Model({ action: '' + WEB_API_PROTOCOL + '://' + WEB_API_HOST + '/api/' + WEB_API_VERSION + '/repositories' }) });
                sub_layout = new Marionette.LayoutView({
                    template: _.template([
                        '<div class="panel panel-default">',
                        '<div class="panel-heading"><h4>Add URL</h4></div>',
                        '<section class="panel-body add-by-url"></section>',
                        '</div>',
                        '<div class="panel panel-default">',
                        '<div class="panel-heading"><h4>Add GitHub Repo<h4></div>',
                        '<section class="panel-body add-by-github"></section>',
                        '</div>'
                    ].join('\n')),
                    regions: {
                        urlRegion: '.add-by-url',
                        githubRegion: '.add-by-url'
                    }
                });
                app.layout.currentView.contentsRegion.show(sub_layout);
                return sub_layout.urlRegion.show(new_repo_view);
            };
            return RepositoriesController;
        }(Marionette.Controller);
    });
}.call(this));
(function () {
    define('app/controllers', [
        'app/controllers/home_controller',
        'app/controllers/search_repository_controller',
        'app/controllers/repositories_controller'
    ], function () {
        var Controllers, modules;
        modules = Array.prototype.splice.call(arguments, 0);
        Controllers = function () {
            function Controllers() {
            }
            return Controllers;
        }();
        return Utils.loadModules(Controllers, modules);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/routers/home_router', [
        'backbone.marionette',
        'app/controllers'
    ], function (Marionette, Controllers) {
        var HomeRouter;
        return HomeRouter = function (_super) {
            __extends(HomeRouter, _super);
            function HomeRouter() {
                return HomeRouter.__super__.constructor.apply(this, arguments);
            }
            HomeRouter.prototype.appRoutes = { '': 'index' };
            return HomeRouter;
        }(Marionette.AppRouter);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/routers/search_repository_router', ['backbone.marionette'], function (Marionette) {
        var SearchRepositoryRouter;
        return SearchRepositoryRouter = function (_super) {
            __extends(SearchRepositoryRouter, _super);
            function SearchRepositoryRouter() {
                return SearchRepositoryRouter.__super__.constructor.apply(this, arguments);
            }
            SearchRepositoryRouter.prototype.appRoutes = {
                'search': 'form',
                'search-result?q=:query': 'result'
            };
            return SearchRepositoryRouter;
        }(Marionette.AppRouter);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/routers/repositories_router', ['backbone.marionette'], function (Marionette) {
        var RepositoriesRouter;
        return RepositoriesRouter = function (_super) {
            __extends(RepositoriesRouter, _super);
            function RepositoriesRouter() {
                return RepositoriesRouter.__super__.constructor.apply(this, arguments);
            }
            RepositoriesRouter.prototype.appRoutes = {
                'new': 'new',
                'repositories': 'all',
                'repositories/:repo_id': 'show'
            };
            return RepositoriesRouter;
        }(Marionette.AppRouter);
    });
}.call(this));
(function () {
    define('app/routers', [
        'app/routers/home_router',
        'app/routers/search_repository_router',
        'app/routers/repositories_router'
    ], function () {
        var Routers, modules;
        modules = Array.prototype.splice.call(arguments, 0);
        Routers = function () {
            function Routers() {
            }
            return Routers;
        }();
        return Utils.loadModules(Routers, modules);
    });
}.call(this));
(function () {
    var __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };
    define('app/app', [
        'app/collections',
        'app/controllers',
        'app/models',
        'app/routers',
        'app/views',
        'backbone',
        'backbone.marionette'
    ], function (Collections, Controllers, Models, Routers, Views, Backbone, Marionette) {
        var App;
        return App = function (_super) {
            __extends(App, _super);
            function App() {
                return App.__super__.constructor.apply(this, arguments);
            }
            App.prototype.regions = { layout: '#main-container' };
            App.prototype.initialize = function (options) {
                this.addInitializer(function () {
                    var footer_view, header_view, layout_view, sidebar_view;
                    layout_view = new Views.prototype.AppLayoutView();
                    header_view = new Views.prototype.HeaderView();
                    footer_view = new Views.prototype.FooterView();
                    sidebar_view = new Views.prototype.SidebarView();
                    this.layout.show(layout_view.render());
                    layout_view.headerRegion.show(header_view);
                    layout_view.footerRegion.show(footer_view);
                    layout_view.sidebarRegion.show(sidebar_view);
                    return sidebar_view.contentsRegion.show(new Views.prototype.LinksView({
                        className: 'nav',
                        collection: new Backbone.Collection([
                            {
                                text: 'Home',
                                href: '/'
                            },
                            {
                                text: 'Add Repository',
                                href: '/new'
                            },
                            {
                                text: 'Search',
                                href: '/search'
                            }
                        ])
                    }));
                });
                this.addInitializer(function () {
                    return new Routers.prototype.HomeRouter({ controller: new Controllers.prototype.HomeController() });
                });
                this.addInitializer(function () {
                    return new Routers.prototype.SearchRepositoryRouter({ controller: new Controllers.prototype.SearchRepositoryController() });
                });
                this.addInitializer(function () {
                    return new Routers.prototype.RepositoriesRouter({ controller: new Controllers.prototype.RepositoriesController() });
                });
                return this.on('start', function () {
                    return Backbone.history.start({ pushState: true });
                });
            };
            return App;
        }(Marionette.Application);
    });
}.call(this));