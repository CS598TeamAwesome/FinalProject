passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
model = require '../model'

module.exports.setup = (server) ->
    server.use passport.initialize()
    server.use passport.session()

    server.route('/auth')
    .post (req, res, next) ->
        (passport.authenticate 'local', (err, user, info) ->
            switch
                when err? then res.redirect '/#/profile'
                when not user then res.redirect '/#/profile'
                else req.logIn user, (err) -> res.redirect '/#/profile'
        ) req, res, next

    server.route('/logout')
    .post (req, res, next) ->
        req.session.destroy()
        req.logout()
        res.redirect '/'

    passport.use new LocalStrategy usernameField: 'email', (username, password, done) ->
        model.users.findOne email: username, (err, user) ->
            switch
                when err? then done err
                when not user then done null, false, message: "No user '#{username}' found."
                else user.authenticate password, (err, success) ->
                    switch
                        when err? then done err
                        when not success then done null, false, message: 'Incorrect password.'
                        else done null, user

    passport.serializeUser (user, done) ->
        delete user.password
        done null, user

    passport.deserializeUser (user, done) ->
        model.users.findOne email: user.email, (err, user) ->
            if err? then done err else done null, user

module.exports.ensure = (req, res, next) ->
    if req.isAuthenticated()
        next()
    else
        req.session.redirectUrl = req.url if req.session?
        res.redirect '/#/profile'
