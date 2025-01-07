let n = Int(readLine()!)!
var wine = [0]
for _ in 0..<n {
    wine.append(Int(readLine()!)!)
}

// 예외 처리
if n == 1 {
    print(wine[1])
} else if n == 2 {
    print(wine[1] + wine[2])
} else {
    // dp 배열 정의
    var dp = [Int](repeating: 0, count: n + 1)
    dp[1] = wine[1]
    dp[2] = wine[1] + wine[2]

    for i in 3...n {
        dp[i] = max(dp[i-1], dp[i-2] + wine[i], dp[i-3] + wine[i-1] + wine[i])
    }

    print(dp[n])
}