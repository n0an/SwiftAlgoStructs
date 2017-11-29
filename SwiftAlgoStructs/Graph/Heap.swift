//
//  Heap.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 29/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

/*
 note: a generic heap (e.g. priority queue) algorithm. This class functions
 as a min or max heap.
 */

enum HeapType {
    
    case Min
    case Max
}

class Heap<T: Comparable> {
    
    private var heap: Array<T>
    private var heapType: HeapType
    
    //min-heap default initialization
    init(type: HeapType = .Min) {
        
        heap = Array<T>()
        heapType = type
    }
    
    //number of items
    var count: Int {
        return self.heap.count
    }
    
    //the min or max value
    func peek() -> T? {
        
        if heap.count > 0 {
            return heap[0] //the min or max value
        }
        else {
            return nil
        }
    }
    
    //addition of new items
    func enQueue(_ key: T) {
        
        heap.append(key)
        
        var childIndex: Float = Float(heap.count) - 1
        var parentIndex: Int = 0
        
        //calculate parent index
        if  childIndex != 0 {
            parentIndex = Int(floorf((childIndex - 1) / 2))
        }
        
        var childToUse: T
        var parentToUse: T
        
        //use the bottom-up approach
        while childIndex != 0 {
            
            childToUse = heap[Int(childIndex)]
            parentToUse = heap[parentIndex]
            
            //heapify depending on type
            switch heapType {
                
            case .Min:
                //swap child and parent positions
                if childToUse <= parentToUse {
                    heap.swapAt(parentIndex, Int(childIndex))
                }
                
            case .Max:
                //swap child and parent positions
                if childToUse >= parentToUse {
                    heap.swapAt(parentIndex, Int(childIndex))
                }
            }
            
            //reset indices
            childIndex = Float(parentIndex)
            
            if  childIndex != 0 {
                parentIndex = Int(floorf((childIndex - 1) / 2))
            }
        }
    }
}
