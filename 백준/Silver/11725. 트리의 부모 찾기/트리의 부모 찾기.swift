let st = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: st + 1)
var parents = [Int](repeating: 0, count: st + 1)
var visited = [Bool](repeating: false, count: st + 1)

for _ in 0..<st - 1 {
    let node = readLine()!.split(separator: " ").map{Int($0)!}
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])
}


func dfs() {
    var stack = [1]
    
    while !stack.isEmpty {
        let parent = stack.removeLast()
        let nodes = graph[parent]
        
        for i in nodes {
            if !visited[i] {
                visited[i] = true
                parents[i] = parent
                stack.append(i)
            }
        }
    }
}

dfs()
parents[2...st].forEach {
    print($0)
}
