func check() {
    let n = Int(readLine()!)!
    var dp = [[Int]](repeating: [Int](repeating: 1, count: 10), count: n + 1)
    dp[1][0] = 0

    for i in 0..<10 {
        dp[0][i] = 0
    }

    if n == 1 {
        print(9)
        return
    }

    for i in 2...n {
        for j in 0..<10 {
            if j == 9 {
                dp[i][j] = dp[i - 1][j - 1]
            } else if j == 0 {
                dp[i][j] = dp[i - 1][j + 1]
            } else {
                dp[i][j] = (dp[i - 1][j + 1] + dp[i - 1][j - 1]) % 1000000000
            }
        }
    }
    
    print(dp.last!.reduce(0, +) % 1000000000)

}

check()
