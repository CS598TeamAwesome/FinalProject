define [
    'rpcClient'
    'components/alert/alert'
    'components/search/search'
    'components/navbar/navbar'
    'components/object/newobject'
    'components/profile/profile'
],
(rpc, alert, search, navbar, newobject, profile) ->
    vm =
        init: (cb) ->
            rpc.prefix = 'api'
            rpc.load () ->
                navbar.init()
                cb?()

        finishCurrent: () ->
            switch
                when search.visible() then search.finish()
                when newobject.visible() then newobject.finish()
                when profile.visible() then profile.finish()


        alert: alert
        search: search
        navbar: navbar
        newobject: newobject
        profile: profile
        user: null

    vm
