api = require './api'
auth = require './auth'

module.exports.setup = (server) ->
    auth.setup(server)
    api.setup(server)

    server.route('/')
    .get (req, res, next) ->
        res.redirect '/unauth.html'

     server.all /// ^ (
        (?!\/
        ( unauth
        | auth
        | bower
        | bootstrap
        | favicon )
    ).)*$
    ///, auth.ensure
