struct Monkey
    id::Int
    items::Vector{Int}
    update::Function
    test_number::Int
    test_true::Int
    test_false::Int
end

function main(input::String="input.txt")
    monkeys=parse_input(input::String)
    part_1=monkey_game(monkeys, 20, 3)
    part_2=monkey_game(monkeys, 10_000, 1, true)
    return [part_1, part_2]
end

function parse_input(input::String)
    input = split(read(input, String), "\n\n")
    monkeys=[]
    for block ∈ input
        lines=strip.(split(block, "\n"), ' ')
        id=parse(Int, match(r"\d+", lines[1]).match)
        items=parse.(Int, split(match(r"^Starting items: (.*)", lines[2]).captures[1], ","))
        operation=match(r"^Operation: new = old (\*|\+) (\w+|\d+)", lines[3]).captures
        if operation[1]=="*"
            update = operation[2]=="old" ? x-> x * x : x-> x*parse(Int, operation[2])
        else
            update = operation[2]=="old" ? x-> x + x : x-> x+parse(Int, operation[2])
        end
        test_number=parse(Int, match(r"\d+", lines[4]).match)
        test_true=parse(Int, match(r"\d+", lines[5]).match)
        test_false=parse(Int, match(r"\d+", lines[6]).match)
        push!(monkeys, Monkey(id, items, update, test_number, test_true, test_false))
    end
    return monkeys
end

function monkey_game(monkeys::Vector, n_games::Int, div_value::Int, scale::Bool=false)
    processed=zeros(Int, length(monkeys))
    monkeys=deepcopy(monkeys)
    if scale
        factor=[m.test_number for m ∈ monkeys] |> prod
    else
        factor=0
    end
    for _=1:n_games
        game_round!(monkeys, processed, div_value, factor)
    end
    return partialsort!(processed, 1:2, rev=true) |> prod
end

function game_round!(monkeys::Vector, processed::Vector{Int}, div_value::Int, factor::Int)
    for monkey ∈ monkeys
        for item in monkey.items
            processed[monkey.id+1]+=1
            worry_level=monkey.update(item)÷div_value
            if factor!=0
                worry_level=worry_level%factor
            end
            if worry_level%monkey.test_number==0
                append!(monkeys[monkey.test_true+1].items, worry_level)
            else
                append!(monkeys[monkey.test_false+1].items, worry_level)
            end
        end
        deleteat!(monkey.items, 1:length(monkey.items))
    end
    return processed
end

part_1, part_2=main()

println("The level of monkey monkey business in the first situation is $part_1.")
println("The level of monkey monkey business in the second situation is $part_2.")
