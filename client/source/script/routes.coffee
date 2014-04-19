define ['crossroads', 'hasher', 'viewModel'], (crossroads, hasher, vm) ->
    crossroads.routed.add console.log, console

    crossroads.addRoute '', () ->
        vm.search.activate()
        vm.navbar.current('search')

    parseHash = (newHash, oldHash) -> crossroads.parse newHash

    hasher.initialized.add parseHash
    hasher.changed.add parseHash
    hasher.init()
