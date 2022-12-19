#PART 1: Strategy Guide 1

#For solve the problem a few considerations need to be taken into account:
# - Rock, paper and scissors are goint to be defined as 0, 1 and 2, respectively.
# - Lose, draw and win will be also enconded as 0, 1 and 2, respectively.
#Being "player" and "elf" player's and elf's choice, it can be seen that the result of the
#game can be obtained as (player-elf+1) mod 3 = result (being 0, 1 or 2, as state before).
#So the total puntuation can be obtained as 3*result + player.

encoder = Dict(
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "X" => 1,
    "Y" => 2,
    "Z" => 3
    )

function fun1(input::String="input.txt")
    score=0
    open(input) do file
        for line in eachline(file)
            elf, player = map(x -> encoder[x], split(line))
            score += 3*mod((player-elf+1),3)+player
        end
    end
    return score
end

score1 = fun1()
println("Total score (part 1): $score1 points")

#PART 1: Strategy Guide 2

#It is easy to obtain this solution using the same mask as in part 1.
#In this case:
# - To obtain the score due to winning or loosing, the encoder -1 is applied to the second
#   column.
# - For obtain player's choice: (elf + result) mod 3 + 1

function fun2(input::String="input.txt")
    puntuation=0
    open(input) do file
        for line in eachline(file)
            elf, result = map(x -> encoder[x], split(line))
            puntuation += 3*(result-1) + mod(elf+result, 3) + 1
        end
    end
    return puntuation
end

score2 = fun2()
println("Total score (part 2): $score2 points")
