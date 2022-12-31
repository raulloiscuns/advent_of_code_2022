# Advent of Code 2022 :santa:

This repo covers some Julia answers to the [Advent of Code 2022](https://adventofcode.com/) problems. A brief summary of each of the statements of each problem is shown below.

## Day 1: Calorie Counting

The input is a list of numbers (calories) separated by empty lines (that marks the separation between each elf). The goals of the problem are:
- Part 1: Calculate the maximum value of the sum of blocks in the file. 
- Part 2: Calculate the sum of the 3 largest sums of blocks in the file. 

## Day 2: Rock Paper Scissors

The input is a two column list of letters. The first column represent the opponent elf's choice for the game rock (A), paper (B) and scissors (C). The second column represents:
- Part 1: The player's choice for the game rock (X), paper (Y) and scissors (Z).
- Part 2: The result of the game, i.e. if it is a lose (X), tie (Y) or win (Z).

Thus, choosing rock, paper or scissors gives 1, 2 and 3 points, respectively, and loosing, drawing or winning gives 0, 3 and 6 points. The aim is to see what score would be obtained in each case.

## Day 3: Rucksack Reorganization

The input is a list of characters in a singles line, corresponding each line to one rucksack. Each character on that list has a priority number a assigned being 1-26 to a-z and 27-52 to A-Z. 
- Part 1: Calculate the sum of the priorities of the elements that are repeated in each half of the different rucksacks.
- Part 2: Calculate the sum of the priorities of the elements that are repeated in the groups of three rucksacks.

## Day 4: Camp Cleanup

The input is a list of numbers in the format: a-b,x-y, which represent two ranges a:b and x:y.
- Part 1: Calculate how many pairs of ranges are fully contained in their associate range.
- Part 2: Calculate how many pairs of ranges have at least one element in common. 

## Day 5: Supply Stacks

The input is a list of stacks of characters (crates) and a set of instructions to move this characters.
- Part 1: The top crates of each list if the moves are applied to the elements one by one. 
- Part 2: The top crates of each list if the moves are applied to whole blocks (keeping the order).

## Day 6: Tuning Trouble

The input is a string of characters.
- Part 1: Find the index for the first block of 4 different characters (the index of the last number of the block).
- Part 2: Find the index for the first block of 14 different characters (the index of the last number of the block).

## Day 7: No Space Left On Device

The input is a log of commands with information about a filesystem. A more elaborate program by using structs can be created, but in this case I prefer to keep it simple (although some folder structure information, that is not relevant to the problem, is lost).
- Part 1: Find the sum of the sizes of directories with sizes less than 100000.
- Part 2: Find the shortest directory to free up the needed space.
