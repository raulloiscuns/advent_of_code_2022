#General function for both parts
function fun(l::Int, input::String="input.txt")
    data = readline(input)
    return findfirst([length(unique(data[i:i+l-1]))==l for i in 1:length(data)-l-1])+l-1
end

#PART 1: first star-of-packet marker
part_1 = fun(4)
println("The number of characters to be processed before the first start-of-packet marker is $part_1.")

#PART 2: first star-of-message marker
part_2 = fun(14)
println("The number of characters to be processed before the first start-of-message marker is $part_2.")
