let st = readLine()!.split(separator: " ").map{Int($0)!}
let (m, n) = (st[0], st[1])

var box = Array(repeating: Array(repeating: 0, count: m), count: n)
var visit = Array(repeating: Array(repeating: false, count: m), count: n)
var visitPoint = [(Int, Int)]()
var count = 0

for i in 0..<n {
    let str = readLine()!.split(separator: " ").map{Int($0)!}
    box[i] = str
    for (index, value) in str.enumerated() {
        if value == -1 {
            visit[i][index] = true
        } else if value == 1 {
            visit[i][index] = true
            visitPoint.append((index, i))
        }
    }
}

func bfs(_ stack: [(Int, Int)]) -> [(Int, Int)] {
    var stack = stack
    var nextSearch = [(Int, Int)]()
    while !stack.isEmpty {
        let node = stack.removeLast()
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        
        for i in 0..<4 {
            let nx = node.0 + dx[i]
            let ny = node.1 + dy[i]
            
            if nx >= 0, nx < m, ny >= 0, ny < n, box[ny][nx] == 0 && !visit[ny][nx] {
                box[ny][nx] = 1
                visit[ny][nx] = true
                nextSearch.append( (nx, ny) )
            }
        }
    }
    
    return nextSearch
}

while !visitPoint.isEmpty {
    visitPoint = bfs(visitPoint)
    count += 1
}

if box.filter { $0.contains(0) }.count > 0 {
    print("-1")
} else {
    print(count - 1)
}
