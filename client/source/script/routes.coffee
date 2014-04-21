define ['crossroads', 'hasher', 'viewModel'], (crossroads, hasher, vm) ->
    crossroads.routed.add console.log, console

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

    parseHash = (newHash, oldHash) -> crossroads.parse newHash

    hasher.initialized.add parseHash
    hasher.changed.add parseHash
    hasher.init()
