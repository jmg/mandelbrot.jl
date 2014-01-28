module MandelBrot

using HttpServer

export App, get_app, run, get, post, put, delete, route

type App
    handlers::Dict{Any, Any}
end

function get_app()
    App(Dict())
end

function route(handler_function, app, url, method="GET")

    app.handlers[(url, method)] = handler_function
end

function get(handler_function, app, url)
    
    route(handler_function, app, url)
end

function post(handler_function, app, url)
    
    route(handler_function, app, url, "POST")
end

function put(handler_function, app, url)
    
    route(handler_function, app, url, "PUT")
end

function delete(handler_function, app, url)
    
    route(handler_function, app, url, "DELETE")
end

function log(status, request) 

    resource = request.resource
    method = request.method

    println(string("status: $status - method: $method - route: $resource"))
end

function get_route(app, request)

    for ((route, method), handler_function) in app.handlers

        if ismatch(route, request.resource) && method == request.method

            return handler_function
        end 
    end
end

function response(request, handler, status=200)

    log(status, request)

    if typeof(handler) == Function
        return Response(status, handler())
    end

    return Response(status, handler)
end

function run_server(http, port)

    http.events["error"]  = (client, err) -> println(err)
    http.events["listen"] = (port) -> println("Listening on $port...")

    http_server = Server(http)
    HttpServer.run(http_server, port)
end

function run(app, port=8000)     
    
    http = HttpHandler() do request::Request, res::Response

        handler_function = get_route(app, request)
        if handler_function != nothing
            return response(request, handler_function)
        end
        
        response(request, "Page Not Found", 404)
    end

    run_server(http, port)
end

end