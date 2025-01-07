func check() {
    let n = Int(readLine()!)!
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 1)
    dp[1][1] = 1

    if n == 1 {
        print(1)
        return
    }
    
    for i in 2...n {
        dp[i][0] = dp[i - 1][1] + dp[i - 1][0]
        dp[i][1] = dp[i - 1][0]
    }

    print(dp.last!.reduce(0, +))

}
check()
