using DelimitedFiles: readdlm

expenses = readdlm("input.txt", Int)
remainders = 2020 .- expenses # numbers that could be added to an expense to get 2020
for rem in remainders # one such number
	complements = rem .- expenses # numbers that could be added to an expense to get rem
	matches = intersect(complements, expenses) # only such numbers that are also in expenses
	if ! isempty(matches)
		orig = 2020 - rem
		push!(matches, orig)
		println(prod(matches))
		break
	end
end
