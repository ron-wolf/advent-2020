function seatid(seatspec::String)
	digit(c) = '0' + (c in ['R','B'])
	binstr = map(digit, seatspec)
	parse(Int, binstr; base=2)
end

function getmyid(list) where I<:Integer
	sort!(list)
	indices = Iterators.drop(eachindex(list), 1)
	for i in indices
		if list[i] == list[i-1]+2
			return list[i]-1
		end
	end
end

inputfile = joinpath(@__DIR__, "input.txt")
myid = getmyid(seatid.(collect(eachline(inputfile))))
println(myid)
