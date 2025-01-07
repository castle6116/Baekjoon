import Foundation

func A1912() {
    let numberCount = Int(readLine()!)!
    let numberList = readLine()!.components(separatedBy: " ").map{Int($0)!}
    var dp = [Int]()
    
    if numberCount == 1 {
        print(numberList.first!)
        return
    }
    
    for i in 0..<numberList.count {
        dp.append(numberList[i])
    }
    
    func dps(_ depth: Int) {
        for i in depth..<numberCount {
            if dp[i - 1] + dp[i] > dp[i] {
                dp[i] += dp[i - 1]
            }
        }
    }
    
    _ = dps(1)
    
    print(dp.max()!)
}

A1912()