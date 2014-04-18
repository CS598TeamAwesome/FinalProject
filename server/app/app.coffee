rpc = require '../rpc'

module.exports.setup = (server) ->
    server.route('/api/:function')
    .get (req, res, next) ->
        func = req.params.function
        args = parseArgs req.query
        
        callRpc func, args, null, res
            
    .post (req, res, next) ->
        func = req.params.function
        args = parseArgs req.body

        callRpc func, args, null, res
        
parseArgs = (source) ->
    args = {}
    args[param] = JSON.parse value for param, value of source
    args

callRpc = (func, args, user, res) ->
    try
        rpc.requestRpc func, args, user, (err, ret) -> if err? then rpcError err, res else rpcSuccess ret, res
    catch err
        rpcError err, res
        
rpcError = (err, res) ->
    errString = err.stack
    errNameEnd = errString.indexOf ':'

    errName = errString[...errNameEnd].trim()
    errDesc = errString[errNameEnd+1..].trim()

    errObj = {}
    errObj[errName] = errDesc

    res.writeHead 500, 'Content-Type': 'application/json'
    res.write JSON.stringify errObj
    res.end()

rpcSuccess = (ret, res) ->
    res.writeHead 200, 'Content-Type': 'application/json'
    res.write JSON.stringify ret
    res.end()
