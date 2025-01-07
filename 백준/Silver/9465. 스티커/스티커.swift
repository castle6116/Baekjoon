let T = Int(readLine()!)!
var result = [Int]()

for i in 0..<T {
    var input = Int(readLine()!)!
    var first = readLine()!.split(separator: " ").map{Int($0)!}
    var second = readLine()!.split(separator: " ").map{Int($0)!}
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: input)
    dp[0][0] = first[0]
    dp[0][1] = second[0]
    for i in 1..<input {
        dp[i][0] = max(dp[i - 1][1], dp[i - 1][2]) + first[i]
        dp[i][1] = max(dp[i - 1][0], dp[i - 1][2]) + second[i]
        dp[i][2] = max(dp[i - 1][0], max(dp[i - 1][1], dp[i - 1][2]))
    }
    result.append(dp.last?.max() ?? 0)
}

result.forEach {
    print($0)
}
