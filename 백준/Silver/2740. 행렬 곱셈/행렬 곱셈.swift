let st_A = readLine()!.split(separator: " ").map{Int($0)!}
let (N, M) = (st_A[0], st_A[1])
var list_A = [[Int]]()
var list_B = [[Int]]()
var result = [[Int]]()
for _ in 0..<N {
    list_A.append(readLine()!.split(separator: " ").map{Int($0)!})
}

let st_B = readLine()!.split(separator: " ").map{Int($0)!}
for _ in 0..<st_B[0] {
    list_B.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for (index_n, value) in list_A.enumerated() {
    result.append([Int]())
    for k in 0..<st_B[1] {
        var cal = 0
        for m in 0..<M {
            cal += list_B[m][k] * value[m]
            
        }
        result[index_n].append(cal)
    }
}
result.forEach {
    print($0.map{String($0) + " "}.reduce("", +))
}
