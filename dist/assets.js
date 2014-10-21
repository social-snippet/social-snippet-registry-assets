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
    define('app/views/base_view', ['backbone'], function (Backbone) {
        var BaseView;
        return BaseView = function (_super) {
            __extends(BaseView, _super);
            function BaseView() {
                return BaseView.__super__.constructor.apply(this, arguments);
            }
            BaseView.prototype.toSnake = function () {
                var name;
                name = this.constructor.name;
                name = name.replace(/^([A-Z])/, function ($1) {
                    return $1.toLowerCase();
                });
                return name = name.replace(/([A-Z])/g, function ($1) {
                    return '-' + $1.toLowerCase();
                });
            };
            BaseView.prototype.className = function () {
                return 'view';
            };
            return BaseView;
        }(Backbone.View);
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
    define('app/views/application_view', [
        'jquery',
        'app/views/base_view'
    ], function ($, BaseView) {
        var ApplicationView;
        return ApplicationView = function (_super) {
            __extends(ApplicationView, _super);
            function ApplicationView() {
                return ApplicationView.__super__.constructor.apply(this, arguments);
            }
            ApplicationView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + ApplicationView.__super__.className.apply(this, arguments);
            };
            ApplicationView.prototype.initialize = function () {
            };
            ApplicationView.prototype.render = function () {
                var el_title;
                el_title = $(document.createElement('h1')).append(this.model.get('title'));
                this.$el.empty().append(el_title);
                return this;
            };
            return ApplicationView;
        }(BaseView);
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
    define('app/models/repository/repository', ['backbone'], function (Backbone) {
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
        'app/models/repository/repository'
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
    define('app/models/element/input_element', ['backbone'], function (Backbone) {
        var InputElement;
        return InputElement = function (_super) {
            __extends(InputElement, _super);
            function InputElement() {
                return InputElement.__super__.constructor.apply(this, arguments);
            }
            InputElement.prototype.defaults = function () {
                return {
                    'type': 'text',
                    'name': '',
                    'value': ''
                };
            };
            return InputElement;
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
    define('app/models/repository/repository_search_form', [
        'backbone',
        'app/models/element/input_element'
    ], function (Backbone, InputElement) {
        var RepositorySearchForm;
        return RepositorySearchForm = function (_super) {
            __extends(RepositorySearchForm, _super);
            function RepositorySearchForm() {
                return RepositorySearchForm.__super__.constructor.apply(this, arguments);
            }
            RepositorySearchForm.prototype.defaults = function () {
                return {
                    query: new InputElement({
                        type: 'text',
                        name: 'q'
                    }),
                    submit: new InputElement({
                        type: 'submit',
                        val: 'Go'
                    })
                };
            };
            return RepositorySearchForm;
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
    define('app/models/repository/repository_search', [
        'app/collections/repositories',
        'app/models/repository/repository_search_form'
    ], function (Repositories, RepositorySearchForm) {
        var RepositorySearch;
        return RepositorySearch = function (_super) {
            __extends(RepositorySearch, _super);
            function RepositorySearch() {
                return RepositorySearch.__super__.constructor.apply(this, arguments);
            }
            RepositorySearch.prototype.defaults = function () {
                return {
                    query: '',
                    repositories: new Repositories(),
                    search_form: new RepositorySearchForm()
                };
            };
            RepositorySearch.prototype.initialize = function () {
                var query, repositories;
                query = this.get('query');
                repositories = this.get('repositories');
                repositories.on('sync', function () {
                });
                if (!query) {
                    query = '';
                }
                if (query !== '') {
                    return repositories.search(query);
                }
            };
            return RepositorySearch;
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
    define('app/views/element/list_item_element_view', ['app/views/base_view'], function (BaseView) {
        var ListItemElementView;
        return ListItemElementView = function (_super) {
            __extends(ListItemElementView, _super);
            function ListItemElementView() {
                return ListItemElementView.__super__.constructor.apply(this, arguments);
            }
            ListItemElementView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + ListItemElementView.__super__.className.apply(this, arguments);
            };
            ListItemElementView.prototype.tagName = 'li';
            ListItemElementView.prototype.render = function () {
                this.$el.empty().html(this.model.get('item'));
                return this;
            };
            return ListItemElementView;
        }(BaseView);
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
    define('app/views/element/list_element_view', [
        'app/views/base_view',
        'app/views/element/list_item_element_view'
    ], function (BaseView, ListItemElementView) {
        var ListElementView;
        return ListElementView = function (_super) {
            __extends(ListElementView, _super);
            function ListElementView() {
                return ListElementView.__super__.constructor.apply(this, arguments);
            }
            ListElementView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + ListElementView.__super__.className.apply(this, arguments);
            };
            ListElementView.prototype.tagName = 'ul';
            ListElementView.prototype.render = function () {
                this.$el.empty();
                this.collection.map(function (item) {
                    return new ListItemElementView({ model: item });
                }).forEach(function (_this) {
                    return function (item_view) {
                        return _this.$el.append(item_view.render().el);
                    };
                }(this));
                return this;
            };
            return ListElementView;
        }(BaseView);
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
    define('app/models/element/list_item_element', ['backbone'], function (Backbone) {
        var ListItemElement;
        return ListItemElement = function (_super) {
            __extends(ListItemElement, _super);
            function ListItemElement() {
                return ListItemElement.__super__.constructor.apply(this, arguments);
            }
            ListItemElement.prototype.defaults = function () {
                return { item: '' };
            };
            return ListItemElement;
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
    define('app/collections/element/list_item_elements', [
        'backbone',
        'app/models/element/list_item_element'
    ], function (Backbone, ListItemElement) {
        var ListItemElements;
        return ListItemElements = function (_super) {
            __extends(ListItemElements, _super);
            function ListItemElements() {
                return ListItemElements.__super__.constructor.apply(this, arguments);
            }
            ListItemElements.prototype.model = ListItemElement;
            ListItemElements.prototype.add_item = function (item) {
                return this.add(new ListItemElement({ item: item }));
            };
            return ListItemElements;
        }(Backbone.Collection);
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
    define('app/models/element/link_element', ['backbone'], function (Backbone) {
        var LinkElement;
        return LinkElement = function (_super) {
            __extends(LinkElement, _super);
            function LinkElement() {
                return LinkElement.__super__.constructor.apply(this, arguments);
            }
            LinkElement.prototype.defaults = function () {
                return {
                    text: '',
                    url: ''
                };
            };
            return LinkElement;
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
    define('app/views/element/link_element_view', ['app/views/base_view'], function (BaseView) {
        var LinkElementView;
        return LinkElementView = function (_super) {
            __extends(LinkElementView, _super);
            function LinkElementView() {
                return LinkElementView.__super__.constructor.apply(this, arguments);
            }
            LinkElementView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + LinkElementView.__super__.className.apply(this, arguments);
            };
            LinkElementView.prototype.tagName = 'a';
            LinkElementView.prototype.render = function () {
                this.$el.empty().text(this.model.get('text')).attr('href', this.model.get('url'));
                return this;
            };
            return LinkElementView;
        }(BaseView);
    });
}.call(this));
(function () {
    var __bind = function (fn, me) {
            return function () {
                return fn.apply(me, arguments);
            };
        }, __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
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
    define('app/views/repository/repository_search_result_view', [
        'app/views/base_view',
        'app/views/element/list_element_view',
        'app/collections/element/list_item_elements',
        'app/models/element/link_element',
        'app/views/element/link_element_view'
    ], function (BaseView, ListElementView, ListItemElements, LinkElement, LinkElementView) {
        var RepositorySearchResultView;
        return RepositorySearchResultView = function (_super) {
            __extends(RepositorySearchResultView, _super);
            function RepositorySearchResultView() {
                this.render = __bind(this.render, this);
                return RepositorySearchResultView.__super__.constructor.apply(this, arguments);
            }
            RepositorySearchResultView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + RepositorySearchResultView.__super__.className.apply(this, arguments);
            };
            RepositorySearchResultView.prototype.tagName = 'li';
            RepositorySearchResultView.prototype.initialize = function () {
            };
            RepositorySearchResultView.prototype.render = function () {
                var el_list, el_list_items;
                el_list_items = new ListItemElements([]);
                el_list_items.add_item(new LinkElementView({
                    model: new LinkElement({
                        url: '/repositories/' + this.model.get('name'),
                        text: this.model.get('name')
                    })
                }).render().el);
                el_list_items.add_item(this.model.get('desc'));
                el_list = new ListElementView({ collection: el_list_items });
                this.$el.empty().append(el_list.render().el);
                return this;
            };
            return RepositorySearchResultView;
        }(BaseView);
    });
}.call(this));
(function () {
    var __bind = function (fn, me) {
            return function () {
                return fn.apply(me, arguments);
            };
        }, __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
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
    define('app/views/repository/repository_search_results_view', [
        'app/views/element/list_element_view',
        'app/views/repository/repository_search_result_view'
    ], function (ListElementView, RepositorySearchResultView) {
        var RepositorySearchResultsView;
        return RepositorySearchResultsView = function (_super) {
            __extends(RepositorySearchResultsView, _super);
            function RepositorySearchResultsView() {
                this.render = __bind(this.render, this);
                return RepositorySearchResultsView.__super__.constructor.apply(this, arguments);
            }
            RepositorySearchResultsView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + RepositorySearchResultsView.__super__.className.apply(this, arguments);
            };
            RepositorySearchResultsView.prototype.initialize = function () {
                return this.listenTo(this.collection, 'sync', this.render);
            };
            RepositorySearchResultsView.prototype.render = function () {
                this.$el.empty();
                this.collection.map(function (_this) {
                    return function (result_repo) {
                        return new RepositorySearchResultView({ model: result_repo });
                    };
                }(this)).forEach(function (_this) {
                    return function (result_view) {
                        return _this.$el.append(result_view.render().el);
                    };
                }(this));
                return this;
            };
            return RepositorySearchResultsView;
        }(ListElementView);
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
    define('app/views/element/form_element_view', ['app/views/base_view'], function (BaseView) {
        var FormElementView;
        return FormElementView = function (_super) {
            __extends(FormElementView, _super);
            function FormElementView() {
                return FormElementView.__super__.constructor.apply(this, arguments);
            }
            FormElementView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + FormElementView.__super__.className.apply(this, arguments);
            };
            FormElementView.prototype.tagName = 'form';
            return FormElementView;
        }(BaseView);
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
    define('app/views/element/text_input_element_view', ['app/views/base_view'], function (BaseView) {
        var TextInputElementView;
        return TextInputElementView = function (_super) {
            __extends(TextInputElementView, _super);
            function TextInputElementView() {
                return TextInputElementView.__super__.constructor.apply(this, arguments);
            }
            TextInputElementView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + TextInputElementView.__super__.className.apply(this, arguments);
            };
            TextInputElementView.prototype.tagName = 'input';
            TextInputElementView.prototype.render = function () {
                this.$el.attr('type', 'text').attr('name', this.model.get('name')).val(this.model.get('val'));
                return this;
            };
            return TextInputElementView;
        }(BaseView);
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
    define('app/views/element/submit_input_element_view', [
        'jquery',
        'app/views/base_view'
    ], function ($, BaseView) {
        var SubmitInputElementView;
        return SubmitInputElementView = function (_super) {
            __extends(SubmitInputElementView, _super);
            function SubmitInputElementView() {
                return SubmitInputElementView.__super__.constructor.apply(this, arguments);
            }
            SubmitInputElementView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + SubmitInputElementView.__super__.className.apply(this, arguments);
            };
            SubmitInputElementView.prototype.tagName = 'input';
            SubmitInputElementView.prototype.render = function () {
                this.$el.attr('type', 'submit').val(this.model.get('val'));
                return this;
            };
            return SubmitInputElementView;
        }(BaseView);
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
    define('app/views/repository/repository_search_form_view', [
        'app/views/element/form_element_view',
        'app/views/element/text_input_element_view',
        'app/views/element/submit_input_element_view'
    ], function (FormElementView, TextInputElementView, SubmitInputElementView) {
        var RepositorySearchFormView;
        return RepositorySearchFormView = function (_super) {
            __extends(RepositorySearchFormView, _super);
            function RepositorySearchFormView() {
                return RepositorySearchFormView.__super__.constructor.apply(this, arguments);
            }
            RepositorySearchFormView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + RepositorySearchFormView.__super__.className.apply(this, arguments);
            };
            RepositorySearchFormView.prototype.render = function () {
                var el_query, el_submit;
                this.$el.attr('action', '').attr('method', 'get');
                el_query = new TextInputElementView({ model: this.model.get('query') });
                el_submit = new SubmitInputElementView({ model: this.model.get('submit') });
                this.$el.empty().append('Search: ').append(el_query.render().el).append(el_submit.render().el);
                return this;
            };
            return RepositorySearchFormView;
        }(FormElementView);
    });
}.call(this));
(function () {
    var __bind = function (fn, me) {
            return function () {
                return fn.apply(me, arguments);
            };
        }, __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
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
    define('app/views/repository/repository_search_view', [
        'jquery',
        'app/views/base_view',
        'app/views/repository/repository_search_results_view',
        'app/views/repository/repository_search_form_view'
    ], function ($, BaseView, RepositorySearchResultsView, RepositorySearchFormView) {
        var RepositorySearchView;
        return RepositorySearchView = function (_super) {
            __extends(RepositorySearchView, _super);
            function RepositorySearchView() {
                this.render = __bind(this.render, this);
                return RepositorySearchView.__super__.constructor.apply(this, arguments);
            }
            RepositorySearchView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + RepositorySearchView.__super__.className.apply(this, arguments);
            };
            RepositorySearchView.prototype.initialize = function () {
                var query, repositories;
                query = this.model.get('query');
                repositories = this.model.get('repositories');
                return this.repos_view = new RepositorySearchResultsView({ collection: repositories });
            };
            RepositorySearchView.prototype.render = function () {
                var form, query;
                query = this.model.get('query');
                this.$el.empty();
                form = new RepositorySearchFormView({ model: this.model.get('search_form') });
                if (query === '') {
                    this.$el.append(form.render().el);
                } else {
                    this.$el.append(form.render().el).append(this.repos_view.render().el);
                }
                return this;
            };
            return RepositorySearchView;
        }(BaseView);
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
    define('app/views/index_view', [
        'jquery',
        'underscore',
        'app/views/base_view'
    ], function ($, _, BaseView) {
        var IndexView;
        return IndexView = function (_super) {
            __extends(IndexView, _super);
            function IndexView() {
                return IndexView.__super__.constructor.apply(this, arguments);
            }
            IndexView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + IndexView.__super__.className.apply(this, arguments);
            };
            IndexView.prototype.initialize = function () {
            };
            IndexView.prototype.render = function () {
                this.$el.empty().append(function (_this) {
                    return function () {
                        var el_list, links;
                        el_list = $(document.createElement('ul'));
                        links = _this.model.get('links');
                        _(links).each(function (link_text, link_url) {
                            return el_list.append('<li><a href="' + link_url + '">' + link_text + '</a></li>');
                        });
                        return el_list;
                    };
                }(this));
                return this;
            };
            return IndexView;
        }(BaseView);
    });
}.call(this));
(function () {
    var __bind = function (fn, me) {
            return function () {
                return fn.apply(me, arguments);
            };
        }, __hasProp = {}.hasOwnProperty, __extends = function (child, parent) {
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
    define('app/views/repository/new_repository_view', [
        'jquery',
        'app/views/base_view'
    ], function ($, BaseView) {
        var NewRepositoryView;
        return NewRepositoryView = function (_super) {
            __extends(NewRepositoryView, _super);
            function NewRepositoryView() {
                this.add = __bind(this.add, this);
                return NewRepositoryView.__super__.constructor.apply(this, arguments);
            }
            NewRepositoryView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + NewRepositoryView.__super__.className.apply(this, arguments);
            };
            NewRepositoryView.prototype.intialize = function () {
            };
            NewRepositoryView.prototype.events = { 'click button.add': 'add' };
            NewRepositoryView.prototype.add = function () {
                var deferred, send_data;
                send_data = { url: this.$el.find('input.url').val() };
                return deferred = $.ajax({
                    type: 'post',
                    url: '/api/v0/repositories',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(send_data)
                });
            };
            NewRepositoryView.prototype.render = function () {
                this.$el.empty().append([
                    '<h2>Add new repository</h2>',
                    '<div>',
                    '<p>',
                    'URL: <input type="text" class="url">',
                    '<button class="add">add</button>',
                    '</p>',
                    '</div>'
                ].join(''));
                return this;
            };
            return NewRepositoryView;
        }(BaseView);
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
    define('app/views/repository/repository_detail_view', ['app/views/base_view'], function (BaseView) {
        var RepositoryDetailView;
        return RepositoryDetailView = function (_super) {
            __extends(RepositoryDetailView, _super);
            function RepositoryDetailView() {
                return RepositoryDetailView.__super__.constructor.apply(this, arguments);
            }
            RepositoryDetailView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + RepositoryDetailView.__super__.className.apply(this, arguments);
            };
            RepositoryDetailView.prototype.initialize = function () {
            };
            RepositoryDetailView.prototype.render = function () {
                var el_desc, el_name;
                this.$el.empty();
                el_name = $(document.createElement('div'));
                el_name.append(this.model.get('name'));
                el_desc = $(document.createElement('div'));
                el_desc.append(this.model.get('desc'));
                this.$el.append(el_name);
                this.$el.append(el_desc);
                return this;
            };
            return RepositoryDetailView;
        }(BaseView);
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
    define('app/models/repository/repository_dependency', ['backbone'], function (Backbone) {
        var RepositoryDependency;
        return RepositoryDependency = function (_super) {
            __extends(RepositoryDependency, _super);
            function RepositoryDependency() {
                return RepositoryDependency.__super__.constructor.apply(this, arguments);
            }
            RepositoryDependency.prototype.idAttribute = 'name';
            RepositoryDependency.prototype.initialize = function () {
            };
            return RepositoryDependency;
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
    define('app/collections/repository_dependencies', [
        'backbone',
        'app/models/repository/repository',
        'app/models/repository/repository_dependency'
    ], function (Backbone, Repository, RepositoryDependency) {
        var RepositoryDependencies;
        return RepositoryDependencies = function (_super) {
            __extends(RepositoryDependencies, _super);
            function RepositoryDependencies() {
                return RepositoryDependencies.__super__.constructor.apply(this, arguments);
            }
            RepositoryDependencies.prototype.model = RepositoryDependency;
            RepositoryDependencies.prototype.set_default_options = function () {
                var _base;
                return (_base = this.options).repo_name || (_base.repo_name = '');
            };
            RepositoryDependencies.prototype.url = function () {
                this.set_default_options();
                return '//' + WEB_API_HOST + '/api/' + WEB_API_VERSION + '/repositories/' + this.options.repo_name + '/dependencies';
            };
            RepositoryDependencies.prototype.initialize = function (models, new_options) {
                this.options = new_options;
                return this.options || (this.options = {});
            };
            return RepositoryDependencies;
        }(Backbone.Collection);
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
    define('app/views/repository/repository_dependency_view', ['app/views/base_view'], function (BaseView) {
        var RepositoryDependencyView;
        return RepositoryDependencyView = function (_super) {
            __extends(RepositoryDependencyView, _super);
            function RepositoryDependencyView() {
                return RepositoryDependencyView.__super__.constructor.apply(this, arguments);
            }
            RepositoryDependencyView.prototype.className = function () {
                return '' + this.toSnake() + ' ' + RepositoryDependencyView.__super__.className.apply(this, arguments);
            };
            RepositoryDependencyView.prototype.initialize = function () {
            };
            RepositoryDependencyView.prototype.render = function () {
                var el_name;
                this.$el.empty();
                el_name = $(document.createElement('div'));
                el_name.append(function (_this) {
                    return function () {
                        var anchor;
                        anchor = $(document.createElement('a'));
                        anchor.attr('href', '/repositories/' + _this.model.get('name'));
                        anchor.text(_this.model.get('name'));
                        return anchor;
                    };
                }(this));
                this.$el.append(el_name);
                return this;
            };
            return RepositoryDependencyView;
        }(BaseView);
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
    define('app/app_router', [
        'jquery',
        'backbone',
        'app/models/application',
        'app/views/application_view',
        'app/models/repository/repository_search',
        'app/views/repository/repository_search_view',
        'app/views/index_view',
        'app/views/repository/new_repository_view',
        'app/models/repository/repository',
        'app/views/repository/repository_detail_view',
        'app/collections/repository_dependencies',
        'app/views/repository/repository_dependency_view'
    ], function ($, Backbone, Application, ApplicationView, RepositorySearch, RepositorySearchView, IndexView, NewRepositoryView, Repository, RepositoryDetailView, RepositoryDependencies, RepositoryDependencyView) {
        var AppRouter;
        return AppRouter = function (_super) {
            __extends(AppRouter, _super);
            function AppRouter() {
                return AppRouter.__super__.constructor.apply(this, arguments);
            }
            AppRouter.prototype.initialize = function () {
                this.app = new Application();
                this.app_view = new ApplicationView({ model: this.app });
                return $('body').append(this.app_view.render().el);
            };
            AppRouter.prototype.routes = {
                '': 'show_index',
                'search?q=:query': 'show_search_result',
                'search': 'show_search_form',
                'repositories': 'show_repositories',
                'repositories/new': 'show_new_repository',
                'repositories/:repo_name': 'show_repository'
            };
            AppRouter.prototype.show_new_repository = function () {
                var new_repo_view;
                new_repo_view = new NewRepositoryView();
                return this.app_view.$el.append(new_repo_view.render().el);
            };
            AppRouter.prototype.show_repositories = function () {
                return this.show_search();
            };
            AppRouter.prototype.show_repository = function (repo_name) {
                var repo_model;
                repo_model = new Repository({ name: repo_name });
                return repo_model.fetch().done(function (_this) {
                    return function () {
                        var repo_deps, repo_view;
                        repo_view = new RepositoryDetailView({ model: repo_model });
                        _this.app_view.$el.append(repo_view.render().el);
                        repo_deps = new RepositoryDependencies([], { repo_name: repo_name });
                        repo_view.$el.append('<h2>dependencies</h2>');
                        return repo_deps.fetch().done(function () {
                            return repo_deps.each(function (repo_dep) {
                                var repo_dep_view;
                                if (repo_dep.get('name') === repo_model.get('name')) {
                                    return;
                                }
                                repo_dep_view = new RepositoryDependencyView({ model: repo_dep });
                                return repo_view.$el.append(repo_dep_view.render().el);
                            });
                        });
                    };
                }(this));
            };
            AppRouter.prototype.show_index = function () {
                var index_view;
                index_view = new IndexView({ model: this.app });
                return this.app_view.$el.append(index_view.render().el);
            };
            AppRouter.prototype.show_search_form = function () {
                var repo_search, repo_search_view;
                repo_search = new RepositorySearch();
                repo_search_view = new RepositorySearchView({ model: repo_search });
                return this.app_view.$el.append(repo_search_view.render().el);
            };
            AppRouter.prototype.show_search_result = function (query) {
                var repo_search_model, repo_search_view;
                repo_search_model = new RepositorySearch({ query: query });
                repo_search_view = new RepositorySearchView({ model: repo_search_model });
                return this.app_view.$el.append(repo_search_view.render().el);
            };
            return AppRouter;
        }(Backbone.Router);
    });
}.call(this));