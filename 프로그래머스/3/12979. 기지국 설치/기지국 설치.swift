import Foundation

func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
    var answer = 0
    var currentPosition = 1
    let coverage = 2 * w + 1

    for station in stations {
        let leftCoverage = station - w
        if currentPosition < leftCoverage {
            let gap = leftCoverage - currentPosition
            answer += (gap + coverage - 1) / coverage
        }
        
        currentPosition = station + w + 1
    }
    
    if currentPosition <= n {
        let gap = n - currentPosition + 1
        answer += (gap + coverage - 1) / coverage
    }

    return answer
}