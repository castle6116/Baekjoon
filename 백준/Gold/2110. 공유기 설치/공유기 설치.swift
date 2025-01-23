let st_A = readLine()!.split(separator: " ").map { Int($0)! }
let (N, C) = (st_A[0], st_A[1])
var houses = [Int]()

for _ in 0..<N {
    houses.append(Int(readLine()!)!)
}

houses.sort(by: <)
var gap = houses
gap[0] = 0

for i in 1..<houses.count {
    gap[i] -= houses[i - 1]
}

var start = 0
var end = houses.last!

func install(_ target: Int) -> Bool {
    var installList = [0]
    var distance = 0
    
    for i in 1..<houses.count {
        distance += gap[i]
        if distance >= target {
            distance = 0
            installList.append(i)
        }
    }
    
    if installList.count >= C {
        return true
    }
    
    return false
}

while start <= end {
    let mid = (start + end) / 2
    let flag = install(mid)
    if flag {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)
