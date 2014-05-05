define [
    'rpcClient'
    'components/alert/alert'
    'components/search/search'
    'components/navbar/navbar'
    'components/object/newobject'
    'components/profile/profile'
    'components/results/results'
],
(rpc, alert, search, navbar, newobject, profile, results) ->
    class ViewModel
        init: (cb) =>
            rpc.prefix = 'api'
            rpc.load () =>
                rpc.getUser (u) =>
                    @user = u

                    @user.setPassword = (oldpw, newpw, cb) -> rpc.setPassword(u, oldpw, newpw, cb)

                    @profile = profile(u)
                    @navbar.init()
                    @profile.init?(u)
                    cb?()

        finishCurrent: () =>
            switch
                when @search?.visible() then @search?.finish()
                when @newobject?.visible() then @newobject?.finish()
                when @profile?.visible() then @profile?.finish()
                when @results?.visible() then @results?.finish()


        alert: alert
        search: search
        navbar: navbar
        newobject: newobject
        results: results
        profile: null
        user: null

    new ViewModel()
