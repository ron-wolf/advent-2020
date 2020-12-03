rows = (collect(line) .== '#' for line in eachline("puzzle-1-input.txt"))
matrix = transpose(hcat(rows...))

pos = [1, 1]
total = 0
const (len, wid) = size(matrix)
while pos[1] <= len
	global total += matrix[CartesianIndex(pos...)]
	global pos .+= [1, 3]
	pos[2] = (pos[2]-1)%wid + 1
end

println(total)
