let st = Int(readLine()!)!
let list = readLine()!.split(separator: " ").map{Int($0)!}
var increseList = [list[0]]
var index = 1

func binarySearch(_ num: Int) -> Int {
    var low = 0
    var high = increseList.count - 1
    
    while low < high {
        let middle = (low + high) / 2
        if increseList[middle] > num {
            high = middle
        } else if increseList[middle] < num {
            low = middle + 1
        } else {
            low = -1
            break
        }
    }
    
    return low
}

while index < st {
    let num = list[index]
    
    if increseList.last! < num {
        increseList.append(num)
    } else {
        let location = binarySearch(num)
        if location == -1 {
            index += 1
            continue
        }
        increseList[location] = num
    }
    
    index += 1
}

print(increseList.count)
