func solution(_ info: [[Int]], _ n: Int, _ m: Int) -> Int {
    let itemCount = info.count

    // DP 배열 초기화 (메모리 최적화)
    var dp = Array(repeating: Array(repeating: Int.max, count: m), count: n)
    dp[0][0] = 0

    for i in 1...itemCount {
        let aTrace = info[i - 1][0]
        let bTrace = info[i - 1][1]

        // 다음 상태를 저장할 배열 초기화
        var nextDP = Array(repeating: Array(repeating: Int.max, count: m), count: n)

        for a in 0..<n {
            for b in 0..<m {
                if dp[a][b] == Int.max {
                    continue
                }

                // A가 물건 i를 훔치는 경우
                if a + aTrace < n {
                    nextDP[a + aTrace][b] = min(nextDP[a + aTrace][b], dp[a][b] + aTrace)
                }

                // B가 물건 i를 훔치는 경우
                if b + bTrace < m {
                    nextDP[a][b + bTrace] = min(nextDP[a][b + bTrace], dp[a][b])
                }
            }
        }

        dp = nextDP // 현재 상태를 업데이트
    }

    // 결과 계산
    var result = Int.max
    for a in 0..<n {
        for b in 0..<m {
            result = min(result, dp[a][b])
        }
    }

    return result == Int.max ? -1 : result
}
