func sol() {
    let n = Int(readLine()!)!
    var arr =  [[String]](repeating: [String](repeating: "", count: n + 1), count: 1)
    var result = ""
    for _ in 0..<n {
        arr.append([""] + readLine()!.map{String($0)})
    }

    if n == 1 {
        print(arr[1][1])
        return
    }

    func check(_ x_or: Int, _ y_or: Int, _ count: Int) -> String {
        var result = ""
        var item = ""
        
        if count == 2 {
            result = posible(x_or, y_or)
            item = result
        }
        
        for y in stride(from: y_or, to: y_or + count, by: count / 2) where count != 2 {
            for x in stride(from: x_or, to: x_or + count, by: count / 2) where count != 2 {
                result += check(x, y, count / 2)
            }
            item = same(result)
        }
        
        return item
    }

    func same(_ st: String) -> String {
        var flag = true
        var list = st.map{String($0)}
        var def = list[0]
        
        for i in list where def != i {
            flag = false
        }
        return flag ? def : "(" + st + ")"
    }

    func posible(_ x_or: Int, _ y_or: Int) -> String {
        var result = ""
        var def = arr[y_or][x_or]
        var flag = true
        
        for y in y_or...y_or + 1 {
            for x in x_or...x_or + 1 {
                if def != arr[y][x] {
                    flag = false
                }
                result += arr[y][x]
            }
        }
        
        return flag ? def : "(" + result + ")"
    }

    result = check(1, 1, n)

    print(result)
}
sol()