using DelimitedFiles: readdlm

inputfile = joinpath(@__DIR__, "input.txt")
expenses = vec(readdlm(inputfile, Int))
complements = 2020 .- expenses # numbers that could be added to an expense to get 2020
matches = intersect(expenses, complements) # only such numbers that are also in expenses
# there are exactly two such numbers: the unique pair that adds to 2020
println(prod(matches))
