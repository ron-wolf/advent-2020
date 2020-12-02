total = 0

for line in eachline("puzzle-1-input.txt")
	parts = split(line; limit=3)
	
	ixs = parse.(Int, split(parts[1], "-"))
	char = first(parts[2])
	pwd = parts[3]
	
	global total += (pwd[ixs[1]] == char) ⊻ (pwd[ixs[2]] == char)
end

println(total)
