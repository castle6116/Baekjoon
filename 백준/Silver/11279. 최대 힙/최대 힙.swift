//
//  main.swift
//  algorithm
//
//  Created by 김진우 on 2023/02/13.
import Foundation

struct Heap {
    var list: [Int] = [0]
    
    mutating func insert(_ num: Int) {
        list.append(num)
        
        siftUp(from: list.count - 1)
        
    }
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = self.parentIndex(of: childIndex)
        
        // 부모 노드가 존재하고 자식이 부모보다 우선순위가 높을 때까지 반복
        while childIndex > 0 && list[childIndex] > list[parentIndex] {
            list.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }
    
    mutating func pop() -> Int? {
        guard !list.isEmpty else {
            return nil
        }
        
        if list.count == 1 {
            return list.removeFirst()
        }
        
        let returnData = list[0]
        list.swapAt(0, list.count - 1)
        list.removeLast()
        siftDown(from: 0)
        
        return returnData
    }
    
    // 하향식으로 힙 속성 복구
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex)
            let rightChildIndex = self.rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex
            
            // 왼쪽 자식이 존재하고 부모보다 우선순위가 높은 경우
            if leftChildIndex < list.count && list[leftChildIndex] > list[candidateIndex] {
                candidateIndex = leftChildIndex
            }
            
            // 오른쪽 자식이 존재하고 현재 후보보다 우선순위가 높은 경우
            if rightChildIndex < list.count && list[rightChildIndex] > list[candidateIndex] {
                candidateIndex = rightChildIndex
            }
            
            // 교체할 필요가 없으면 종료
            if candidateIndex == parentIndex {
                break
            }
            
            // 부모와 우선순위가 높은 자식을 교체
            list.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
    
    // 부모 노드의 인덱스 계산
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // 왼쪽 자식 노드의 인덱스 계산
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    // 오른쪽 자식 노드의 인덱스 계산
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}

var heap = Heap()

let ct = Int(readLine()!)!
for _ in 0..<ct {
    let st = Int(readLine()!)!
    
    if st == 0 {
        let num = heap.pop()
        if num == nil {
            print("0")
        } else {
            print(num!)
        }
    } else {
        heap.insert(st)
    }
}
