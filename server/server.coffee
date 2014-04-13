express = require 'express'
server = express()
config = require 'config'
app = require './app'

app.setup server

