let n = Int(readLine()!)!
let m = Int(readLine()!)!
var bus = [[(Int, Int)]](repeating: [], count: n + 1)

for _ in 0..<m {
    let st = readLine()!.split(separator: " ").map{Int($0)!}
    let x = st[0]
    let y = st[1]
    let cost = st[2]
    
    bus[x].append((y, cost))
}

var endPoint = readLine()!.split(separator: " ").map{Int($0)!}
var start = endPoint[0]
var end = endPoint[1]

let nodeCount = n
var distances = [Int](repeating: .max - 100000, count: nodeCount + 1)
distances[start] = 0

var visited = [Bool](repeating: false, count: nodeCount + 1)

for _ in 0...nodeCount {
    var currentNode = -1
    for i in 0...nodeCount {
        if !visited[i] && (currentNode == -1 || distances[i] < distances[currentNode]) {
            currentNode = i
        }
    }
    
    visited[currentNode] = true
    
    for edge in bus[currentNode] {
        let nextNode = edge.0
        let cost = edge.1
        let newCost = distances[currentNode] + cost
        
        if newCost < distances[nextNode] {
            distances[nextNode] = newCost
        }
    }
}
print(distances[end])
