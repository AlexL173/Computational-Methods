# Define heuristic array
heuristic = [[2, 3, 4, 4, 4, 4, 3, 2],
             [3, 4, 6, 6, 6, 6, 4, 3],
             [4, 6, 8, 8, 8, 8, 6, 4],
             [4, 6, 8, 8, 8, 8, 6, 4],
             [4, 6, 8, 8, 8, 8, 6, 4],
             [4, 6, 8, 8, 8, 8, 6, 4],
             [3, 4, 6, 6, 6, 6, 4, 3],
             [2, 3, 4, 4, 4, 4, 3, 2]]

# Define visited array
visited = [[-1, -1, -1, -1, -1, -1, -1, -1],
           [-1, -1, -1, -1, -1, -1, -1, -1],
           [-1, -1, -1, -1, -1, -1, -1, -1],
           [-1, -1, -1, -1, -1, -1, -1, -1],
           [-1, -1, -1, -1, -1, -1, -1, -1],
           [-1, -1, -1, -1, -1, -1, -1, -1],
           [-1, -1, -1, -1, -1, -1, -1, -1],
           [-1, -1, -1, -1, -1, -1, -1, -1]]

# Define possible moves (ychange, xchange)
moveSet = [(1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1), (-1, 2)]

# Define path Array 
path = []

#Prints the board
function printBoard()
    println("-----------------------")
    for i in 1:8
        for a in 1:8
            #If the number is only 1 digit long, adds a 0 to the front
            if (visited[i][a] <= 9)
                print("0")
                print(visited[i][a])
            else
                print(visited[i][a])
            end
            print(" ")
        end
        println()
    end
    println("-----------------------")
end

#Updates the visited array and path with each move
function moveTo(yposition, xposition)
    push!(path, [yposition, xposition])
    visited[yposition][xposition] = length(path)
end

#Calculates all the available moves at a given location
function getMoves(currentY, currentX)
    moves = []

    #For each of the knight's 8 legal moves, 
    for i in 1:length(moveSet)
        newY = currentY + moveSet[i][1]
        newX = currentX + moveSet[i][2]
        #Checks the move stays in bounds
        if ((newX >= 1) && (newX <= 8) && (newY >= 1) && (newY <= 8))
            #If the new point is also unvisited, append the new location's weight in the hueristic to the moves array
            if(visited[newY][newX] == -1)
                push!(moves, (heuristic[newY][newX]))
            else
            #if already visited, its weight is -1, signifying the move is unavailable
                push!(moves, -1)
            end
        #If out of bound, its "weight" is -1
        else
            push!(moves, -1)
        end
    end
    return moves
end

function makeMoves(currentY, currentX, moves)
    # set intial lowest value to 10, so any legal move is lower 
    lowest = 10
    # set lowest location to -1, this gets changed to an index of the moves array
    lowestLocation = -1
    for i in 1:length(moves)
        # If a move's ts heuristic is lower than the previous value, 
        if (moves[i] > 0 && moves[i] < lowest)
            # Change the lowest value and the index of the lowest move
            lowest = moves[i]
            lowestLocation = i
        end
    end

    if (lowestLocation != -1)
        # If the move is legal (weight not -1) make the move
        newY = currentY + moveSet[lowestLocation][1]
        newX = currentX + moveSet[lowestLocation][2]
        moveTo(newY, newX)
        # Return 1 to show a move was available and has been made
        return 1
    else
        # Return 0 to show that no moves were available
        return 0
    end
end

# Set the starting location
startingX = 3
startingY = 4
# Make first "move"
moveTo(startingX, startingY)

# While moves are available, keep moving
while (makeMoves(path[length(path)][1],path[length(path)][2], getMoves(path[length(path)][1],path[length(path)][2])) == 1)
end

# Print out board
printBoard()
print("Moves: ")
println(length(path))


