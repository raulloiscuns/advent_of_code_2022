#General function for the problem
function fun(indexes=[20, 60, 100, 140, 180, 220], input::String="input.txt")
    instructions = readlines(input)
    register=[1]
    value=0
    for instruction ∈ instructions
        if instruction=="noop"
            append!(register, register[end]+value)
            value=0
        else
            append!(register, register[end]+value)
            value = parse(Int, split(instruction, " ")[2])
            append!(register, register[end])
        end
    end
    part_1=[i*register[i+1] for i ∈ indexes] |> sum
    part_2=fun2(register)
    return part_1, part_2
end

#Function for creating the image (second part)
function fun2(register::Vector{Int})
    image = ""
    for cycle ∈ 1:240
        image *= register[cycle+1]-1<=mod1(cycle,40)-1<=register[cycle+1]+1 ? '\u2588' : ' '
        if mod(cycle, 40)==0
            image *= '\n'
        end
    end
    return image
end

part_1, part_2 = fun()
println("The sum of the six selected signal strenghts is $part_1.")

println("\nThe final image is:\n")
println(part_2)
