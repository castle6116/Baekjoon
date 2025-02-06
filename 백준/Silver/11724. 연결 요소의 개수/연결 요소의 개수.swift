let st = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (st[0], st[1])
var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited: Set<Int> = []
var result = 0

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map{Int($0)!}
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

func dfs(_ start: Int) -> Int {
    if visited.contains(start) { return 0 }
    var stack = [start]
    
    while !stack.isEmpty {
        let node = stack.popLast()!
        
        for i in graph[node] where !visited.contains(i) {
            stack.append(i)
            visited.insert(i)
        }
    }
    
    return 1
}

for i in 1...n {
    result += dfs(i)
}

print(result)
