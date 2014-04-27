mongoose = require 'mongoose'
Schema = mongoose.Schema
bcrypt = require  'bcrypt-nodejs'

UserSchema = new Schema
    name: String
    email: String
    password: String
    rank: { type: String, enum: ['User', 'Modifier', 'Administrator'] }

UserSchema.methods.authenticate = (password, cb) -> bcrypt.compare password, this.password, cb

User = mongoose.model 'User', UserSchema

module.exports = User
