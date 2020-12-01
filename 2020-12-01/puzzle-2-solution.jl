using DelimitedFiles: readdlm

expenses = readdlm("puzzle-1-input.txt", Int)
complements1 = 2020 .- expenses
for complement in complements1
	complements2 = complement .- complements1
	common = intersect(complements2, expenses)
	if ! isempty(common)
		prod_of_matches = complement * prod(common)
		println(prod_of_matches)
		break
	end
end
