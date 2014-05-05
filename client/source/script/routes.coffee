define ['crossroads', 'hasher', 'viewModel'], (crossroads, hasher, vm) ->
    crossroads.routed.add console.log, console

    getParameter = () ->
        query = window.location.search.slice 1
        JSON.parse query


    crossroads.addRoute '', () ->
        vm.finishCurrent()
        vm.search.activate()
        vm.navbar.current 'search'

    crossroads.addRoute 'add', () ->
        vm.finishCurrent()
        vm.newobject.activate()
        vm.navbar.current 'add'

    crossroads.addRoute 'profile', () ->
        vm.finishCurrent()
        vm.profile.activate()
        vm.navbar.current 'profile'

    crossroads.addRoute 'results:?query:', (query) ->
        vm.finishCurrent()
        vm.results.activate JSON.parse Object.keys(query)[0]

    parseHash = (newHash, oldHash) -> crossroads.parse newHash

    hasher.initialized.add parseHash
    hasher.changed.add parseHash
