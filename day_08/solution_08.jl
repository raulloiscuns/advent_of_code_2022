#PART 1: Visible trees

function fun1(input::String="input.txt")
    forest = map(x->parse.(Int, split(x, "")), readlines(input))
    forest = reduce(vcat,transpose.(forest))
    visible = zeros(Bool, size(forest))
    visible[1,:].=visible[end,:].=visible[:,1].=visible[:, end].=true

    for i in 2:size(visible)[1]-1
        for j in 2:size(visible)[1]-1
            if !any(forest[i, 1:j-1].>=forest[i,j]) ||
                !any(forest[1:i-1, j].>=forest[i,j]) ||
                !any(forest[i, j+1:end].>=forest[i,j]) ||
                !any(forest[i+1:end, j].>=forest[i,j])
                visible[i,j]=true
            end
        end
    end

    return visible |> sum
end

visible_trees = fun1()
println("There are $visible_trees visible trees.")

#PART 2: Scenic score

function fun2(input::String="input.txt")
    forest = map(x->parse.(Int, split(x, "")), readlines(input))
    forest = reduce(vcat,transpose.(forest))
    scoremap = zeros(Int, size(forest))
    for i in 2:size(scoremap)[1]-1
        for j in 2:size(scoremap)[2]-1
            top=bot=left=right=1
            T=forest[i,j]
            while (local k=i-top)>1 && forest[k, j]<T
                top += 1
            end
            while (local k=i+bot)<size(scoremap)[1] && forest[k, j]<T
                bot += 1
            end
            while (local k=j-left)>1 && forest[i, k]<T
                left += 1
            end
            while (local k=j+right)<size(scoremap)[2] && forest[i, k]<T
                right += 1
            end
            scoremap[i,j]=top*bot*left*right
        end
    end
    return scoremap |> maximum
end

highest_ss=fun2()
println("The highest scenic score possible is $highest_ss.")
