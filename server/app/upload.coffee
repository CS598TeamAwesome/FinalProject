config = require 'config'
multipart = require 'connect-multiparty'
fs = require 'fs'
exec = (require 'child_process').exec

module.exports.setup = (server) ->
    server.route('/upload')
    .post  multipart(), (req, res, next) ->
        uploadFile req.files, (err, results) ->
            if err?
                console.log err
                res.redirect '/'
            else
                resStr = JSON.stringify results
                resUrl = encodeURIComponent resStr
                res.redirect '/#/results?' + resUrl


# call search executable with file.image.path
uploadFile = (file, cb) ->
    console.log file.image.path
    exec '/home/cs598teamawesome/FinalProject/executables/SendQuery ' + file.image.path, { cwd: '/home/cs598teamawesome/FinalProject/executables' }, (err, stdout, stdin) ->
        console.log stdout.toString()
        linesRaw = (stdout.toString().split '\r\n') if not err?
        lines = (l.replace('~/FinalProject/','') for l in lines if not err?)
        cb err,lines
