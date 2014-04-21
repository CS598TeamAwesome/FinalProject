api = require './api'
auth = require './auth'

module.exports.setup = (server) ->
    auth.setup(server)
    api.setup(server)
