let n = Int(readLine()!)!
var homes = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: n + 2)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n + 2), count: n + 2)
var result = [Int]()
for i in 1...n {
    let line = readLine()!.map{Int(String($0))!}
    homes[i] = [0] + line + [0]
}

func dfs(_ start: (Int, Int)) -> Int {
    var stack = [(Int, Int)]()
    var count = 1
    stack.append(start)
    visited[start.0][start.1] = true
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        let dx = [0, -1, 0, 1]
        let dy = [1, 0, -1, 0]
        
        for i in 0..<4 {
            let nx = node.0 + dx[i]
            let ny = node.1 + dy[i]
            
            if homes[nx][ny] != 0 && !visited[nx][ny] {
                stack.append((nx, ny))
                count += 1
                visited[nx][ny] = true
            }
        }
    }
    
    return count
}

for i in 1..<homes.count {
    for j in 1..<homes[i].count {
        if homes[i][j] == 1 && !visited[i][j] {
            result.append(dfs((i, j)))
        }
    }
}

print(result.count)
result.sorted(by: <).forEach {
    print($0)
}
