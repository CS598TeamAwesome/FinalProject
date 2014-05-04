api = require './api'
auth = require './auth'
upload = require './upload'
config = require 'config'
path = require 'path'

publicDir = path.resolve config.app.public

module.exports.setup = (server) ->
    auth.setup(server)
    api.setup(server)
    upload.setup(server)

    server.route('/')
    .get (req, res, next) ->
        if req.user?
            switch req.user.rank
                when 'User' then res.sendfile publicDir + '/user.html'
                when 'Modifier' then res.sendfile publicDir + '/modifier.html'
                when 'Administrator' then res.sendfile publicDir + '/administrator.html'
        else
            res.sendfile publicDir + '/unauth.html'

     server.all /// ^ (
        (?!\/
        ( unauth
        | auth
        | bower
        | bootstrap
        | favicon )
    ).)*$
    ///, auth.ensure
