using DelimitedFiles: readdlm

expenses = readdlm("puzzle-1-input.txt", Int)
complements = 2020 .- expenses
matches = intersect(expenses, complements)
println(prod(matches))
