import Foundation

func A9461() {
    let n = Int(readLine()!)!
    var nArray = [Int](repeating: 0, count: 1)
    nArray.append(1)
    nArray.append(1)
    nArray.append(1)
    nArray.append(2)
    nArray.append(2)
    nArray.append(3)
    nArray.append(4)
    nArray.append(5)
    
    for a in nArray.count - 1 ... 100 {
        nArray.append(nArray[a] + nArray[a - 4])
    }
    
    for _ in 0..<n {
        let i = Int(readLine()!)!
        print(nArray[i])
    }
}

A9461()