define [
    'rpcClient'
    'components/alert/alert'
    'components/search/search'
    'components/navbar/navbar'
],
(rpc, alert, search, navbar) ->
    vm =
        init: (cb) ->
            rpc.prefix = 'api'
            rpc.load () ->
                cb?()

        alert: alert
        search: search
        navbar: navbar

    vm
