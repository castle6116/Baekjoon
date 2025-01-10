func zoo() {
    let st = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: st + 1)
    dp[0] = 1
    dp[1] = 3

    if st == 1 {
        print(dp[1])
        return
    }

    for i in 2...st {
        dp[i] = (dp[i - 1] * 2 + dp[i - 2]) % 9901
    }

    print(dp[st] % 9901)

}
zoo()
