import Foundation

let st = Int(readLine()!)!
var dp = [Int](repeating: 13, count: st + 1)
dp[0] = 0

// 1부터 n까지 DP 계산
for i in 1...st {
    var j = 1
    while j * j <= i {
        dp[i] = min(dp[i], dp[i - j * j] + 1)
        j += 1
    }
}

print(dp[st])
