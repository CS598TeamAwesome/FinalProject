express = require 'express'
server = express()
config = require 'config'
app = require './app'

app.setup server

server.listen config.app.port