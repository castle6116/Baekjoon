let st = Int(readLine()!)!
var village = [[Int]](repeating: [Int](repeating: 0, count: st + 2), count: st + 2)
var ns_visited = [[Bool]](repeating: [Bool](repeating: false, count: st + 2), count: st + 2)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: st + 2), count: st + 2)
var maxHeight = 0
var result = 0

for i in 1...st {
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    village[i] = [0] + line + [0]
    let max = line.max()!
    if maxHeight < max {
        maxHeight = max
    }
}

ns_visited = visited

func waterfall(_ target: Int) {
    for i in 1...st {
        for j in 1...st {
            if village[i][j] <= target {
                visited[i][j] = true
            }
        }
    }
}

func dfs(_ point: (Int, Int)) -> Int {
    var stack = [point]
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        
        for i in 0..<4 {
            let nx = node.0 + dx[i]
            let ny = node.1 + dy[i]
            
            if nx < 1 || ny < 1 || nx > st || ny > st {
                continue
            }
            
            if !visited[nx][ny] {
                visited[nx][ny] = true
                stack.append((nx, ny))
            }
        }
    }
    
    return 1
}

for i in 0...maxHeight {
    visited = ns_visited
    waterfall(i)
    
    var point = 0
    for i in 1...st {
        for j in 1...st {
            if !visited[i][j] {
                point += dfs((i, j))
            }
        }
    }
    
    result = max(result, point)
}

print(result)
