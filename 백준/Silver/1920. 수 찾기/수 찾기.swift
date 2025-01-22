let st_A = Int(readLine()!)!
let list_A = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)

let st_B = Int(readLine()!)!
let list_B = readLine()!.split(separator: " ").map{Int($0)!}

func search(_ target: Int) -> Int {
    var end = list_A.count - 1
    var start = 0
    
    while start <= end {
        var mid = (start + end) / 2
        if list_A[mid] == target {
            return 1
        }
        
        if list_A[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return 0
}

for i in list_B {
    print(search(i))
}
