MandelBrot
==========

Flask/Sinatra like Micro Framework.

####Usage

```julia
include("app.jl")
using MandelBrot

app = get_app()

get(app, r"^/$") do
    "Hello World!"
end
    
run(app)
```

#### Warning

This is under development. For a real world sinatra-like framework refer to [Morsel](https://github.com/JuliaLang/Morsel.jl)
