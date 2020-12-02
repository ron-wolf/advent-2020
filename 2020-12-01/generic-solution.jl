using DataStructures: LinkedList

function copyskipping!(dest::Vector{T}, src::Vector{T}, skip::Integer) where {N, T}
	copyto!(dest, 1, src, 1, skip-1)
	copyto!(dest, skip, src, skip+1, length(src)-skip)
end

function calc_parts(total::Int, count::Int, items::Vector{Int})::Union{LinkedList{Int}, Nothing}
	if count == 0
		return (total == 0) ? list() : nothing
	elseif count == 1
		return (total in items) ? list(total) : nothing
	end
	
	rest = Vector{Int}(undef, length(items)-1)
	for i in eachindex(items)
		rem = total - items[i]
		copyskipping!(rest, items, i) # could be made more efficient with a boolean mask
		part = calc_parts(rem, count-1, rest)
		if ! isnothing(part)
			return cons(items[i], part)
		end
	end
end
