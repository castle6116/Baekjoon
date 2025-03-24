import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
    
    init(_ location: (Int, Int)) {
        self.x = location.1
        self.y = location.0
    }
}

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    let points = points.map{$0.map {$0 - 1}}
    let routes = routes.map{$0.map {$0 - 1}}
    var moveMent: [Int: [Point: [Int]]] = [:]
    
    func locationSearch(_ route: Int, _ num: Int, _ start: (Int, Int), _ end: (Int, Int)) -> Int {
        var num = num
        var y_cal = start.0 <= end.0 ? 1 : -1
        var x_cal = start.1 <= end.1 ? 1 : -1
        
        for i in stride(from: start.0, to: end.0, by: y_cal) {
            moveMent[num, default: [:]][Point((i, start.1)), default: []] += [route]
            num += 1
        }
        
        for i in stride(from: start.1, through: end.1, by: x_cal) {
            moveMent[num, default: [:]][Point((end.0, i)), default: []] += [route]
            num += 1
        }
        
        return num
    }
    
    for (index, route) in routes.enumerated() {
        var location: (Int, Int)?
        var num = 0
        for nextPoint in route {
            var pt = points[nextPoint]
            guard let lc = location else { 
                location = (pt[0], pt[1])
                continue
            }
            
            num = locationSearch(index + 1, num, lc, (pt[0], pt[1]))
            location = (pt[0], pt[1])
            num -= 1
        }
    }
    
    // moveMent.sorted{$0.key < $1.key}.forEach {
    //     print($0)
    // }
    
    return moveMent.flatMap { $0.value.filter { Set($0.value).count >= 2 }}.count
}