define ['crossroads', 'hasher'], (crossroads, hasher) ->
    crossroads.routed.add console.log, console

    crossroads.addRoute '', () ->
        # activate main page

    parseHash = (newHash, oldHash) -> crossroads.parse newHash

    hasher.initialized.add parseHash
    hasher.changed.add parseHash
    hasher.init()
