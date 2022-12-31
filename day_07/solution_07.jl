#General function for both parts

function fun(input::String="input.txt")

    #Read all the command lines
    commands = readlines(input)

    #A space array and a current folder array are going to be created
    #Folder array is used to know the current path, for example if we are in folder b, which
    # is in folder a, two folders are going to be in the folder array: [1,2]. Then if we
    # move to folder c in folder a (not in b), markers [1,3] would be in folder array.
    folder=[]
    space=[]
    folder_count=1

    for line in commands
        if line=="\$ cd .."
            folder=folder[begin:end-1]
        elseif startswith(line, "\$ cd")
            append!(folder, folder_count)
            append!(space, 0)
            folder_count+=1
        elseif startswith(line, r"\d")
            file_size=parse(Int, match(r"\d+", line).match)
            space[folder].+=file_size
        end
    end

    part_1 = [element for element in space if element<=100000] |> sum
    free_space = 70_000_000 - space[1]
    needed_space = 30_000_000 - free_space
    part_2 = [element for element in space if element>=needed_space] |> minimum

    return part_1, part_2
end

part_1, part_2 = fun()

println("The total sum of directories size, which are smaller than 100000, is $part_1.")
println("The total size of the directory that should be deleted is $part_2.")
