module Adar

using HTTP

function run()
    HTTP.listen("0.0.0.0", 8081) do http::HTTP.Stream
        println("SERVER " * ">"^50)
        @show http.message
        @show HTTP.header(http, "Content-Type")
        while !eof(http)
            println("body data: ", String(readavailable(http)))
        end
        HTTP.setstatus(http, 200)
        HTTP.setheader(http, "Foo-Header" => "bar")
        HTTP.startwrite(http)
        write(http, "response body")
        write(http, "more response body")
        println("SERVER " * "<"^50)
    end
end

end # module Adar
