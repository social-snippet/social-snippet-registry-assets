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
    define('app/views/layouts/app_layout_view', [
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
                '<header class="region"></header>',
                '<div class="container-fluid">',
                '  <section class="region sidebar-region col-sm-3"></section>',
                '  <section class="region contents-region col-sm-9"></section>',
                '</div>',
                '<footer class="region"></footer>'
            ].join(''));
            AppLayoutView.prototype.regions = {
                headerRegion: 'header',
                sidebarRegion: '.sidebar-region',
                contentsRegion: '.contents-region',
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
    define('app/views/commons/header_view', [
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
    define('app/views/commons/footer_view', [
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
                '<li class="col-sm-4"><a href="https://social-snippet.github.io">Social Snippet</a></li>',
                '<li class="col-sm-4"><a href="https://social-snippet.github.io/blog">Blog</a></li>',
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
    define('app/views/commons/sidebar_view', [
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
            SidebarView.prototype.template = _.template(['<section class="navigation region"></section>'].join(''));
            SidebarView.prototype.className = 'view sidebar';
            SidebarView.prototype.regions = { navigationRegion: '.navigation.region' };
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
    define('app/views/contents/home_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var HomeView;
        return HomeView = function (_super) {
            __extends(HomeView, _super);
            function HomeView() {
                return HomeView.__super__.constructor.apply(this, arguments);
            }
            HomeView.prototype.template = _.template([
                '<section class="region main-region col-sm-8"></section>',
                '<section class="region sub-region col-sm-4"></section>'
            ].join(''));
            HomeView.prototype.className = 'row';
            HomeView.prototype.regions = {
                mainRegion: '.main-region',
                subRegion: '.sub-region'
            };
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
    define('app/views/components/panel_view', [
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
                '<div class="panel-heading"><%- head %></div>',
                '<div class="panel-body"><%- body %></div>'
            ].join(''));
            PanelView.prototype.className = 'panel panel-default';
            return PanelView;
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
    define('app/views/contents/home/home_main_region_view', [
        'backbone',
        'backbone.marionette',
        'app/views/components/panel_view'
    ], function (Backbone, Marionette, PanelView) {
        var HomeMainRegionView;
        return HomeMainRegionView = function (_super) {
            __extends(HomeMainRegionView, _super);
            function HomeMainRegionView() {
                return HomeMainRegionView.__super__.constructor.apply(this, arguments);
            }
            HomeMainRegionView.prototype.childView = PanelView;
            return HomeMainRegionView;
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
    define('app/views/contents/home/home_sub_region_view', [
        'backbone',
        'backbone.marionette'
    ], function (Backbone, Marionette) {
        var HomeSubRegionView;
        return HomeSubRegionView = function (_super) {
            __extends(HomeSubRegionView, _super);
            function HomeSubRegionView() {
                return HomeSubRegionView.__super__.constructor.apply(this, arguments);
            }
            HomeSubRegionView.prototype.template = _.template(['<section class="region github-login-region"></section>'].join('\n'));
            HomeSubRegionView.prototype.regions = { githubLoginRegion: '.github-login-region' };
            return HomeSubRegionView;
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
    define('app/views/contents/new_repository_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var NewRepositoryView;
        return NewRepositoryView = function (_super) {
            __extends(NewRepositoryView, _super);
            function NewRepositoryView() {
                return NewRepositoryView.__super__.constructor.apply(this, arguments);
            }
            NewRepositoryView.prototype.template = _.template([
                '<section class="region by-url-region"></section>',
                '<section class="region by-github-region"></section>'
            ].join(''));
            NewRepositoryView.prototype.regions = {
                byUrlRegion: '.by-url-region',
                byGitHubRegion: '.by-github-region'
            };
            NewRepositoryView.prototype.initialize = function () {
                return this;
            };
            return NewRepositoryView;
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
    define('app/views/components/link_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var LinkView;
        return LinkView = function (_super) {
            __extends(LinkView, _super);
            function LinkView() {
                return LinkView.__super__.constructor.apply(this, arguments);
            }
            LinkView.prototype.tagName = 'li';
            LinkView.prototype.template = _.template(['<a href="<%- href %>"><%- text %></a>'].join());
            return LinkView;
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
    define('app/views/components/links_view', [
        'underscore',
        'backbone.marionette',
        'app/views/components/link_view'
    ], function (_, Marionette, LinkView) {
        var LinksView;
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
    define('app/views/contents/sidebar/navigation_region_view', [
        'backbone',
        'backbone.marionette',
        'app/views/components/links_view'
    ], function (Backbone, Marionette, LinksView) {
        var NavigationRegionView;
        return NavigationRegionView = function (_super) {
            __extends(NavigationRegionView, _super);
            function NavigationRegionView() {
                return NavigationRegionView.__super__.constructor.apply(this, arguments);
            }
            NavigationRegionView.prototype.className = 'nav';
            NavigationRegionView.prototype.collection = new Backbone.Collection([
                {
                    text: 'Home',
                    href: '/'
                },
                {
                    text: 'Add Repository',
                    href: '/new/repository'
                },
                {
                    text: 'Search',
                    href: '/search'
                }
            ]);
            return NavigationRegionView;
        }(LinksView);
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
    define('app/views/components/add_repository_by_url_view', [
        'underscore',
        'backbone.marionette',
        'app/models'
    ], function (_, Marionette, Models) {
        var AddRepositoryByUrlView;
        return AddRepositoryByUrlView = function (_super) {
            __extends(AddRepositoryByUrlView, _super);
            function AddRepositoryByUrlView() {
                return AddRepositoryByUrlView.__super__.constructor.apply(this, arguments);
            }
            AddRepositoryByUrlView.prototype.template = _.template([
                '<div class="form">',
                '<h3>Add Repository by URL</h3>',
                '<div class="row">',
                '<div class="col-sm-10"><input type="text" class="form-control input-lg" class="new-repo-url" placeholder="Enter the URL of repository"></div>',
                '<div class="col-sm-2"><button class="btn btn-lg btn-primary add" type="button">Add</button></div>',
                '</div>',
                '</div>'
            ].join(''));
            AddRepositoryByUrlView.prototype.events = {
                'click .add': function () {
                    var new_repo;
                    new_repo = new Models.prototype.Repository({ url: this.$('.new-repo-url').val() });
                    return new_repo.save();
                }
            };
            AddRepositoryByUrlView.prototype.className = 'well';
            AddRepositoryByUrlView.prototype.initialize = function () {
            };
            return AddRepositoryByUrlView;
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
    define('app/views/components/add_repository_by_github_view', [
        'underscore',
        'backbone.marionette',
        'app/models'
    ], function (_, Marionette, Models) {
        var AddRepositoryByGitHubView;
        return AddRepositoryByGitHubView = function (_super) {
            __extends(AddRepositoryByGitHubView, _super);
            function AddRepositoryByGitHubView() {
                return AddRepositoryByGitHubView.__super__.constructor.apply(this, arguments);
            }
            AddRepositoryByGitHubView.prototype.template = _.template([
                '<div class="form">',
                '<h3>Add GitHub Repository</h3>',
                '<div class="row">',
                '<div class="col-sm-5"><input type="text" class="form-control input-lg" class="new-repo-user" placeholder="Enter the user name"></div>',
                '<div class="col-sm-5"><input type="text" class="form-control input-lg" class="new-repo-name" placeholder="Enter the repo name"></div>',
                '<div class="col-sm-2"><button class="btn btn-lg btn-primary add" type="button">Add</button></div>',
                '</div>',
                '</div>'
            ].join(''));
            AddRepositoryByGitHubView.prototype.events = {
                'click .add': function () {
                    var new_repo;
                    new_repo = new Models.prototype.Repository({ url: this.$('#new-repo-url').val() });
                    return new_repo.save();
                }
            };
            AddRepositoryByGitHubView.prototype.className = 'well';
            AddRepositoryByGitHubView.prototype.initialize = function () {
            };
            return AddRepositoryByGitHubView;
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
    define('app/views/components/github_login_form_view', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var GitHubLoginFormView;
        return GitHubLoginFormView = function (_super) {
            __extends(GitHubLoginFormView, _super);
            function GitHubLoginFormView() {
                return GitHubLoginFormView.__super__.constructor.apply(this, arguments);
            }
            GitHubLoginFormView.prototype.template = _.template(['<a class="btn btn-block btn-social btn-github"><i class="fa fa-github"></i> Sign in with GitHub</a>'].join());
            return GitHubLoginFormView;
        }(Marionette.ItemView);
    });
}.call(this));
(function () {
    define('app/views', [
        'app/views/layouts/app_layout_view',
        'app/views/commons/header_view',
        'app/views/commons/footer_view',
        'app/views/commons/sidebar_view',
        'app/views/contents/home_view',
        'app/views/contents/home/home_main_region_view',
        'app/views/contents/home/home_sub_region_view',
        'app/views/contents/new_repository_view',
        'app/views/contents/sidebar/navigation_region_view',
        'app/views/components/link_view',
        'app/views/components/links_view',
        'app/views/components/panel_view',
        'app/views/components/add_repository_by_url_view',
        'app/views/components/add_repository_by_github_view',
        'app/views/components/github_login_form_view'
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
                var home_view, sub_region_view;
                home_view = new Views.prototype.HomeView();
                app.layout.currentView.contentsRegion.show(home_view);
                home_view.mainRegion.show(new Views.prototype.HomeMainRegionView({
                    collection: new Backbone.Collection([
                        {
                            head: 'Welcome to SSPM Registry System',
                            body: '$ sspm install {snippet-name}'
                        },
                        {
                            head: 'What\'s New',
                            body: 'xxxx xxxx'
                        }
                    ])
                }));
                sub_region_view = new Views.prototype.HomeSubRegionView();
                home_view.subRegion.show(sub_region_view);
                return sub_region_view.githubLoginRegion.show(new Views.prototype.GitHubLoginFormView());
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
    define('app/controllers/new_controller', [
        'underscore',
        'backbone',
        'backbone.marionette',
        'app/views',
        'app/collections'
    ], function (_, Backbone, Marionette, Views) {
        var NewController;
        return NewController = function (_super) {
            __extends(NewController, _super);
            function NewController() {
                return NewController.__super__.constructor.apply(this, arguments);
            }
            NewController.prototype.repository = function () {
                var new_repo_view;
                new_repo_view = new Views.prototype.NewRepositoryView();
                app.layout.currentView.contentsRegion.show(new_repo_view);
                new_repo_view.byUrlRegion.show(new Views.prototype.AddRepositoryByUrlView());
                return new_repo_view.byGitHubRegion.show(new Views.prototype.AddRepositoryByGitHubView());
            };
            return NewController;
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
    define('app/controllers/search_repository_controller', [
        'underscore',
        'backbone.marionette'
    ], function (_, Marionette) {
        var SearchRepositoryController;
        return SearchRepositoryController = function (_super) {
            __extends(SearchRepositoryController, _super);
            function SearchRepositoryController() {
                return SearchRepositoryController.__super__.constructor.apply(this, arguments);
            }
            SearchRepositoryController.prototype.form = function () {
                return app.layout.currentView.contentsRegion.show(new Marionette.LayoutView({
                    template: _.template([
                        '<div class="panel panel-default">',
                        '<div class="panel-heading">',
                        '<h4>Search Repositories</h4>',
                        '</div>',
                        '<div class="panel-body">',
                        '<form class="form-inline" action="/search" method="get">',
                        '<div class="form-group">',
                        '<input type="text" name="q" class="form-control query">',
                        '<input type="submit" class="btn btn-primary search pull-right" value="Go">',
                        '</div>',
                        '</form>',
                        '</div>',
                        '</div>'
                    ].join('\n'))
                }));
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
            return RepositoriesController;
        }(Marionette.Controller);
    });
}.call(this));
(function () {
    define('app/controllers', [
        'app/controllers/home_controller',
        'app/controllers/new_controller',
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
    define('app/routers/new_router', ['backbone.marionette'], function (Marionette) {
        var NewRouter;
        return NewRouter = function (_super) {
            __extends(NewRouter, _super);
            function NewRouter() {
                return NewRouter.__super__.constructor.apply(this, arguments);
            }
            NewRouter.prototype.appRoutes = { 'new/repository': 'repository' };
            return NewRouter;
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
                'search?q=:query': 'result',
                'search': 'form'
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
        'app/routers/new_router',
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
                    return sidebar_view.navigationRegion.show(new Views.prototype.NavigationRegionView());
                });
                this.addInitializer(function () {
                    return new Routers.prototype.HomeRouter({ controller: new Controllers.prototype.HomeController() });
                });
                this.addInitializer(function () {
                    return new Routers.prototype.NewRouter({ controller: new Controllers.prototype.NewController() });
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