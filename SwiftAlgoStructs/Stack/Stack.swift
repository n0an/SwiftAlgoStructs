//
//  Stack.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 26/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// *** Bishop

class Stack<T> {
    
    class StackNode<T> {
        var key: T?
        var next: StackNode?
    }
    
    private var top: StackNode<T>
    private var counter = 0
    
    init() {
        top = StackNode<T>()
    }
    
    // number of items - O(1)
    var count: Int {
        return counter
    }
    
    var isEmpty: Bool {
        return self.count == 0
    }
    
    // add item to the stack - O(1)
    func push(key: T) {
        
        guard top.key != nil else {
            top.key = key
            counter += 1
            return
        }
        
        // create new item
        let childToUse = StackNode<T>()
        childToUse.key = key
        
        childToUse.next = top
        top = childToUse
        
        counter += 1
    }
    
    // remote item from the stack - O(1)
    func pop() {
        
        if let next = top.next {
            top = next
            counter -= 1
        } else {
            top.key = nil
            counter = 0
        }
       
    }
    
    // retrieve the top most item - O(1)
    func peek() -> StackNode<T> {
        return top
    }
    
}

