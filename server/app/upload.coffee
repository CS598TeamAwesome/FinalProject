config = require 'config'
multipart = require 'connect-multiparty'
fs = require 'fs'
exec = (require 'child_process').execFile

module.exports.setup = (server) ->
    server.route('/upload')
    .post  multipart(), (req, res, next) ->
        uploadFile req.files, (err, results) ->
            if err?
                res.redirect '/'
            else
                resStr = JSON.stringify results
                resUrl = encodeURIComponent resStr
                res.redirect '/#/results?' + resUrl


# call search executable with file.image.path
uploadFile = (file, cb) ->
    fs.readFile 'results.txt', (err, data) ->
        lines = (data.toString().split '\n') if not err?
        cb err, lines
