let st = Int(readLine()!)!
var image = [[String]](repeating: [String](repeating: "", count: st + 2), count: st + 2)
var blindImage = [[String]](repeating: [String](repeating: "", count: st + 2), count: st + 2)
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: st + 2), count: st + 2)
var blindVisited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: st + 2), count: st + 2)
var result = 0
var blind = 0

for i in 1...st {
    let line = readLine()!.map{String($0)}
    image[i] = [""] + line + [""]
    blindImage[i] = [""] +
    line.map{
        if $0 == "G" { return "R" }
        return $0
    } + [""]
}

func dfs(_ x: Int, _ y: Int, _ visited: inout [[Bool]], _ image: inout [[String]]) -> Int {
    if visited[y][x] { return 0 }
    var stack = [(x, y)]
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        let nodeColor = image[node.1][node.0]
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        
        for i in 0..<4 {
            let nx = node.0 + dx[i]
            let ny = node.1 + dy[i]
            
            if !visited[ny][nx] && image[ny][nx] == nodeColor {
                visited[ny][nx] = true
                stack.append((nx, ny))
            }
        }
    }
    
    return 1
}

for i in 1...st {
    for j in 1...st {
        result += dfs(i, j, &visited, &image)
        blind += dfs(i, j, &blindVisited, &blindImage)
    }
}

print(result, blind)
