let st = readLine()!.split(separator: " ").map{Int($0)!}
let (A, B, C) = (st[0], st[1], st[2])

func search(_ A: Int, _ B: Int, _ C: Int) -> Int {
    var result = 0
    
    if B == 1 {
        return A % C
    }
    
    result = search(A, B/2, C)
    result = (result * result) % C
    
    if B % 2 == 1 {
        result = (result * A) % C
    }
    
    return result
}

print(search(A, B, C))
