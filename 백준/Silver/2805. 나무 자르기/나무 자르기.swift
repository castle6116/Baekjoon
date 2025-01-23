let st_A = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (st_A[0], st_A[1])
let woods = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var max = woods.last!
var min = 0

func cutWoods(_ target: Int) -> Int {
    var result = 0
    for wood in woods {
        if wood > target {
            result += wood - target
        }
    }
    return result
}

while min <= max {
    let mid = (min + max) / 2
    let cuts = cutWoods(mid)
    
    if cuts >= M {
        min = mid + 1
    } else {
        max = mid - 1
    }
}

print(max)
