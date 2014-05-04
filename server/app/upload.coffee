config = require 'config'
multipart = require 'connect-multiparty'
fs = require 'fs'

module.exports.setup = (server) ->
    server.route('/upload')
    .post  multipart(), (req, res, next) ->
        uploadFile req.files, (err) ->
            if err?
                res.redirect '/'
            else
                res.redirect '/#/results'



uploadFile = (file, cb) ->
    fs.readFile file.image.path, (er, data) ->
        newFile = config.uploadDir + '/' + file.image.name
        fs.writeFile newFile, data, (err) ->
            cb err
