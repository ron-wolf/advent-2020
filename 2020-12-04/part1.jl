using DelimitedFiles: readdlm

valid_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
optional = valid_fields .== "cid"

valid_count = 0

inputfile = joinpath(@__DIR__, "input.txt")
input = read(inputfile, String)
for passport in split(input, "\n\n")
	present = falses(size(valid_fields))
	
	pairs = split(passport, [' ', '\n'])
	for pair in pairs
		field = first(split(pair, ':'))
		ix = findfirst(isequal(field), valid_fields)
		if ! isnothing(ix)
			present[ix] = true
		end
	end
	
	global valid_count += all(present .| optional)
end

println(valid_count)
