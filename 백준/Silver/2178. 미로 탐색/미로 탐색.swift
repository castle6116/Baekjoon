let st = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (st[0], st[1])

var maze = [[Int]](repeating: [Int](), count: n)

for i in 0..<n {
    let input = readLine()!.map{Int(String($0))!}
    maze[i] = input
}

var stack: [(Int, Int)] = [(0, 0)]

while !stack.isEmpty {
    for i in 0..<stack.count {
        let node = stack.removeFirst()
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        
        for i in 0..<4 {
            let nx = node.0 + dx[i]
            let ny = node.1 + dy[i]
            
            if nx >= 0, nx < m, ny >= 0, ny < n, maze[ny][nx] == 1 {
                maze[ny][nx] = maze[node.1][node.0] + 1
                stack.append((nx, ny))
            }
        }
    }
}

print(maze[n - 1][m - 1])
