#PART 1: Rucksack repeated

function fun1(input::String="input.txt")
    priorities = 0
    open(input) do file
        for line in eachline(file)
            item=intersect(line[1:length(line)÷2], line[length(line)÷2+1:end])[1]
            priorities += Int(codepoint(item))-96<=0 ? Int(codepoint(item))-38 : Int(codepoint(item))-96
        end
    end
    return priorities
end

priorities1 = fun1()
println("The sum of the priorities of repeated items is $priorities1")

#PART 2: Rucksack groups

function fun2(input::String="input.txt")
    rucksacks = readlines(input)
    priorities=0
    for i in range(0, length(rucksacks)÷3-1)
        item=intersect(rucksacks[3*i+1], rucksacks[3*i+2], rucksacks[3*i+3])[1]
        priorities += Int(codepoint(item))-96<=0 ? Int(codepoint(item))-38 : Int(codepoint(item))-96
    end
    return priorities
end

priorities2 = fun2()
println("The sum of the priorities of the badges of the elves groups is $priorities2")
