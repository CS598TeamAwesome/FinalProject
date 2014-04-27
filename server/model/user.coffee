mongoose = require 'mongoose'
Schema = mongoose.Schema
bcrypt = require  'bcrypt-nodejs'

UserSchema = new Schema
    name: String
    email: String
    password: String
    rank: { type: String, enum: ['User', 'Modifier', 'Administrator'] }

UserSchema.methods.authenticate = (password, cb) -> bcrypt.compare password, this.password, cb
UserSchema.methods.setPassword = (password, cb) ->
    bcrypt.hash password, (err, hash) ->
        if err?
            cb err
        else
            this.password = hash

User = mongoose.model 'User', UserSchema

module.exports = User
