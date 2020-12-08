inputfile = joinpath(@__DIR__, "input.txt")
rows = (collect(line) .== '#' for line in eachline(inputfile))
matrix = transpose(hcat(rows...))

slopes = [[1, 1], [1, 3], [1, 5], [1, 7], [2, 1]]
const (len, wid) = size(matrix)

trees = map(slopes) do slope
	pos = [1, 1]
	total = 0
	while pos[1] <= len
		total += matrix[CartesianIndex(pos...)]
		pos .+= slope
		pos[2] = (pos[2]-1)%wid + 1
	end
	total
end

println(prod(trees))
