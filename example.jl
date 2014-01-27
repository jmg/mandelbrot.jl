include("app.jl")
using MandelBrot

app = get_app()

get(app, r"^/$") do
    "Hello World!"
end
    
run(app)