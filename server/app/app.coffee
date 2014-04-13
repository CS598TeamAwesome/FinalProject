module.exports.setup = (server) ->
    server.route('/rpc/:function')
    .get (req, res, next) ->
        func = req.params.function
        args = {}
        
        args[param] = JSON.parse value for param, value of req.query 
        
        res.write "Attemt RPC call for #{func} with args: \n"
        res.write "#{param}: #{value} \n" for param,value of args
        res.end()
        
        return
            
    .post (req, res, next) ->
        func = req.params.function
        args = {}
        
        args[param] = JSON.parse value for param, value of req.body
        #call rpc
        return
        
        