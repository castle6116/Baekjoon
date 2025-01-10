let st = Int(readLine()!)!
var list = [[Int]](repeating: [Int](repeating: 0, count: st + 1), count: 1)
var dp = [[Int]](repeating: [Int](repeating: -1, count: st + 1), count: st + 1)
for _ in 0..<st {
    list.append([0] + readLine()!.split(separator: " ").map{Int($0)!})
}

func dfs(_ i: Int, _ j: Int) -> Int {
    let x = list[i][j]
    let y = list[i][j]
    
    if i == st && j == st {
        return 1
    }
    
    if dp[i][j] == -1 {
        dp[i][j] = 0
        
        if i + x <= st {
            dp[i][j] += dfs(i + x, j)
        }
        
        if j + y <= st {
            dp[i][j] += dfs(i, j + y)
        }
    }
    return dp[i][j]
}

print(dfs(1, 1))
