valid = 0

for line in eachline("puzzle-1-input.txt")
	parts = split(line; limit=3)
	
	limits = UnitRange( parse.(Int, split(parts[1], "-"))... )
	char = first(parts[2])
	pwd = parts[3]
	
	actual = count(isequal(char), pwd)
	global valid += actual in limits
end

println(valid)
