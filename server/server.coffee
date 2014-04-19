express = require 'express'
bodyParser = require 'body-parser'
server = express()
config = require 'config'
app = require './app'
bunyan = require 'bunyan'
log = bunyan.createLogger
    name: config.log.app_name
    serializers: bunyan.stdSerializers
    streams: [
        type: config.log.type
        path: config.log.path
        period: config.log.period
        count: config.log.count
        level: config.log.level
    ]

server.use (req, res, next) ->
    end = res.end
    req._startTime = new Date()
    res.end = (chunk, encoding) ->
        res.end = end
        res.end chunk, encoding
        log.info req: req, res: res, total_time: new Date() - req._startTime
    next()

server.use bodyParser()

server.use express.static config.app.public

app.setup server

server.listen config.app.port

log.info "Server listening on port #{config.app.port}"
