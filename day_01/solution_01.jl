# PART 1: How many calories is the Elf with the most carried calories carrying?

calories = []

open("input.txt") do file
    num = 0
    for line in eachline(file)
        if line==""
            append!(calories, num)
            num = 0
        else
            num += parse.(Int64, line)
        end
    end
end

println("The elf carrying the most calories is carriying $(maximum(calories)) calories.")

#PART 2: How may calories are the 3 top Elfs carrying in total?

calories_top3 = sum(partialsort!(calories, 1:3, rev=true))
println("The top 3 elves are carriying $calories_top3 calories.")
