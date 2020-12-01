using DelimitedFiles: readdlm

expenses = readdlm("puzzle-1-input.txt", Int)
matches = zeros(Int, 3)
complements1 = 2020 .- expenses
for matches[1] in (complements1)
	complements2 = matches[1] .- complements1
	common = intersect(complements2, expenses)
	if ! isempty(common)
		matches[2] = first(common)
		matches[3] = 2020 - sum(matches)
		println(prod(matches))
		break
	end
end
