module Orc

using HTTP

function run()
    resp = HTTP.get("http://master:8081")
    println("CLIENT " * ">"^50)
    println(resp.status)
    println(String(resp.body))
    println("CLIENT " * "<"^50)
end

end # module Orc
