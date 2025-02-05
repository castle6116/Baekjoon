let st = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, v) = (st[0], st[1], st[2])

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

func bfs(start: Int) -> [Int] {
    var queue = [start]
    var visited = [Bool](repeating: false, count: n + 1)
    var result = [Int]()

    visited[start] = true

    while !queue.isEmpty {
        let node = queue.removeFirst()
        result.append(node)

        for neighbor in graph[node] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append(neighbor)
            }
        }
    }

    return result
}

let dfsResult = dfs(start: v)
let bfsResult = bfs(start: v)

print(dfsResult.map { String($0) }.joined(separator: " "))
print(bfsResult.map { String($0) }.joined(separator: " "))
