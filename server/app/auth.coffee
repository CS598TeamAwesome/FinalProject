passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
model = require '../model'

module.exports.setup = (server) ->
    server.route('/auth')
    .post (req, res, next) ->
        (passport.authenticate 'local', (err, user, info) ->
            switch
                when err? then next err
                when not user? then res.redirect '/login'
                else req.logIn user, (err) -> if err? then next err else res.redirect '/'
        ) req, res, next

    passport.use new LocalStrategy usernameField: 'email', (username, password, done) ->
        model.users.findOne email: username, (err, user) ->
            switch
                when err? then done err
                when not user? then done null, false, message: "No user '#{username}' found."
                else user.authenticate password, (err, success) ->
                    switch
                        when err? then done err
                        when not success then done null, false, message: 'Incorrect password.'
                        else done null, user
