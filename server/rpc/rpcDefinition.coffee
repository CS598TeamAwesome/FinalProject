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

    setPassword: (user, oldpw, newpw, cb) ->
        if this.id is user.id
            this.authenticate oldpw, (err, res) ->
                switch
                    when err? then cb err
                    when res
                        this.setPassword newpw, (err) ->
                            if err?
                                cb err
                            else
                                this.save cb
                    else cb new Error 'Incorrect password'



