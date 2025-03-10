import Foundation

var city = [[Int]]()

let st = readLine()!.split(separator: " ").map {Int($0)!}
let n = st[0]
let m = st[1]
var homes = [(Int, Int)]()
var stores = [(Int, Int)]()

for y in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    for (x, value) in input.enumerated() {
        if value == 1 {
            homes.append((x, y))
        } else if value == 2 {
            stores.append((x, y))
        }
    }
    
    city.append(input)
}

func generateCombinations(start: Int, current: [Int]) -> [[Int]] {
    if current.count == m {
        return [current]
    }
    
    var result = [[Int]]()
    for i in start..<stores.count {
        result += generateCombinations(start: i+1, current: current + [i])
    }
    return result
}

let combinations = generateCombinations(start: 0, current: [])

var answer = Int.max
for comb in combinations {
    var cityDistance = 0
    for home in homes {
        var minDist = Int.max
        for index in comb {
            let storePos = stores[index]
            let distance = abs(home.0 - storePos.0) + abs(home.1 - storePos.1)
            minDist = min(minDist, distance)
        }
        cityDistance += minDist
    }
    answer = min(answer, cityDistance)
}
print(answer)
