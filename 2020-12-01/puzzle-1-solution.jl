using DelimitedFiles: readdlm

expenses = readdlm("puzzle-1-input.txt", Int)
complements = 2020 .- expenses
common = intersect(expenses, complements)
prod_of_matches = prod(common)
println(prod_of_matches)
