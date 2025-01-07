let T = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: T + 1)

for i in 0..<10 {
    dp[1][i] = 1
}

for i in 1...T {
    for j in 0..<10 {
        for k in j..<10 {
            dp[i][j] += dp[i - 1][k]
        }
        dp[i][j] %= 10007
    }
}
print(dp.last!.reduce(0, +) % 10007)
