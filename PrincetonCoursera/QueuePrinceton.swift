//
//  QueuePrinceton.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 26/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

class QueuePrinceton<T>: Sequence {
    
    class QueueNode<T> {
        var value: T
        var next: QueueNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    private var firstNode: QueueNode<T>?
    private var last: QueueNode<T>?
    private var counter = 0
    
    var isEmpty: Bool {
        return firstNode == nil
    }
    
    var count: Int {
        return counter
    }
    
    func enqueue(item: T) {
        
        let oldLast = last
        last = QueueNode(value: item)
        last?.next = nil
        
        if isEmpty {
            firstNode = last
        } else {
            oldLast?.next = last
        }
        
        counter += 1
    }
    
    func dequeue() -> T? {
        
        if let item = firstNode?.value {
            
            firstNode = firstNode?.next
            if isEmpty {
                last = nil
            }
            
            counter -= 1
            return item
        }
        
        return nil
    }
    
    public var front: T? {
        return isEmpty ? nil : firstNode?.value
    }
    
    func makeIterator() -> ListIterator<T> {
        return ListIterator(current: firstNode)
    }
    
    
    struct ListIterator<T>: IteratorProtocol {
//        typealias Element = T
        
        var current: QueueNode<T>?
        
        public func hasNext() -> Bool {
            return current != nil
        }
        
        mutating func next() -> T? {
            let item = current?.value
            current = current?.next
            return item
        }
        
    }
    
}
