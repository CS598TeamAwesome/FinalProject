require.config
    baseUrl: './'
    paths:
        jquery: '../bower_components/jquery/dist/jquery'
        knockout: '../bower_components/knockout-3.1.0/index'
        requirejs: '../bower_components/requirejs/require'
        domready: '../bower_components/domready/ready'

        bloodhound: '../bower_components/typeahead.js/dist/bloodhound'
        typeahead: '../bower_components/typeahead.js/dist/typeahead.jquery'

        bootstrap: '../bower_components/bootstrap/dist/js/bootstrap'

        signals: '../bower_components/js-signals/dist/signals.min'
        crossroads: '../bower_components/crossroads.js/dist/crossroads.min'
        hasher: '../bower_components/hasher/dist/js/hasher.min'

        rpcClient: 'script/rpcClient'
        routes: 'script/routes'
        viewModel: 'script/viewModel'

    shim:
        bootstrap:
            deps: ['jquery']
        bloodhound:
            exports: 'Bloodhound'
        typeahead:
            deps: ['jquery', 'bloodhound']
            exports: 'Typeahead'

require ['jquery', 'knockout', 'viewModel', 'routes', 'domready'], ($, ko, viewModel, routes, domReady) ->
    domReady () ->
        viewModel.init () ->
            ko.applyBindings viewModel
            ($ 'body').show()

