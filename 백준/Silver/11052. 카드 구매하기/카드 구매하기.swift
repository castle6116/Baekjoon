let n = Int(readLine()!)!
let cards = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var dp = cards

for i in 1...n {
    
    for j in stride(from: i - 1, through: 1, by: -1) {
        dp[i] = max(dp[i], dp[j] + cards[i - j % i])
    }
    
    dp[i] = max(dp[i], cards[i])
}

print(dp.last!)
