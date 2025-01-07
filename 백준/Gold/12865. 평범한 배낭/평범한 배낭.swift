let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let itemCount = inputs[0]
let target = inputs[1]
var items = [[Int]]()

for _ in 0..<itemCount {
    let item = readLine()!.split(separator: " ").map { Int($0)! }
    items.append(item)
}

// DP 배열 정의: dp[i][j]는 용량이 i일 때, j번째 아이템까지 고려한 최대 가치
var dp = [Int](repeating: 0, count: target + 1)

// DP 계산
for item in 0..<itemCount {
    let weight = items[item][0]
    let value = items[item][1]
    if weight <= target {
        for i in stride(from: target, through: weight, by: -1) {
            dp[i] = max(dp[i], dp[i - weight] + value)
        }
    }
}

print(dp[target])
