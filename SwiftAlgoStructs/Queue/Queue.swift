//
//  Queue.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 26/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// *** Bishop

class Queue<T> {
    
    private class QueueNode<T> {
        var key: T?
        var next: QueueNode?
    }
    
    private var top: QueueNode<T>?
    private var counter = 0
    
    var isEmpty: Bool {
        return top?.key == nil
    }
    
    //the number of items
    var count: Int {
        return counter
    }
    
    init() {
        top = QueueNode<T>()
    }
    
    // enqueue the specified object
    func enqueue(key: T) {
        
        // trivial case
        guard top?.key != nil else {
            top?.key = key
            counter += 1
            return
        }
        
        let childToUse = QueueNode<T>()
        
        var current = top
        
        // cyctle through the list
        while current?.next != nil {
            current = current?.next
        }
        
        // append new item
        childToUse.key = key
        current?.next = childToUse
        counter += 1
    }
    
    // retrieve items - O(1)
    func dequeue() -> T? {
        
        // determine key instance
        guard top?.key != nil else {
            return nil
        }
        
        // retrieve and queue the next item
        let queueItem = top?.key
        
        if let nextItem = top?.next {
            top = nextItem
        } else {
            top = QueueNode<T>()
        }
        
        counter -= 1
        
        return queueItem
    }
    
    func peek() -> T? {
        return top?.key
    }
    
}

