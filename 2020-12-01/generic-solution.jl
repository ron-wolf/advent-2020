using DataStructures: LinkedList, list, cons

function copyskipping!(dest::Vector{T}, src::Vector{T}, skip::Integer) where {N, T}
	@assert skip in eachindex(src) "You can only skip an index that is in-bounds"
	copyto!(dest, 1, src, 1, skip-1)
	copyto!(dest, skip, src, skip+1, length(src)-skip)
end

function calc_parts(total::Int, count::Int, items::Vector{Int})::Union{LinkedList{Int}, Nothing}
	if count < 2
		return (count == 0 && total == 0)     ? list()
		     : (count == 1 && total in items) ? list(total)
		     :                                  nothing
	end
	# TODO: add logic for count == 2 that runs through the array from both ends
	
	rest = Vector{Int}(undef, length(items)-1)
	for i in eachindex(items)
		remainder = total - items[i]
		if remainder < 0 continue end
		copyskipping!(rest, items, i) # TODO: remove this item from items permanently
		part = calc_parts(remainder, count-1, rest) # TODO: split this off as a separate Task, or have it add to a Channel
		# IDK: how do you notify all the Tasks associated with a Channel to stop?
		if ! isnothing(part)
			return cons(items[i], part)
		end
	end
end
