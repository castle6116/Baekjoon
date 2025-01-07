import Foundation

func A1904() {
    let n = Int(readLine()!)!
    var nArray = [Int](repeating: 0, count: 1)
    nArray.append(1)
    nArray.append(2)
    
    if n == 1 {
        print("1")
        return
    } else if n == 2 {
        print("2")
        return
    } else {
        for i in 3...n {
            nArray.append((nArray[i - 1] + nArray[i - 2]) % 15746)
        }
    }
    
    print(nArray.last!)
}

A1904()