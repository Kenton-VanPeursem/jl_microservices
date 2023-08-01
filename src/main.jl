import Pkg
Pkg.instantiate()

import Adar
import Orc
using Base.Threads

service = lowercase(get(ENV, "SERVICE", ""))

if service == "server"
    run(`touch healthcheck`)
    Adar.run()
elseif service == "client"
    Orc.run()
elseif service == ""
    @error "No service specified: use environment SERVICE=[server|client]"
else
    @error "Unknown service specified ($(service)): use environment SERVICE=[server|client]"
end
