let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: n + 1)
for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

for i in 1...n {
    graph[i].sort(by: <)
}

func dfs(start: Int) -> [Int] {
    var stack = [start]
    var visited = [Bool](repeating: false, count: n + 1)
    var result = [Int]()

    while !stack.isEmpty {
        let node = stack.removeLast()
        if !visited[node] {
            visited[node] = true
            result.append(node)

            for neighbor in graph[node].reversed() {
                if !visited[neighbor] {
                    stack.append(neighbor)
                }
            }
        }
    }

    return result
}

print(dfs(start: 1).count - 1)
