//
//  StackLinkedList.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 25/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// Stack using LinkedList

public class StackLinkedList<T> {
    
    private class LLNodeS<T> {
        var value: T
        var next: LLNodeS?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    private var counter = 0
    
    // the number of items - O(1)
    var count: Int {
        return counter
    }
    
    private var first: LLNodeS<T>?
    
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public func push(item: T) {
        let oldFirst = first
        first = LLNodeS(value: item)
        first?.next = oldFirst
        
        counter += 1
    }
    
    func pop() -> T? {
        if let item = first?.value {
            
            first = first?.next
            
            counter -= 1
            return item
        }
        return nil
    }
}
