#General function for both parts
function fun(n_knots::Int, input::String="input.txt")
    instructions=map(x->split(x, " "), readlines(input))
    knots_posit=[zeros(2) for _=1:n_knots]
    tail_unique_positions= Set{Tuple{Int, Int}}()
    movements=Dict(["U"=>[0, 1], "D"=>[0,-1], "L"=>[-1,0], "R"=>[1, 0]])
    for (direction, number) in instructions
        for _=1:parse(Int, number)
            knots_posit[1].+= movements[direction]
            for i=2:n_knots
                if ((knots_posit[i]-knots_posit[i-1]).^2 |> sum |> sqrt) > sqrt(2)
                    knots_posit[i].+=sign.(knots_posit[i-1]-knots_posit[i])
                end
            end
            push!(tail_unique_positions, Tuple(knots_posit[end]))
        end
    end
    return tail_unique_positions |> length
end

part_1 = fun(2)
println("The tail of the rope (2 knots) has visited $part_1 unique spots.")

part_2 = fun(10)
println("The tail of the rope (10 knots) has visited $part_2 unique spots.")
