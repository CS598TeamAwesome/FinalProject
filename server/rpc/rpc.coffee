rpcDefinition = require './rpcDefinition'

exports.requestRpc = (func, args, user, cb) ->
    switch
        when func of rpcDefinition
            targetFunction = rpcDefinition[func]
            paramNames = getParamNames targetFunction

            argValues = for param in paramNames[...-1]
                            if param of args
                                 args[param]
                            else
                                throw new Error "Missing argument for paramater '#{param}' of procedure '#{func}'"
            argValues.push cb

            targetFunction argValues...
        when func is 'listRemoteProcedures'
            procs = name: proc, parameters: (getParamNames def)[...-1] for own proc, def of rpcDefinition when typeof def is 'function'
            cb null, procs
        else
            throw new Error "No such procedure '#{func}'"


getParamNames = (funcDef) ->
    funcString = funcDef.toString()

    argsStart = (funcString.indexOf '(') + 1
    argsEnd = funcString.indexOf ')'

    args = funcString[argsStart...argsEnd]

    str.trim() for str in (args.split ',')
