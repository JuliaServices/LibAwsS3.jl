using LibAwsS3
using Documenter

DocMeta.setdocmeta!(LibAwsS3, :DocTestSetup, :(using LibAwsS3); recursive=true)

makedocs(;
    modules=[LibAwsS3],
    repo="https://github.com/JuliaServices/LibAwsS3.jl/blob/{commit}{path}#{line}",
    sitename="LibAwsS3.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://github.com/JuliaServices/LibAwsS3.jl",
        assets=String[],
        size_threshold=2_000_000, # 2 MB, we generate about 1 MB page
        size_threshold_warn=2_000_000,
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/JuliaServices/LibAwsS3.jl", devbranch="main")
