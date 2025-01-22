let st_A = Int(readLine()!)!
let N = st_A
var list_A = [[1, 1], [1, 0]]
var result = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2)

func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2)
    for i in 0..<A.count {
        for j in 0..<A[0].count {
            var sum = 0
            for k in 0..<B.count {
                sum += A[i][k] * B[k][j]
                sum %= 1000000007 // 모듈러 연산을 곱셈 도중에 적용
            }
            result[i][j] = sum
        }
    }
    return result
}

func matrixPower(_ matrix: [[Int]], _ power: Int) -> [[Int]] {
    if power == 1 {
        // 행렬의 각 원소를 % 1000으로 나눈 결과 반환
        return matrix.map { $0.map { $0 % 1000000007 } }
    }
    
    let halfPower = matrixPower(matrix, power / 2)
    let squaredMatrix = multiply(halfPower, halfPower)
    
    if power % 2 == 0 {
        return squaredMatrix
    } else {
        return multiply(squaredMatrix, list_A)
    }
}

result = matrixPower(list_A, N)

print(result[1][0])
