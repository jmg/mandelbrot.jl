MandelBrot
==========

Flask/Sinatra like Micro Framework.

####Installation

```julia
#Inside julia repl
pkg.add("MandelBrot")
```


####Usage

```julia
using MandelBrot

#Get a MandelBrot app.
app = get_app()

#An http get route
get(app, r"^/$") do
    "This is a GET"
end

#You can also use the route function which is the generic way.
#The third parameter is the HTTP method.
route(app, r"^/get$", "GET") do
    "This is also a GET"
end

#An http post route
post(app, r"^/post$") do
    "This is a POST"
end

#An http put route
put(app, r"^/put$") do
    "This is a PUT"
end

#An http delete route
delete(app, r"^/delete$") do
    "This is a DELETE"
end
    
#Run the app on localhost. The default port is 8000.
run(app, 8000)
```

#### Warning!

This is under development. For a real world sinatra-like framework refer to [Morsel](https://github.com/JuliaLang/Morsel.jl)
