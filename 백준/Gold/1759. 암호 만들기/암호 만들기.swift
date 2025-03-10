import Foundation

let st = readLine()!.split(separator: " ").map{Int($0)!}
let L = st[0]
let list = readLine()!.split(separator: " ").map{String($0)}.sorted()
let vowels = ["a", "e", "i", "o", "u"]
var result = [String]()

func combination(_ start: Int, _ current: [String]) -> [[String]] {
    if current.count == L {
        let combiVowel = current.filter { vowels.contains($0) }.count
        let consonant = current.filter { !vowels.contains($0) }.count
        if combiVowel < 1 || consonant < 2 {
            return []
        }
        
        return [current]
    }
    
    var result = [[String]]()
    for i in start..<list.count {
        
        result += combination(i + 1, current + [list[i]])
    }
    
    return result
}

let combi = combination(0, []).map{$0.joined()}

combi.forEach {
    print($0)
}
