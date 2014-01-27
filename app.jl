module MandelBrot

using HttpServer

export App, get_app, run, get

type App
    handlers::Dict{Any,Any}
end

function get_app()
    App(Dict())
end

function get(handler_function, app, route)
    
    app.handlers[route] = handler_function
end

function log(status, route) 

    println(string("status: $status - route: $route"))
end

function run(app, port=8000)     
    
    http = HttpHandler() do req::Request, res::Response

        for (route, handler_function) in app.handlers

            if ismatch(route, req.resource)

                log(200, req.resource)

                return Response(handler_function())
            end 
        end

        log(404, req.resource)

        Response(404, string("Page Not Found"))
    end

    http.events["error"]  = ( client, err ) -> println( err )
    http.events["listen"] = ( port )        -> println("Listening on $port...")

    http_server = Server( http )
    HttpServer.run( http_server, port )
end

end