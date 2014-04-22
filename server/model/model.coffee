mongoose = require 'mongoose'
User = require './user'
config = require 'config'

mongoose.connect config.db.connectionString

module.exports =
    users: User
