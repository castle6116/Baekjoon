import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var transWord = [String: [String]]()
    
    let defaults = begin.map {String($0)}
    
    func checkWordsChange(_ st1: [String], _ st2: [String]) -> Bool {
        var visit = [Bool](repeating: false, count: st1.count)
        
        for i in 0..<st1.count {
            if st1[i] == st2[i] {
                visit[i] = true
            }
        }
        
        return visit.filter { $0 == true }.count == st1.count - 1 ? true : false
    }
    for word in words {
        let str = word.map {String($0)}
        if checkWordsChange(defaults, str) {
            transWord[begin, default: []] += [word]
        }
    }
    
    for word1 in words {
        let str = word1.map {String($0)}
        for word2 in words where word1 != word2 {
            let str2 = word2.map {String($0)}
            if checkWordsChange(str, str2) {
                transWord[word1, default: []] += [word2]
            }
        }
    }
    
    func dfs(_ start: String, _ target: String) -> Int {
        var queue: [(String, Int)] = [(start, 0)]
        var visit: Set<String> = []
        visit.insert(start)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            visit.insert(node.0)
            
            for i in transWord[node.0, default: [String]()] where !visit.contains(i) {
                var count = node.1 + 1
                if i == target {
                    return count
                }
                queue.append((i, count))
            }
        }
        return 0
    }
    
    return dfs(begin, target)
}