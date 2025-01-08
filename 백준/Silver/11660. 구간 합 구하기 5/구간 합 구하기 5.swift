let st = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (st[0], st[1])
var list = [[Int]](repeating: [Int](repeating: 0, count: n), count: 1)

for _ in 0..<n {
    list.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)

for i in 1...n {
    for j in 1...n {
        dp[i][j] = list[i][j] + dp[i][j - 1] + dp[i - 1][j] - dp[i - 1][j - 1]
    }
}

for _ in 1...m {
    let request = readLine()!.split(separator: " ").map { Int($0)!}
    let (y1, x1) = (request[0], request[1])
    let (y2, x2) = (request[2], request[3])
    
    var result = dp[y2][x2] - dp[y1 - 1][x2] - dp[y2][x1 - 1] + dp[y1 - 1][x1 - 1]
    print(result)
}
