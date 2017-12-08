//
//  MaxPQ.swift
//  PrincetonCoursera
//
//  Created by Anton Novoselov on 08/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// Binary Heap using MaxPG
public class MaxPQ<T: Comparable> {
    
    private var pq = [T?]()
    private var N = 0
    
    public var pqArray: [T?] {
        return self.pq
    }
    
    public func isEmpty() -> Bool {
        return N == 0
    }
    
    init() {
        pq = [nil]
    }
    
    public func insert(x: T) {
        N += 1
        pq.append(x)
        swim(N)
    }
    
    public func delMax() -> T? {
        
        let max = pq[1]
        
        exch(1, N)
        
        N -= 1
        
        sink(1)
        
        pq[N+1] = nil
        
        return max
    }
    
    private func swim(_ k: Int) {
        var k = k
        while k > 1 && less(k/2, k) {
            exch(k, k/2)
            k = k/2
        }
    }
    
    private func sink(_ k: Int) {
        
        var k = k
        
        while 2*k <= N {
            
            var j = 2*k
            
            if j < N && less(j, j+1) {
                j += 1
            }
            
            if !less(k, j) {
                break
            }
            
            exch(k, j)
            k = j
        }
    }
    
    private func less(_ i: Int, _ j: Int) -> Bool {
        return pq[i]! < pq[j]!
    }
    
    private func exch(_ i: Int, _ j: Int) {
        let t = pq[i]
        pq[i] = pq[j]
        pq[j] = t
    }
    
}



