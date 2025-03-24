import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func solution(_ storage:[String], _ requests:[String]) -> Int {
    // 2차원 배열로 창고 상태 초기화
    var warehouse = storage.map { $0.map { String($0) } }
    let height = warehouse.count
    let width = warehouse[0].count
    
    // 지게차로 접근 가능한 컨테이너 찾기
    func findAccessibleContainers(of type: String) -> [Point] {
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        var queue: [Point] = []
        var accessibleContainers: [Point] = []
        
        // 외곽에 있는 모든 칸을 시작점으로 추가
        for y in 0..<height {
            for x in 0..<width {
                if y == 0 || y == height - 1 || x == 0 || x == width - 1 {
                    if warehouse[y][x] == type {
                        accessibleContainers.append(Point(x, y))
                        visited[y][x] = true
                    } else if warehouse[y][x] == "" {
                        queue.append(Point(x, y))
                        visited[y][x] = true
                    }
                }
            }
        }
        
        // BFS로 접근 가능한 컨테이너 찾기
        let dx = [1, -1, 0, 0]
        let dy = [0, 0, 1, -1]
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = current.x + dx[i]
                let ny = current.y + dy[i]
                
                if nx >= 0 && nx < width && ny >= 0 && ny < height && !visited[ny][nx] {
                    visited[ny][nx] = true
                    
                    if warehouse[ny][nx] == type {
                        accessibleContainers.append(Point(nx, ny))
                    } else if warehouse[ny][nx] == "" {
                        queue.append(Point(nx, ny))
                    }
                }
            }
        }
        
        return accessibleContainers
    }
    
    // 지게차로 특정 종류의 접근 가능한 컨테이너 제거
    func removeWithForklift(_ type: String) {
        let containers = findAccessibleContainers(of: type)
        for container in containers {
            warehouse[container.y][container.x] = ""
        }
    }
    
    // 크레인으로 특정 종류의 모든 컨테이너 제거
    func removeWithCrane(_ type: String) {
        for y in 0..<height {
            for x in 0..<width {
                if warehouse[y][x] == type {
                    warehouse[y][x] = ""
                }
            }
        }
    }
    
    // 요청 처리
    for request in requests {
        if request.count == 1 {
            // 지게차 사용 (접근 가능한 컨테이너만 제거)
            removeWithForklift(request)
        } else {
            // 크레인 사용 (모든 컨테이너 제거)
            removeWithCrane(String(request.prefix(1)))
        }
    }
    
    // 남은 컨테이너 수 계산
    var remainingContainers = 0
    for y in 0..<height {
        for x in 0..<width {
            if warehouse[y][x] != "" {
                remainingContainers += 1
            }
        }
    }
    
    return remainingContainers
}
