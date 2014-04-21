mongoose = require 'mongoose'
Schema = mongoose.Schema

UserSchema = new Schema
    name: String
    email: String
    password: String
    rank: { type: String, enum: ['User', 'Modifier', 'Administrator'] }

User = mongoose.model 'User', UserSchema

module.exports = User
