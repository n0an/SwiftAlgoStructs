//
//  Heap.swift
//  PrincetonCoursera
//
//  Created by Anton Novoselov on 08/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class Heap {
    public static func sort<T: Comparable>(a: inout [T?]) {

        var N = a.count
        
        a.insert(nil, at: 0)
        
        for k in stride(from: N/2, through: 1, by: -1) {
            sink(&a, k, N)
        }
        
        while N > 1 {
            
            exch(&a, 1, N)
            
            N -= 1
            sink(&a, 1, N)
        }
    }
    
    private static func sink<T: Comparable>(_ a: inout [T?], _ k: Int, _ N: Int) {
        var k = k
        while 2*k <= N {
            
            var j = 2*k
            
            if j < N && less(a, j, j+1) {
                j += 1
            }
            
            if !less(a, k, j) {
                break
            }
            
            exch(&a, k, j)
            
            k = j
        }
    }
    
    private static func less<T: Comparable>(_ a: [T?], _ i: Int, _ j: Int) -> Bool {
        
        return a[i]! < a[j]!
    }
    
    private static func exch<T: Comparable>(_ a: inout [T?], _ i: Int, _ j: Int) {
        
        let t = a[i]
        a[i] = a[j]
        a[j] = t
    }
    
    public static func showArray<T: Comparable>(_ a: inout [T?]) -> String {
        var str = ""
        for element in a {
            if let element = element {
                str += "\(element)"
            }
        }
        return str
    }
}
