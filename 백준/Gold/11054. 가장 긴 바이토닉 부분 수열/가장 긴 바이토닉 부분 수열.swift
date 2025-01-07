import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

// LIS 계산
var LIS = [Int](repeating: 1, count: n)
for i in 1..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            LIS[i] = max(LIS[i], LIS[j] + 1)
        }
    }
}

// LDS 계산
var LDS = [Int](repeating: 1, count: n)
for i in stride(from: n - 2, through: 0, by: -1) {
    for j in stride(from: n - 1, to: i, by: -1) {
        if arr[j] < arr[i] {
            LDS[i] = max(LDS[i], LDS[j] + 1)
        }
    }
}

// 결과 계산
var result = 0
for i in 0..<n {
    result = max(result, LIS[i] + LDS[i] - 1)
}

print(result)
