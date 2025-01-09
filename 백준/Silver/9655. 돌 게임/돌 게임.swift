let st = Int(readLine()!)!
var dp = [Bool](repeating: false, count: st + 1)
// false = SK 승 / true = CY 승
dp[0] = true
for i in 1...st {
    dp[i] = !dp[i - 1]
}

if dp[st] == false {
    print("SK")
} else {
    print("CY")
}
