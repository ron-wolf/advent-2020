using DelimitedFiles: readdlm

expenses = readdlm("puzzle-1-input.txt", Int)
matches = first( (x, y, z) for x in expenses, y in expenses, z in expenses if x+y+z==2020 )
println(prod(triplet))
