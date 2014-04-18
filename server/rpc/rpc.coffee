rpcDefinition = require './rpcDefinition'

exports.requestRpc = (func, args, user, cb) ->
    switch
        when func of rpcDefinition
            targetFunction = rpcDefinition[func]
            paramNames = getParamNames targetFunction

            argValues = for param in paramNames when param isnt 'cb'
                            if param of args
                                 args[param]
                            else
                                throw new Error "Missing argument for paramater '#{param}' of procedure '#{func}'"
            argValues.push cb

            targetFunction argValues...
        when func is 'listRemoteProcedures'
            procs = for own proc, def of rpcDefinition when typeof def is 'function'
                name: proc
                parameters: (p for p in (getParamNames def) when p isnt 'cb')
            cb null, procs
        else
            throw new Error "No such procedure '#{func}'"


getParamNames = (funcDef) ->
    funcString = funcDef.toString()

    argsStart = (funcString.indexOf '(') + 1
    argsEnd = funcString.indexOf ')'

    args = funcString[argsStart...argsEnd]

    str.trim() for str in (args.split ',')
