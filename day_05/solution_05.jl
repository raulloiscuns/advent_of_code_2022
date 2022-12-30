#General function for reading problem's input

function read_input(input::String="input.txt")
    data = readlines(input)

    #Crates info is separated from the rearrangement instructions.
    separation = findall(x->x=="", data)[1]
    cr_info = data[1:separation-1]
    instructions = data[separation+1:end]

    #Crates boxes are created as a list of lists
    indexes = findall(x->tryparse(Int, string(x)) !== nothing, cr_info[end])
    stacks = [[] for _ in 1:length(indexes)]
    for (i, ind) in enumerate(indexes)
        for j in 1:length(cr_info)-1
            if cr_info[j][ind] != ' '
                append!(stacks[i], cr_info[j][ind])
            end
        end
    end

    return stacks, instructions
end

stacks, instructions = read_input()

#PART 1: CrateMover 9000
function fun1(stacks, instructions)
    mod_stacks = deepcopy(stacks)
    regex = r"move (\d+) from (\d+) to (\d+)"
    for instruction in instructions
        number, from, to = map(x->parse(Int, x), match(regex, instruction))
        prepend!(mod_stacks[to], reverse(mod_stacks[from][1:number]))
        deleteat!(mod_stacks[from], 1:number)
    end
    return [string(element[1]) for element in mod_stacks] |> prod
end

top = fun1(stacks, instructions)
println("After the first rearrangement the creates in the top of each stack are $top.")

#PART 2: CrateMover 9001
function fun2(stacks, instructions)
    mod_stacks = deepcopy(stacks)
    regex = r"move (\d+) from (\d+) to (\d+)"
    for instruction in instructions
        number, from, to = map(x->parse(Int, x), match(regex, instruction))
        prepend!(mod_stacks[to], mod_stacks[from][1:number])
        deleteat!(mod_stacks[from], 1:number)
    end
    return [string(element[1]) for element in mod_stacks] |> prod
end

top = fun2(stacks, instructions)
println("After the second rearrangement the creates in the top of each stack are $top.")
