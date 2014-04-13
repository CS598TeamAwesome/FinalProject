module.exports.setup = server ->
    server.route('/rpc/:function')
    .get (req, res, next) ->
        func = req.params.function
        args = {}
        
        args[param] = JSON.parse value for param, value of req.query 
        # call rpc
        return
            
    .post (req, res, next) ->
        func = req.params.function
        args = {}
        
        args[param] = JSON.parse value for param, value of req.body
        #call rpc
        return
        
        