let st = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (st[0], st[1])
var list = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: 1)

for i in 0..<n {
    list.append([0] + readLine()!.split(separator: " ").map{Int($0)!})
}

var dp = [[Int]](repeating: [Int](repeating: -1, count: m + 1), count: n + 1)

func dfs(_ x: Int, _ y: Int) -> Int {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    if x == m && y == n {
        return 1
    }
    
    if dp[y][x] != -1 {
        return dp[y][x]
    }
    
    dp[y][x] = 0
    for i in 0..<4 {
        let ex = x + dx[i]
        let ey = y + dy[i]
        
        if ex >= 1 && ex <= m && ey >= 1 && ey <= n && list[y][x] > list[ey][ex] {
            dp[y][x] += dfs(ex, ey)
        }
    }
    
    return dp[y][x]
}

print(dfs(1, 1))

