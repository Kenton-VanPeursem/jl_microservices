try
    using JuliaFormatter
    using Formatting
catch exc
    import Pkg;
    Pkg.add("JuliaFormatter")
    Pkg.add("Formatting")

    using JuliaFormatter
    using Formatting
end

function main()
    files = String[]
    for d in ("src", "test", "libs")
        if isdir(d)
            append!(files, readdir(d; join=true))
        end
    end
    m = maximum(length, files)
    reformatted = 0
    failures = 0
    while !isempty(files)
        r = popfirst!(files)

        # add files from directory
        if isdir(r)
            append!(files, readdir(r; join=true))
            continue
        end

        # skip non-Julia file
        if isfile(r) && !endswith(r, ".jl")
            continue
        end

        try
            reformatted += !(JuliaFormatter.format(r))
        catch exc
            printfmtln("{:<$(m)s} FAILURE--------", r)
            failures += 1
        end
    end

    println("🪄  Reformatted $reformatted files with $failures failures")
end

main()
