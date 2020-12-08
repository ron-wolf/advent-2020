total = 0

inputfile = joinpath(@__DIR__, "input.txt")
for line in eachline(inputfile)
	parts = split(line; limit=3)
	
	limits = UnitRange( parse.(Int, split(parts[1], "-"))... )
	char = first(parts[2])
	pwd = parts[3]
	
	global total += count(isequal(char), pwd) in limits
end

println(total)
