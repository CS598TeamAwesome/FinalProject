express = require 'express'
bodyParser = require 'body-parser'
server = express()
config = require 'config'
app = require './app'

server.use bodyParser()

server.use express.static config.app.public

app.setup server

server.listen config.app.port
