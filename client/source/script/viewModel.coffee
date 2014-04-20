define [
    'rpcClient'
    'components/alert/alert'
    'components/search/search'
    'components/navbar/navbar'
    'components/object/newobject'
],
(rpc, alert, search, navbar, newobject) ->
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


        alert: alert
        search: search
        navbar: navbar
        newobject: newobject

    vm
