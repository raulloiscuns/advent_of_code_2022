#Function for the problem
function fun(input::String="input.txt")
    height_map, init_pos, final_pos = parse_input(input)
    part_1 = hill_climbing(height_map, init_pos, final_pos)
    init_indexes = findall(x->x==0, height_map)
    part_2 = [hill_climbing(height_map, i, final_pos) for i ∈ init_indexes] |> minimum
    return [part_1, part_2]
end

#Function for parsing the input and obtain a matrix of Ints from 0 (a) to 25 (z)
function parse_input(input::String)
    letter_map = map(x->only.(x), split.(readlines(input), ""))
    letter_map =  reduce(vcat, permutedims.(collect.(letter_map)))
    init_pos = findfirst(==('S'), letter_map)
    final_pos = findfirst(==('E'), letter_map)
    height_map = letter_map.-'a'
    height_map[init_pos]=0; height_map[final_pos]=25
    return height_map, init_pos, final_pos
end

#Dijkstra's Shortest Path Algorithm
function hill_climbing(height_map::Matrix, init_pos::CartesianIndex, final_pos::CartesianIndex)
    nodes_priority = Dict{CartesianIndex, Int}()
    nodes_priority[init_pos]=0
    visited_nodes = Set{CartesianIndex}()
    final_steps=nothing
    while true
        if length(nodes_priority)==0 #avoiding unconnected points (part 2)
            final_steps=typemax(Int)
            break
        end
        steps, current_index = findmin(nodes_priority)
        if current_index == final_pos
            final_steps=steps
            break
        end
        neighbours_indexes = neighbours(current_index, height_map)
        for index ∈ neighbours_indexes
            index ∉ visited_nodes && index ∉ collect(keys(nodes_priority)) && setindex!(nodes_priority, steps+1, index)
        end
        push!(visited_nodes, current_index)
        delete!(nodes_priority, current_index)
    end
    return final_steps
end

#Finding valid neighbours
function neighbours(index::CartesianIndex, height_map::Matrix)
    rows, columns = size(height_map)
    i, j = index.I
    neighbours_index = Set{CartesianIndex}()
    i-1>0 && height_map[index]+1>=height_map[i-1,j] && push!(neighbours_index, CartesianIndex(i-1, j))
    j-1>0 && height_map[index]+1>=height_map[i,j-1] && push!(neighbours_index, CartesianIndex(i, j-1))
    i+1<=rows && height_map[index]+1>=height_map[i+1,j] && push!(neighbours_index, CartesianIndex(i+1, j))
    j+1<=columns && height_map[index]+1>=height_map[i,j+1] && push!(neighbours_index, CartesianIndex(i, j+1))
    return neighbours_index
end

part_1, part_2 = fun()

println("The length of the path from the starting to the end point is $part_1.")
println("The length of the  shortest path from any 'a' point to the end point is $part_2.")
