model = require '../model'

module.exports =
    getUser: (cb) -> cb undefined,this

    addUser: (user, cb) ->
        if this.rank is 'Administrator'
            u = new model.users user
            u.setPassword user.password, (err) ->
                if err?
                    cb err
                else
                    u.save cb
        else
            cb new Error 'Permission Denied'

