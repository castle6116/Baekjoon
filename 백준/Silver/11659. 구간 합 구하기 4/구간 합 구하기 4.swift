import Foundation

let st = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (st[0], st[1])

let num = readLine()!.split(separator: " ").map{Int($0)!}
var sum = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    sum[i] = sum[i - 1] + num[i - 1]
}

for _ in 0..<m {
    let range = readLine()!.split(separator: " ").map{Int($0)!}
    let start = range[0] - 1
    let end = range[1]
    
    print(sum[end] - sum[start])
}
