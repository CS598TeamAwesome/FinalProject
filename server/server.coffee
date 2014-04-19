express = require 'express'
server = express()
config = require 'config'
app = require './app'

server.set 'views', config.app.public
server.set 'view engine', 'jade'

server.use express.static config.app.public

app.setup server

server.listen config.app.port
