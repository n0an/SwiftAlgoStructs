//
//  Bag.swift
//  PrincetonCoursera
//
//  Created by nag on 29/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class Bag<T>: Sequence {
    class LLNodeB<T> {
        var value: T
        var next: LLNodeB?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    private var counter = 0
    
    var count: Int {
        return counter
    }
    
    private var firstNode: LLNodeB<T>?
    
    public func isEmpty() -> Bool {
        return firstNode == nil
    }
    
    public func add(item: T) {
        let oldFirst = firstNode
        firstNode = LLNodeB(value: item)
        firstNode?.next = oldFirst
        
        counter += 1
    }
    
    func makeIterator() -> ListIterator<T> {
        return ListIterator(current: firstNode)
    }
    
    struct ListIterator<T>: IteratorProtocol {
        
        var current: LLNodeB<T>?
        
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
