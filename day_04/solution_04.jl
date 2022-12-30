#PART 1: ranges containing others...

function fun1(input::String="input.txt")
    data = [map(x -> parse(Int, x), eachsplit(d, r"\-|,")) for d in readlines(input)]
    return [intersect(l[1]:l[2], l[3]:l[4]) in (l[1]:l[2], l[3]:l[4]) for l in data] |> sum
end

result1 = fun1()
println("The number of pairs of ranges such that one is in other is $result1.")

#PART 2:

function fun2(input::String="input.txt")
    data = [map(x -> parse(Int, x), eachsplit(d, r"\-|,")) for d in readlines(input)]
    return [length(intersect(l[1]:l[2], l[3]:l[4]))>0 for l in data] |> sum
end

result2 = fun2()
println("The number of pairs of ranges that share at least one number is $result2.")
