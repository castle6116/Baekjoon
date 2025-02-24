import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var server = [Int](repeating: 1, count: 24)
    var addServerCount = 0
    for (index, value) in players.enumerated() {
        let time = index
        let user = value
        let counter = server[time] * m
        var flag = 0
        
        if counter <= user {
            let addServer = (user - server[time] * m) / m + 1
            flag = addServer
            for i in 0..<k where i + time < 24 {
                server[time + i] += addServer
            }
        }
        if flag != 0 { addServerCount += flag }
    }
    
    return addServerCount
}
