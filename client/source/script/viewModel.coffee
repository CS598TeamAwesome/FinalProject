define [
    'rpcClient'
    'components/alert/alert'
    'components/search/search'
    'components/navbar/navbar'
    'components/object/newobject'
    'components/profile/profile'
],
(rpc, alert, search, navbar, newobject, profile) ->
    class ViewModel
        init: (cb) =>
            rpc.prefix = 'api'
            rpc.load () =>
                rpc.getUser (u) =>
                    @user = u
                    @profile = profile(u)
                    @navbar.init()
                    @profile.init?()
                    cb?()

        finishCurrent: () =>
            switch
                when @search?.visible() then @search?.finish()
                when @newobject?.visible() then @newobject?.finish()
                when @profile?.visible() then @profile?.finish()


        alert: alert
        search: search
        navbar: navbar
        newobject: newobject
        profile: null
        user: null

    new ViewModel()
