define ['jquery'], ($) ->
    dispatch = (url, callstring, cb) ->
        $.ajax
            url: url
            data: callString
            type: 'POST'
            dataType: 'json'
            success: cb
            error rpc.error

    makeRpcCall = (func, args..., cb) ->
        callString = args.reduceRight (cs,a) -> cs + '&' + a
        dispatch "#{rpc.prefix}/#{func}",callString,cb

    rpc =
        prefix: ''

        load: (cb) ->
            makeRpcCall 'listRemoteProcedures', (procInfo) ->
                for proc in procInfo
                    rpc[proc.name] = (args..., cb) ->
                        encodedArgs = param + '=' + encodeURIComponent JSON.stringify args[i] for param, i in proc.parameters
                        makeRpcCall func, encodedArgs, cb

                cb()

        error: (data) -> alert "AJAX Error!\n#{data}"

    rpc
