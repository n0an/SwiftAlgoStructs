//
//  QueuePrinceton.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 26/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class QueuePrinceton<T> {
    
    private class QueueNode<T> {
        var value: T
        var next: QueueNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    private var first: QueueNode<T>?
    private var last: QueueNode<T>?
    private var counter = 0
    
    var isEmpty: Bool {
        return first == nil
    }
    
    var count: Int {
        return counter
    }
    
    func enqueue(item: T) {
        
        let oldLast = last
        last = QueueNode(value: item)
        last?.next = nil
        
        if isEmpty {
            first = last
        } else {
            oldLast?.next = last
        }
        
        counter += 1
    }
    
    func dequeue() -> T? {
        
        if let item = first?.value {
            
            first = first?.next
            if isEmpty {
                last = nil
            }
            
            counter -= 1
            return item
        }
        
        return nil
    }
    
    public var front: T? {
        return isEmpty ? nil : first?.value
    }
    
}
