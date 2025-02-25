import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var team_a = a.sorted(by: <)
    var team_b = b.sorted(by: <)
    var count = 0
    
    for target in team_a {
        var min = 0
        var max = team_b.count - 1
        
        while min < max {
            let mid = (min + max) / 2
            
            if team_b[mid] <= target {
                min = mid + 1
            } else {
                max = mid
            }
        }
        
        if team_b[min] > target {
            team_b.remove(at: min)
            count += 1
        } else {
            team_b.removeFirst()
        }
    }
    
    return count
}