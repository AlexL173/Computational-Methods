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

path = Tuple[]

function moveTo(yposition, xposition)
    push!(path, (yposition, xposition))
    visited[yposition][xposition] = length(path)
end

print(length(path))