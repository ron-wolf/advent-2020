function seatid(seatspec::String)
	digit(c) = '0' + (c in ['R','B'])
	binstr = map(digit, seatspec)
	parse(Int, binstr; base=2)
end

inputfile = joinpath(@__DIR__, "input.txt")
maxid = maximum(map(seatid, eachline(inputfile)))
println(maxid)
