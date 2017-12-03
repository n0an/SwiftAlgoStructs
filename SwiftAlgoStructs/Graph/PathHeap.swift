//
//  PathHeap.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 29/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class PathHeap {
    
    private var heap: Array<Path>
    
    init() {
        self.heap = Array<Path>()
    }
    
    // the number of frontier items
    var count: Int {
        return self.heap.count
    }
    
    // sort shortest path into a min-heap (heapify)
    func enQueue(key: Path) {
        
        heap.append(key)
        
        var childIndex = Float(heap.count) - 1
        
        var parentIndex = 0
        
        // calculate parent index
        if childIndex != 0 {
            parentIndex = Int(floorf((childIndex - 1) / 2))
        }
        
        var childToUse: Path
        var parentToUse: Path
        
        // use the bottom-up approach
        while childIndex != 0 {
            childToUse = heap[Int(childIndex)]
            parentToUse = heap[parentIndex]
            
            // swap child and parent positions
            if childToUse.total < parentToUse.total {
                heap.swapAt(parentIndex, Int(childIndex))
            }
            
            // reset indices
            childIndex = Float(parentIndex)
            
            if childIndex != 0 {
                parentIndex = Int(floorf((childIndex - 1) / 2))
            }
        }
    }
    
    //remove the minimum path
    func deQueue() {
        
        if heap.count > 0 {
            heap.remove(at: 0)
        }
        
    }
    
    // obtain the minimum path
    func peek() -> Path? {
        if heap.count > 0 {
            return heap[0] // the shorthest path
        } else {
            return nil
        }
    }
    
}

