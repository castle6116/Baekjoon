let t = Int(readLine()!)!

for _ in 0..<t {
    let st = readLine()!.split(separator: " ").map{Int($0)!}
    let (m, n, k) = (st[0], st[1], st[2])
    var field = [[Int]](repeating: [Int](repeating: 0, count: m + 2), count: n + 2)
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: m + 2), count: n + 2)
    var cabbages = [(Int, Int)]()
    var count = 0
    
    for i in 0..<k {
        var cabbage = readLine()!.split(separator: " ").map{Int($0)!}
        field[cabbage[1] + 1][cabbage[0] + 1] = 1
        cabbages.append((cabbage[1] + 1, cabbage[0] + 1))
    }
    
    for cabbage in cabbages where !visit[cabbage.0][cabbage.1] {
        var stack = [(Int, Int)]()
        stack.append(cabbage)
        count += 1
        while !stack.isEmpty {
            let node = stack.removeLast()
            
            if !visit[node.0][node.1] {
                let dx = [0, -1, 0, 1]
                let dy = [-1, 0, 1, 0]
                
                visit[node.0][node.1] = true
                
                for i in 0..<4 {
                    let nx = node.0 + dx[i]
                    let ny = node.1 + dy[i]
                    
                    if !visit[nx][ny] && field[nx][ny] == 1 {
                        stack.append((nx, ny))
                    }
                }
            }
        }
    }
    print(count)
}
