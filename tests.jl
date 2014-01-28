using HTTPClient.HTTPC
using Base.Test

#Run example.jl before running the tests

function assert_response(res, expected)
    @test res.http_code == 200
    @test bytestring(res.body) == expected

    println(bytestring(res.body))
    println("Test Passed...")
end

res = get("http://localhost:8000/")
assert_response(res, "This is a GET")

res = get("http://localhost:8000/get")
assert_response(res, "This is also a GET")

res = post("http://localhost:8000/post", "")
assert_response(res, "This is a POST")

res = put("http://localhost:8000/put", "")
assert_response(res,"This is a PUT")

res = delete("http://localhost:8000/delete")
assert_response(res, "This is a DELETE")
