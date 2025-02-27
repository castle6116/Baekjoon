import Foundation

func solution(_ sticker:[Int]) -> Int{
    var answer = 0
    var dp = sticker
    var dp2 = sticker
    
    dp.removeLast()
    dp2.removeFirst()
    if sticker.count == 1 {
        return sticker[0]
    }
    for i in 1..<dp.count {
        if i == 1 {
            dp[i] = max(dp[i], dp[i - 1])
            dp2[i] = max(dp2[i], dp2[i - 1])
        } else {
            dp[i] = max(dp[i - 1], dp[i - 2] + dp[i])
            dp2[i] = max(dp2[i - 1], dp2[i - 2] + dp2[i])
        }
        
    }
    
//    print(dp)
//    print(dp2)
//    print("--------")
    return max(dp.last!, dp2.last!)
}