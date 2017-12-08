//
//  PriorityQueue.swift
//  PrincetonCoursera
//
//  Created by Anton Novoselov on 08/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class UnorderedArrayMaxPQ<T: Comparable> {
    
    private var pq = [T]()
    private var N = 0
    
//    init(capacity: Int, element: T) {
//        self.pq = Array<T>.init(repeating: element, count: capacity)
//    }
    
    public func isEmpty() -> Bool {
        return N == 0
    }
    
    public func insert(x: T) {
        pq.append(x)
        N += 1
    }
    
    public func delMax() -> T {
        
        var max = 0
        
        for i in 1 ..< N {
            if pq[max] < pq[i] {
                max = i
            }
        }
        
        pq.swapAt(max, N - 1)
        
        N -= 1
        
        return pq[N]
    }
}
