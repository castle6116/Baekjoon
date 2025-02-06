 let MOD: Int64 = 1_000_000_007

    // 빠른 지수승 계산 함수
    func fastPow(base: Int64, exponent: Int64) -> Int64 {
        var result: Int64 = 1
        var base = base
        var exponent = exponent
        
        while exponent > 0 {
            if exponent % 2 == 1 {
                result = (result * base) % MOD
            }
            base = (base * base) % MOD
            exponent /= 2
        }
        return result
    }

    // 등비수열의 합을 계산하는 함수
    func geometricSeriesSum(a: Int64, b: Int64) -> Int64 {
        if a == 1 {
            return b % MOD
        }
        return (fastPow(base: a, exponent: b) - 1) * fastPow(base: a - 1, exponent: MOD - 2) % MOD
    }
    
    let input_data = readLine()!.split(separator: " ").map{Int64($0)!}
    let A: Int64 = input_data[0]
    let B: Int64 = input_data[1]

    // 결과 출력
    let result = geometricSeriesSum(a: A, b: B)
    print(result)