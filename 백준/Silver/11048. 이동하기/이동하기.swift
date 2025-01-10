let st = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (st[0], st[1])
var list = [[Int]](repeating: [Int](repeating: 0, count: m), count: 1)
var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 2), count: n + 2)

for _ in 0..<n {
    let st = [0] + readLine()!.split(separator: " ").map{Int($0)!}
    list.append(st)
}

for i in 1...n {
    for j in 1...m {
        dp[i][j] = max(max(dp[i - 1][j], dp[i][j - 1]), dp[i - 1][j - 1]) + list[i][j]
    }
}

print(dp[n][m])

