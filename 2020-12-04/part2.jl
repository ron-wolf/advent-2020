function indexof(elem, coll)::Union{Int,Nothing}
	findfirst(isequal(elem), coll)
end

module Fields # global constants
	using Match: @match, Match
	
	const count = 8
	const names = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"] # ::Vector{String}
	const required = [true, true, true, true, true, true, true, false] # ::BitVector
	const validators = [ # ::Vector{Function}
		byr -> occursin(r"^\d+$", byr) && parse(Int, byr) in 1920:2002,
		iyr -> occursin(r"^\d+$", iyr) && parse(Int, iyr) in 2010:2020,
		eyr -> occursin(r"^\d+$", eyr) && parse(Int, eyr) in 2020:2030,
		function(hgt)
			res = match(r"^(?P<num>\d+)(?P<unit>cm|in)$", hgt)
			isnothing(res) && (return false)
			num = parse(Int, res["num"])
			@match res["unit"] begin
				"cm", if num in 150:193 end => true
				"in", if num in 59:76 end   => true
				_                           => false
			end
		end,
		hcl -> occursin(r"^#[\da-f]{6}$", hcl),
		ecl -> ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"],
		pid -> occursin(r"^\d{9}$", pid),
		cid -> true,
	]
end

valid_count = 0

inputfile = joinpath(@__DIR__, "input.txt")
open(inputfile) do input
	
values = Vector{Union{Missing,String}}(missing, Fields.count)
while ! eof(input)
	passport = readuntil(input, "\n\n") # TODO: will this ever advance past \n\n?
	skipchars(isequal('\n'), input)
	
	for field in split(passport, [' ', '\n'])
		parts = split(field, ':'; limit=2)
		length(parts) < 2 && continue
		
		name, val = parts
		i = indexof(name, Fields.names)
		isnothing(i) && continue
		
		values[i] = val
	end
	
	valid = all(enumerate(values)) do (i, val)
		ismissing(val) ? Fields.required[i] : Fields.validators[i](val)
	end
	if valid
		global valid_count += 1
	end
	fill!(values, missing)
end

end

println(valid_count)
