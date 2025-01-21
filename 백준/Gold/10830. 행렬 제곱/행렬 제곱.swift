let st_A = readLine()!.split(separator: " ").map{Int($0)!}
let (N, M) = (st_A[0], st_A[1])
var list_A = [[Int]]()
for _ in 0..<N {
    list_A.append(readLine()!.split(separator: " ").map{Int($0)!})
}
var list_B = list_A
var result = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var empty = result

func search(_ target: Int) -> [[Int]] {
    if target == 1 {
        return list_A
    }
    
    result = search(target / 2)
    
    if target % 2 == 1 {
        list_B = result
        result = empty
        
        for n in 0..<N {
            for k in 0..<N {
                var cal = 0
                for m in 0..<N {
                    cal += list_B[n][m] * list_B[m][k]
                }
                result[n][k] += cal % 1000
            }
        }
        
        list_B = result
        result = empty
        
        for n in 0..<N {
            for k in 0..<N {
                var cal = 0
                for m in 0..<N {
                    cal += list_B[n][m] * list_A[m][k]
                }
                result[n][k] += cal % 1000
            }
        }
        
    } else {
        list_B = result
        result = empty
        
        for n in 0..<N {
            for k in 0..<N {
                var cal = 0
                for m in 0..<N {
                    cal += list_B[n][m] * list_B[m][k]
                }
                result[n][k] += cal % 1000
            }
        }
    }
    
    return result
}

result = search(M)

result.forEach {
    print($0.map{String($0 % 1000) + " "}.reduce("", +))
}